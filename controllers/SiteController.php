<?php

/**
 * Контроллер CartController
 */

include_once('/phpmailer/src/PHPMailer.php');
include_once('/phpmailer/src/Exception.php');
include_once('/phpmailer/src/SMTP.php');

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception; 


class SiteController
{

    /**
     * Action для главной страницы
     */
    public function actionIndex()
    {
        // Список категорий для левого меню
        $categories = Category::getCategoriesList();

        // Список последних товаров
        $latestProducts = Product::getLatestProducts(6);

        // Список товаров для слайдера
        $sliderProducts = Product::getRecommendedProducts();

        // Подключаем вид
        require_once(ROOT . '/views/site/index.php');
        return true;
    }
	
	public function actionFind()
    {
		$find_query = $_GET["q"];
        // Список последних товаров
        $findProducts = Product::findProducts($find_query);

        // Подключаем вид
        require_once(ROOT . '/views/site/find.php');
        return true;
    }

    /**
     * Action для страницы "Контакты"
     */
    public function actionContact()
    {

        // Переменные для формы
        $userEmail = false;
        $userText = false;
        $result = false;

        // Обработка формы
        if (isset($_POST['submit'])) {
            // Если форма отправлена 
            // Получаем данные из формы
            $userEmail = $_POST['userEmail'];
            $userText = $_POST['userText'];

            // Флаг ошибок
            $errors = false;

            // Валидация полей
            if (!User::checkEmail($userEmail)) {
                $errors[] = 'Неправильный email';
            }

            if ($errors == false) {
                // Если ошибок нет
                // Отправляем письмо администратору 
                $adminEmail = 'bicycle.contacts.shop@gmail.com';
                $message = "Текст: {$userText}. От {$userEmail}";
                $subject = 'Тема письма';
				/*$from = "From: a-av@tut.by";
				try {
					$mail = new PHPMailer(true);
					$mail->CharSet = 'UTF-8';
					$mail->isSMTP();
					$mail->Host = 'smtp.yandex.by';
					$mail->SMTPAuth = true;
					$mail->Username = 'a-av@tut.by';
					$mail->Password = 'alexwinner79';
					$mail->SMTPSecure = 'ssl';
					$mail->Port = 465;
					$mail->SMTPDebug = 0;
					
					$mail->setFrom('a-av@tut.by');
					$mail->addAddress($adminEmail);
					
					$mail->Subject = 'Письмо от клиента';
					$mail->Body    = $message;
					
					$mail->send();
				} catch (Exception $e) {
					echo 'Message could not be sent. Mailer Error: ', $mail->ErrorInfo;
				}
                //$result = mail($adminEmail, $subject, $message, $from);
                $result = true;*/
                $from = "From: gruppa-803@mail.ru";
                try {
                    $mail = new PHPMailer(true);
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
                    
                    $mail->Subject = 'Письмо от клиента';
                    $mail->Body    = $message;
                    
                    $mail->send();
                } catch (Exception $e) {
                    echo 'Message could not be sent. Mailer Error: ', $mail->ErrorInfo;
                }
                //$result = mail($adminEmail, $subject, $message, $from);
                $result = true;
            }
        }

        // Подключаем вид
        require_once(ROOT . '/views/site/contact.php');
        return true;
    }
    
    /**
     * Action для страницы "О магазине"
     */
    public function actionAbout()
    {
        // Подключаем вид
        require_once(ROOT . '/views/site/about.php');
        return true;
    }

}
