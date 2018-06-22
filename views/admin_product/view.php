<?php include ROOT . '/views/layouts/header_admin.php'; ?>

<section>
    <div class="container">
        <div class="row">

            <br/>

            <div class="breadcrumbs">
                <ol class="breadcrumb">
                    <li><a href="/admin">Админпанель</a></li>
                    <li><a href="/admin/order">Управление заказами</a></li>
                    <li class="active">Просмотр заказов</li>
                </ol>
            </div>


            <h4>Заказы по товару:</h4>

            <table class="table-admin-medium table-bordered table-striped table ">
                <tr>
                    <th>ID заказа</th>
                    <th>ID покупателя</th>
                    <!-- <th>ID покупателя</th> -->
                    <th>Имя заказчика</th>
                    <th>Телефонный номер</th>
                    <th>Адрес</th>
                    <th>Комментарий пользователя</th>
                    <th style="min-width: 100px;">Товары</th>
                    <th style="width: 100px;">Дата</th>
                    <th>Статус</th>
                </tr>
                <?php foreach ($orders as $ord): ?>
                    <tr>
                        <td><?php echo $ord['id']; ?></td>
                        <td><?php echo $ord['user_id']; ?></td>
                        <!-- <td><?php echo $ord['user_id']; ?></td> -->
                        <td><?php echo $ord['user_name']; ?></td>
                        <td><?php echo $ord['user_phone']; ?></td>
                        <td><?php echo $ord['user_address']; ?></td>
                        <td><?php echo $ord['user_comment']; ?></td>
                        <td><?php echo Product::transformProducts($ord['products']); ?></td>
                        <td><?php echo $ord['date']; ?></td>
                       <td><?php echo Order::getStatusText($ord['status']); ?></td>
                    </tr>
                <?php endforeach; ?>
            </table>

            <a href="/admin/product/" class="btn btn-default back"><i class="fa fa-arrow-left"></i> Назад</a>
        </div>


</section>

<?php include ROOT . '/views/layouts/footer_admin.php'; ?>

