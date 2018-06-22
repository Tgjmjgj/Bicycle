<?php
/**
 * Контроллер CartController
 * Корзина
 */
include_once('/phpmailer/src/PHPMailer.php');
include_once('/phpmailer/src/Exception.php');
include_once('/phpmailer/src/SMTP.php');

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception; 


class CartController
{

    /**
     * Action для добавления товара в корзину синхронным запросом<br/>
     * (для примера, не используется)
     * @param integer $id <p>id товара</p>
     */
    public function actionAdd($id)
    {
        // Добавляем товар в корзину
        Cart::addProduct($id);

        // Возвращаем пользователя на страницу с которой он пришел
        $referrer = $_SERVER['HTTP_REFERER'];
        header("Location: $referrer");
    }

    /**
     * Action для добавления товара в корзину при помощи асинхронного запроса (ajax)
     * @param integer $id <p>id товара</p>
     */
    public function actionAddAjax($id)
    {
        // Добавляем товар в корзину и печатаем результат: количество товаров в корзине
        echo Cart::addProduct($id);
        return true;
		console.log(data);
    }
    
    /**
     * Action для добавления товара в корзину синхронным запросом
     * @param integer $id <p>id товара</p>
     */
    public function actionDelete($id)
    {
        // Удаляем заданный товар из корзины
        Cart::deleteProduct($id);

        // Возвращаем пользователя в корзину
        header("Location: /cart");
    }

    /**
     * Action для страницы "Корзина"
     */
    public function actionIndex()
    {
        // Список категорий для левого меню
        $categories = Category::getCategoriesList();

        // Получим идентификаторы и количество товаров в корзине
        $productsInCart = Cart::getProducts();

        if ($productsInCart) {
            // Если в корзине есть товары, получаем полную информацию о товарах для списка
            // Получаем массив только с идентификаторами товаров
            $productsIds = array_keys($productsInCart);

            // Получаем массив с полной информацией о необходимых товарах
            $products = Product::getProdustsByIds($productsIds);

            // Получаем общую стоимость товаров
            $totalPrice = Cart::getTotalPrice($products);
        }

        // Подключаем вид
        require_once(ROOT . '/views/cart/index.php');
        return true;
    }
	

    /**
     * Action для страницы "Оформление покупки"
     */
    public function actionCheckout()
    {
        // Получием данные из корзины      
        $productsInCart = Cart::getProducts();

        // Если товаров нет, отправляем пользователи искать товары на главную
        if ($productsInCart == false) {
            header("Location: /");
        }

        // Список категорий для левого меню
        $categories = Category::getCategoriesList();

        // Находим общую стоимость
        $productsIds = array_keys($productsInCart);
        $products = Product::getProdustsByIds($productsIds);
        $totalPrice = Cart::getTotalPrice($products);

        // Количество товаров
        $totalQuantity = Cart::countItems();

        // Поля для формы
		$userId = false;
        $userName = false;
		$userEmail = false;
        $userPhone = false;
        $userComment = false;
        $userAddress = false;
		

        // Статус успешного оформления заказа
        $result = false;

        // Проверяем является ли пользователь гостем
        if (!User::isGuest()) {
            // Если пользователь не гость
            // Получаем информацию о пользователе из БД
            $userId = User::checkLogged();
            $user = User::getUserById($userId);
            $userName = $user['name'];
		}

        // Обработка формы
        if (isset($_POST['submit'])) {
            // Если форма отправлена
            // Получаем данные из формы
            $userName = $_POST['userName'];
			$userEmail = $_POST['userEmail'];
            $userPhone = $_POST['userPhone'];
            $userComment = $_POST['userComment'];
            $userAddress = $_POST['userAddress'];
			
			if (!User::checkEmailExists($userEmail))
			{
				User::register($userName, $userEmail, '' , $userAddress, $userPhone);
			}
			$userId = User::getUserIdByEmail($userEmail);
			
            // Флаг ошибок
            $errors = false;

            // Валидация полей
            if (!User::checkName($userName)) {
                $errors[] = 'Неправильное имя';
            }
            if (!User::checkPhone($userPhone)) {
                $errors[] = 'Неправильный телефон';
            }
            if (!User::checkEmail($userEmail)) {
                $errors[] = 'Неправильная почта';
            }

            if ($errors == false) {
                // Если ошибок нет
                // Сохраняем заказ в базе данных
				
                $result = Order::save($userId, $userComment, $productsInCart);
				var_dump($result);
				//Обновляем свойство количество товаров на складе
				Product::updateAvailability($productsInCart);
				
                if ($result) {
                    // Если заказ успешно сохранен
                    // Оповещаем администратора о новом заказе по почте                
                    $adminEmail = 'bicycle.contacts.shop@gmail.com';
					$today = date("Y-m-d H:i:s");
               
			   $message = "Сообщение от ". $userName. ", проживающего по адресу ". $userAddress. PHP_EOL.  $userComment;
                try {
					$mail = new PHPMailer(true);
					//$mail->isHTML(true);
					$mail->CharSet = 'UTF-8';
					$mail->isSMTP();
					$mail->Host = 'smtp.mail.ru';
					$mail->SMTPAuth = true;
					$mail->Username = 'gruppa-803@mail.ru';
					$mail->Password = '18092017@';
					$mail->SMTPSecure = 'ssl';
					$mail->Port = 465;
					$mail->SMTPDebug = 0;
					
					$mail->setFrom('gruppa-803@mail.ru');
					$mail->addAddress($adminEmail);
					
					$mail->Subject = 'Уведомление о заказе';
					$mail->Body    = $message;
					
					$mail->send();
				} catch (Exception $e) {
					echo 'Message could not be sent. Mailer Error: ', $mail->ErrorInfo;
				}
                //$result = mail($adminEmail, $subject, $message, $from);

                    // Очищаем корзину
                    Cart::clear();
                }
            }
        }

        // Подключаем вид
        require_once(ROOT . '/views/cart/checkout.php');
        return true;
    }

}
