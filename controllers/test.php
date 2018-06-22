<?php 
include_once('/phpmailer/src/PHPMailer.php');
include_once('/phpmailer/src/Exception.php');
include_once('/phpmailer/src/SMTP.php');

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception; 


$adminEmail = 'bicycle.contacts.shop@gmail.com';
                $message = "Текст: dawd От dawdwdawd";
                $subject = 'Тема письма';
				$from = "From: a-av79@mail.ru";
				try {
					$mail = new PHPMailer(true);
					$mail->isSMTP();
					$mail->Host = 'smtp.mail.ru';
					$mail->SMTPAuth = true;
					$mail->Username = 'a-av79@mail.ru';
					$mail->Password = 'alexwinner79';
					$mail->SMTPSecure = 'tls';
					$mail->Port = 465;
					$mail->SMTPDebug = 4;
					
					$mail->setFrom('a-av79@mail.ru');
					$mail->addAddress($adminEmail);
					
					$mail->Subject = 'Письмо от клиента';
					$mail->Body    = $message;
					
					$mail->send();
				} catch (Exception $e) {
					echo 'Message could not be sent. Mailer Error: ', $mail->ErrorInfo;
				}











?>