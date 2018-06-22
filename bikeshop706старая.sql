-- phpMyAdmin SQL Dump
-- version 4.7.3
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Июн 07 2018 г., 02:13
-- Версия сервера: 5.6.37
-- Версия PHP: 5.5.38

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `bikeshop`
--

-- --------------------------------------------------------

--
-- Структура таблицы `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `sort_order` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `category`
--

INSERT INTO `category` (`id`, `name`, `sort_order`, `status`) VALUES
(13, 'Ноутбуки', 1, 1),
(14, 'Планшеты', 2, 1),
(15, 'Мониторы', 3, 1),
(16, 'Игровые компьютеры', 4, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `category_id` int(11) NOT NULL,
  `code` int(11) NOT NULL,
  `price` float NOT NULL,
  `availability` int(11) NOT NULL,
  `brand` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `is_new` int(11) NOT NULL DEFAULT '0',
  `is_recommended` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `product`
--

INSERT INTO `product` (`id`, `name`, `category_id`, `code`, `price`, `availability`, `brand`, `description`, `is_new`, `is_recommended`, `status`) VALUES
(34, 'Ноутбук Asus X200MA (X200MA-KX315D)', 13, 1839707, 395, 1, 'Asus', 'Экран 11.6\" (1366x768) HD LED, глянцевый / Intel Pentium N3530 (2.16 - 2.58 ГГц) / RAM 4 ГБ / HDD 750 ГБ / Intel HD Graphics / без ОД / Bluetooth 4.0 / Wi-Fi / LAN / веб-камера / без ОС / 1.24 кг / синий', 0, 0, 1),
(35, 'Ноутбук HP Stream 11-d050nr', 13, 2343847, 305, 0, 'Hewlett Packard', 'Экран 11.6” (1366x768) HD LED, матовый / Intel Celeron N2840 (2.16 ГГц) / RAM 2 ГБ / eMMC 32 ГБ / Intel HD Graphics / без ОД / Wi-Fi / Bluetooth / веб-камера / Windows 8.1 + MS Office 365 / 1.28 кг / синий', 1, 1, 1),
(36, 'Ноутбук Asus X200MA White ', 13, 2028027, 270, 1, 'Asus', 'Экран 11.6\" (1366x768) HD LED, глянцевый / Intel Celeron N2840 (2.16 ГГц) / RAM 2 ГБ / HDD 500 ГБ / Intel HD Graphics / без ОД / Bluetooth 4.0 / Wi-Fi / LAN / веб-камера / без ОС / 1.24 кг / белый', 0, 1, 1),
(37, 'Ноутбук Acer Aspire E3-112-C65X', 13, 2019487, 325, 1, 'Acer', 'Экран 11.6\'\' (1366x768) HD LED, матовый / Intel Celeron N2840 (2.16 ГГц) / RAM 2 ГБ / HDD 500 ГБ / Intel HD Graphics / без ОД / LAN / Wi-Fi / Bluetooth / веб-камера / Linpus / 1.29 кг / серебристый', 0, 1, 1),
(38, 'Ноутбук Acer TravelMate TMB115', 13, 1953212, 275, 1, 'Acer', 'Экран 11.6\'\' (1366x768) HD LED, матовый / Intel Celeron N2840 (2.16 ГГц) / RAM 2 ГБ / HDD 500 ГБ / Intel HD Graphics / без ОД / LAN / Wi-Fi / Bluetooth 4.0 / веб-камера / Linpus / 1.32 кг / черный', 0, 0, 1),
(39, 'Ноутбук Lenovo Flex 10', 13, 1602042, 370, 0, 'Lenovo', 'Экран 10.1\" (1366x768) HD LED, сенсорный, глянцевый / Intel Celeron N2830 (2.16 ГГц) / RAM 2 ГБ / HDD 500 ГБ / Intel HD Graphics / без ОД / Wi-Fi / Bluetooth / веб-камера / Windows 8.1 / 1.2 кг / черный', 0, 0, 1),
(40, 'Ноутбук Asus X751MA', 13, 2028367, 430, 1, 'Asus', 'Экран 17.3\" (1600х900) HD+ LED, глянцевый / Intel Pentium N3540 (2.16 - 2.66 ГГц) / RAM 4 ГБ / HDD 1 ТБ / Intel HD Graphics / DVD Super Multi / LAN / Wi-Fi / Bluetooth 4.0 / веб-камера / DOS / 2.6 кг / белый', 0, 1, 1),
(41, 'Samsung Galaxy Tab S 10.5 16GB', 14, 1129365, 780, 1, 'Samsung', 'Samsung Galaxy Tab S создан для того, чтобы сделать вашу жизнь лучше. Наслаждайтесь своим контентом с покрытием 94% цветов Adobe RGB и 100000:1 уровнем контрастности, который обеспечивается sAmoled экраном с функцией оптимизации под отображаемое изображение и окружение. Яркий 10.5” экран в ультратонком корпусе весом 467 г порадует вас высоким уровнем портативности. Работа станет проще вместе с Hancom Office и удаленным доступом к вашему ПК. E-Meeting и WebEx – отличные помощники для проведения встреч, когда вы находитесь вне офиса. Надежно храните ваши данные благодаря сканеру отпечатка пальцев.', 1, 1, 1),
(42, 'Samsung Galaxy Tab S 8.4 16GB', 14, 1128670, 640, 1, 'Samsung', 'Экран 8.4\" Super AMOLED (2560x1600) емкостный Multi-Touch / Samsung Exynos 5420 (1.9 ГГц + 1.3 ГГц) / RAM 3 ГБ / 16 ГБ встроенной памяти + поддержка карт памяти microSD / Bluetooth 4.0 / Wi-Fi 802.11 a/b/g/n/ac / основная камера 8 Мп, фронтальная 2.1 Мп / GPS / ГЛОНАСС / Android 4.4.2 (KitKat) / 294 г / белый', 0, 0, 1),
(43, 'Gazer Tegra Note 7', 14, 683364, 210, 1, 'Gazer', 'Экран 7\" IPS (1280x800) емкостный Multi-Touch / NVIDIA Tegra 4 (1.8 ГГц) / RAM 1 ГБ / 16 ГБ встроенной памяти + поддержка карт памяти microSD / Wi-Fi / Bluetooth 4.0 / основная камера 5 Мп, фронтальная - 0.3 Мп / GPS / ГЛОНАСС / Android 4.4.2 (KitKat) / вес 320 г', 0, 0, 1),
(44, 'Монитор 23\" Dell E2314H Black', 15, 355025, 175, 1, 'Dell', 'С расширением Full HD Вы сможете рассмотреть мельчайшие детали. Dell E2314H предоставит Вам резкое и четкое изображение, с которым любая работа будет в удовольствие. Full HD 1920 x 1080 при 60 Гц разрешение (макс.)', 0, 0, 1),
(45, 'Компьютер Everest Game ', 16, 1563832, 1320, 1, 'Everest', 'Everest Game 9085 — это компьютеры премимум класса, собранные на базе эксклюзивных компонентов, тщательно подобранных и протестированных лучшими специалистами нашей компании. Это топовый сегмент систем, который отвечает наилучшим характеристикам показателей качества и производительности.', 0, 0, 1),
(47, 'Bike', 14, 2147483647, 360, 1, 'Bike', 'Велосипед мужской', 0, 1, 1),
(48, 'Велосипед Merida Matts 6.10-V (матовый черный, 2016) - 26″', 13, 2147483647, 630, 1, 'Merida ', 'Гарантия на раму:	10 лет \r\nГарантия на ходовое оборудование и вилку:	1 год \r\nКоличество скоростей:	21 \r\nРама:	Matts V Алюминий \r\nПередняя вилка:	SunTour 26 XCT 100 \r\nПередний переключатель:	Shimano Tourney \r\nЗадний переключатель:	Shimano Altus \r\nТормоза:	V-Brake Linear \r\nТормозные ручки:	Shimano EZ fire \r\nМанетки:	Shimano EF41 fire 7 speed \r\nРулевая колонка:	EGG steel-B \r\nСистема шатунов:	Shimano M131 42-34-24 CG \r\nПередняя втулка:	OV alloy \r\nЗадняя втулка:	OV alloy \r\nКаретка:	Cartridge Bearing \r\nРуль:	Merida Steel 620 R30 \r\nВынос руля:	Merida Ahead alloy 15 \r\nСедло:	Merida Sport 5 \r\nПодседельный глагол:	MERIDA speed 27.2 \r\nПедали:	PP pedal \r\nЦепь:	chain 7s \r\nСпицы:	ucp steel \r\nОбода:	Merida Matts V \r\nПокрышки:	Merida 26 2.1 \r\nГрипсы:	MERIDA kraton \r\nЗадние звезды:	Shimano MF-TZ21 14-28 \r\nГорный велосипед Merida Matts 6.10-V. Модель оснащена алюминиевой рамой. Установлены пружинно-эластомерная вилка SR 26 XCT 100, ободные механические тормоза, а также полупрофессиональное оборудование. Merida Matts 6.10-V прекрасно подойдёт для катания как в городе, так и по пересечённой местности.', 1, 1, 1),
(49, 'Велосипед Merida Matts 6.15-MD (матовый желтый, 2016) - 26″', 13, 2147483647, 730, 1, 'Merida ', 'Размеры: 16\", 18\", 20\". Горный велосипед Merida Matts 6.10-V. Модель оснащена алюминиевой рамой. Установлены пружинно-эластомерная вилка SR 26 XCT 100, дисковые механические тормоза, а также полупрофессиональное оборудование. Merida Matts 6.10-V прекрасно подойдёт для катания как в городе, так и по пересечённой местности.\r\n\r\nГарантия на раму:	10 лет \r\nГарантия на ходовое оборудование и вилку:	1 год \r\nКоличество скоростей:	24 \r\nРама:	Matts V Алюминий \r\nПередняя вилка:	SunTour 26 XCT 100 \r\nПередний переключатель:	Shimano TY 8s 42 \r\nЗадний переключатель:	Shimano Altus 8 speed \r\nТормоза:	JACK Mechanical 160 \r\nТормозные ручки:	Shimano EZ fire \r\nМанетки:	Shimano EZ fire 8 \r\nРулевая колонка:	EGG steel-B \r\nСистема шатунов:	Shimano TY301 42-34-24 CG \r\nПередняя втулка:	Alloy Disc \r\nЗадняя втулка:	Alloy Disc \r\nКаретка:	Cartridge Bearing \r\nРуль:	MERIDA OS 660 R15 \r\nВынос руля:	MERIDA Comp OS 6 \r\nСедло:	Merida Sport  \r\nПодседельный глагол:	MERIDA speed 27.2 \r\nПедали:	PP pedal \r\nЦепь:	Chain 8s \r\nСпицы:	ucp steel \r\nОбода:	Merida Matts D \r\nПокрышки:	Merida 26 2.1 \r\nГрипсы:	MERIDA kraton \r\nЗадние звезды:	Sunrace CS8 11-32\r\n', 0, 1, 1),
(50, 'Greenway LX330-H (2018)', 14, 2147483647, 335, 1, 'Greenway', 'Производитель Greenway <br>\r\nДата выхода 2018 <br>\r\nКласс велосипеда двухподвес\r\nПол велосипедиста мужской, универсальный<br>\r\nВозрастная группа взрослый<br>\r\nРама<br>\r\nМатериал рамы сталь<br>\r\nТип рамы закрытая<br>\r\nРазмер рамы 18.5\"<br>\r\nСкладная рама Нет<br>\r\nЗадний амортизатор Да<br>\r\nВилка<br>\r\nТип вилки амортизационная<br>\r\nБлокировка вилки Нет<br>\r\nТрансмиссия<br>\r\nТип трансмиссии с внешним переключением<br>\r\nКоличество скоростей 21 (3x7) <br>\r\nКассета или трещотка Shimano (MF-TZ21) <br>\r\nПередний переключатель Shimano (FD-TZ30) <br>\r\nЗадний переключатель Shimano (RD-TZ50) <br>\r\nЦепь KMC<br>\r\nМанетки<br>\r\nМанетки Shimano (ST-EF500) <br>\r\n\r\nТип манеток комбинированные<br>\r\nКолеса Диаметр колёс 26\"<br>\r\nДвойные обода Да<br>\r\n<br>\r\nПокрышки Chao Yang<br>\r\nРисунок протектора грязевые<br>\r\nШирина покрышки 1.95\"<br>\r\nТормоза<br>\r\nТип тормоза дисковый механический<br>\r\nРуль<br>\r\nТип руля с подъемом<br>\r\nГрипсы обычные<br>\r\nРога Нет<br>\r\nСедло<br>\r\nТип седла спортивное<br>\r\nАмортизация седла отсутствует<br>\r\nПедали<br>\r\nТип педалей платформенные<br>\r\nМатериал педалей пластиковые<br>\r\nКомплектация<br>\r\nВ комплекте щитки, подножка<br>\r\nЗащита цепи частичная<br>\r\n', 1, 1, 1),
(51, 'Merida Crossway 15-MD Lady (2017) ', 15, 2147483647, 820, 1, 'Merida ', 'Основное\r\nМатериал рамы	Алюминий\r\nДиаметр колес	28″\r\nАмортизаторы	только передний\r\nСкорости	24\r\nТип тормозов	Дисковые механические\r\nРама и управление\r\nВилка	SR Suntour NEX 63\r\nВынос	Adjustable Quill stem\r\nПедали	PP pedal\r\nРама	Crossway DT-D\r\nРуль	Merida Comp 660 R25\r\nСедло	Cross lady\r\nПодседельный штырь	Suspension 27.2\r\nТрансмиссия\r\nКаретка	Cartridge Bearing\r\nКассета	Sunrace CS8 11-32Т\r\nМанетки	Shimano EZ fire 8\r\nПередний переключатель	Shimano TY8s 48\r\nЗадний переключатель	Shimano Altus\r\nСистема	Shimano TY301 48x38x28T CG\r\nЦепь	Chain 8s\r\nТормоза\r\nТормозные диски	160 мм\r\nТормоза	JACK\r\nКолеса\r\nВтулки	Алюминиевые, с дисковым креплением\r\nОбода	Fulcrum Racing comp\r\nПокрышки	Tire-F:Cross 700 40C, Tire-R:Cross 700 40C\r\nСпицы	Стальные\r\n', 1, 1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `product_order`
--

CREATE TABLE `product_order` (
  `id` int(11) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `user_phone` varchar(255) NOT NULL,
  `user_comment` text NOT NULL,
  `user_address` varchar(255) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `products` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `product_order`
--

INSERT INTO `product_order` (`id`, `user_name`, `user_phone`, `user_comment`, `user_address`, `user_id`, `date`, `products`, `status`) VALUES
(45, 'fsdfsd', '1', '123123123', '', 4, '2015-05-14 09:54:45', '{\"1\":1,\"2\":1,\"3\":2}', 3),
(46, 'САША1', 'g3424242342', '', '', 4, '2015-05-18 15:34:42', '{\"44\":3,\"43\":3}', 1),
(47, 'Dmitriy', '80253333322', 'Новый заказ', '', 0, '2018-06-02 15:27:24', '{\"45\":1,\"43\":1}', 1),
(48, 'Dmitriy1', '80253333321', 'ррр', '', 0, '2018-06-02 16:23:30', '{\"45\":1,\"44\":1}', 1),
(49, 'Vitaliy', '80253333345', 'ПРивет', 'пр-т газ. \"Звязда\", 55', 4, '2018-06-02 17:09:58', '{\"45\":1}', 1),
(50, 'Vitaliy', '80253333346', 'I am new ', 'пр-т газ. \"Звязда\". ', 4, '2018-06-02 17:55:24', '{\"44\":1,\"47\":1}', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `password`, `role`) VALUES
(3, 'Dmitriy', 'dmitriy@mail.com', '2222222', ''),
(4, 'Alexander', 'bicycle.contacts.shop@gmail.com', '1111111', 'admin'),
(5, 'Vitaliy', 'vitaliy@mail.com', '3333333', '');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `product_order`
--
ALTER TABLE `product_order`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT для таблицы `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;
--
-- AUTO_INCREMENT для таблицы `product_order`
--
ALTER TABLE `product_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;
--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
