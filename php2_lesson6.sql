-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1
-- Время создания: Июл 22 2016 г., 07:59
-- Версия сервера: 10.1.13-MariaDB
-- Версия PHP: 5.6.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `php2_lesson6`
--

-- --------------------------------------------------------

--
-- Структура таблицы `profile`
--

CREATE TABLE `profile` (
  `id` int(10) UNSIGNED NOT NULL,
  `age` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `middlename` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `surname` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `about_me` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `full_avatar` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `profile`
--

INSERT INTO `profile` (`id`, `age`, `name`, `middlename`, `surname`, `about_me`, `avatar`, `full_avatar`) VALUES
(4, 27, 'Сергей', 'Викторович', 'Лютер ', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Alias consectetur consequatur, cupiditate delectus dolorem eum harum illo itaque iusto modi molestiae odit officia quia quis quod quos repellendus sint velit', 'img_thumbnails/adventure_time___jake_wallpaper_800x600.jpg', 'img/adventure_time___jake_wallpaper_800x600.jpg'),
(5, 25, 'name2', 'middlename2', 'surname2', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Alias consectetur consequatur, cupiditate delectus dolorem eum harum illo itaque iusto modi molestiae odit officia quia quis quod quos repellendus sint velit', 'img_thumbnails/grumpy_cat_01.jpg', 'img/grumpy_cat_01.jpg');

-- --------------------------------------------------------

--
-- Структура таблицы `realty`
--

CREATE TABLE `realty` (
  `id` int(10) UNSIGNED NOT NULL,
  `area` float UNSIGNED NOT NULL,
  `rooms` tinyint(3) UNSIGNED NOT NULL,
  `floor` tinyint(4) NOT NULL,
  `adress` varchar(1023) COLLATE utf8_unicode_ci NOT NULL,
  `price` int(10) UNSIGNED NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `wall_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `realty`
--

INSERT INTO `realty` (`id`, `area`, `rooms`, `floor`, `adress`, `price`, `description`, `wall_id`) VALUES
(15, 75, 4, 2, 'г. Красноярск, ул Объектов Недвижимости, 3', 15000000, 'Хороший дом', 1),
(16, 56, 1, 19, 'г. Красноярск, проспект Лессона, 3', 3000000, 'Бедный дом', 3),
(17, 27, 6, 2, 'г. Красноярск, переулок Пхпэшный, д 5, кв 6', 7501000, 'Дом как дом', 4),
(32, 59, 2, 25, 'г. Красноярск, ул Высотная, 305', 8000000, 'Высокий дом', 1),
(40, 38, 1, 3, 'г. Красноярск, ул Мартынова, 66, 6', 2700000, 'Новый дом', 4),
(41, 50, 2, 2, 'г. Красноярск, мкр. Покровка, 27', 1200000, 'Древний дом', 2);

-- --------------------------------------------------------

--
-- Структура таблицы `realty_tags`
--

CREATE TABLE `realty_tags` (
  `id` int(10) UNSIGNED NOT NULL,
  `realty_id` int(10) UNSIGNED NOT NULL,
  `tag_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `realty_tags`
--

INSERT INTO `realty_tags` (`id`, `realty_id`, `tag_id`) VALUES
(45, 16, 16),
(46, 16, 12),
(47, 16, 15),
(48, 17, 6),
(49, 17, 13),
(50, 17, 14),
(51, 32, 2),
(55, 32, 14),
(56, 40, 8),
(58, 40, 6),
(59, 41, 2),
(62, 41, 15),
(63, 32, 5),
(79, 40, 2),
(80, 40, 13),
(81, 40, 15),
(82, 41, 9),
(90, 15, 5),
(91, 15, 2),
(92, 15, 9);

-- --------------------------------------------------------

--
-- Структура таблицы `tags`
--

CREATE TABLE `tags` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(31) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `tags`
--

INSERT INTO `tags` (`id`, `title`) VALUES
(2, 'Вторичка'),
(5, 'Элитное'),
(6, 'Метро'),
(8, 'Новостройка'),
(9, 'Ипотека'),
(11, 'Хрущевка'),
(12, 'Студия'),
(13, 'Сталинка'),
(14, 'Новая планировка'),
(15, 'Гостинка'),
(16, 'Общежитие'),
(23, 'Обременение');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `salt` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `role` tinyint(3) UNSIGNED NOT NULL,
  `profile_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `salt`, `username`, `password`, `role`, `profile_id`) VALUES
(5, 'jeZ7r8rChBGBpm5zUDtto9bLW75r9fvX', 'admin', '4b4d1cf4c7969941b890b7a61758fda3', 10, 4),
(6, 'Odq9gjRNhnYjs67aTI7lbVkipYAZazfU', 'user', 'a985334489599ffbf6e9840e95b2b540', 1, 5);

-- --------------------------------------------------------

--
-- Структура таблицы `wall`
--

CREATE TABLE `wall` (
  `id` int(10) UNSIGNED NOT NULL,
  `material` varchar(63) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `wall`
--

INSERT INTO `wall` (`id`, `material`, `description`) VALUES
(1, 'Кирпич', 'Описание, плюсы и минусы кирпичных ст'),
(2, 'Дерево', 'Описание, плюсы и минусы деревянных стеudff'),
(3, 'Панель', 'Описание, плюсы и минусы панельных сте'),
(4, 'Монолит', 'Описание, плюсы и минусы монолитных сте'),
(5, 'Блоки', 'Описание, плюсы и минусы блочных стен');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `profile`
--
ALTER TABLE `profile`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `realty`
--
ALTER TABLE `realty`
  ADD PRIMARY KEY (`id`),
  ADD KEY `index_wall_id` (`wall_id`);

--
-- Индексы таблицы `realty_tags`
--
ALTER TABLE `realty_tags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `realty_index` (`realty_id`),
  ADD KEY `tag_index` (`tag_id`);

--
-- Индексы таблицы `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `tag_id` (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `index_user` (`profile_id`);

--
-- Индексы таблицы `wall`
--
ALTER TABLE `wall`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `profile`
--
ALTER TABLE `profile`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;
--
-- AUTO_INCREMENT для таблицы `realty`
--
ALTER TABLE `realty`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;
--
-- AUTO_INCREMENT для таблицы `realty_tags`
--
ALTER TABLE `realty_tags`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;
--
-- AUTO_INCREMENT для таблицы `tags`
--
ALTER TABLE `tags`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;
--
-- AUTO_INCREMENT для таблицы `wall`
--
ALTER TABLE `wall`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;
--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `realty`
--
ALTER TABLE `realty`
  ADD CONSTRAINT `FK_realty_wall` FOREIGN KEY (`wall_id`) REFERENCES `wall` (`id`);

--
-- Ограничения внешнего ключа таблицы `realty_tags`
--
ALTER TABLE `realty_tags`
  ADD CONSTRAINT `FK_realty_tags_realty` FOREIGN KEY (`realty_id`) REFERENCES `realty` (`id`),
  ADD CONSTRAINT `FK_realty_tags_tags` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`);

--
-- Ограничения внешнего ключа таблицы `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `FK_user_profile` FOREIGN KEY (`profile_id`) REFERENCES `profile` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
