﻿#language: ru

@tree

Функционал: проверка документа Заказ

Как Менеджер по продажам я хочу
проверить корректность функционирования документа Заказ
чтобы выставлять счета клиентам

Контекст:
Дано Я открыл новый сеанс TestClient или подключил уже существующий

Сценарий: Расчет суммы документа при изменении количества или цены

* Подготовка
	И я закрываю все окна клиентского приложения

* Новый документ
	И В командном интерфейсе я выбираю 'Продажи' 'Заказы'
	Тогда открылось окно 'Заказы товаров'
	И я нажимаю на кнопку с именем 'ФормаСоздать'
	Тогда открылось окно 'Заказ (создание)'

* Шапка документа
	И выполнить заполнение шапки документа

* Строки документа
	И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице "Товары" я нажимаю кнопку выбора у реквизита с именем "ТоварыТовар"
	Тогда открылось окно 'Товары'
	И в таблице "Список" я перехожу к строке:
		| 'Код'       | 'Наименование' |
		| '000000011' | 'Продукты'     |
	И в таблице  "Список" я перехожу на один уровень вниз
	И в таблице "Список" я перехожу к строке:
		| 'Код'       | 'Наименование' |
		| '000000030' | 'Колбаса'      |
	И я нажимаю на кнопку с именем 'ФормаВыбрать'
	Тогда открылось окно 'Заказ (создание) *'
	
	// При изменении количества

//	Если РН Цены товаров загружен, то вручную устанавливать цену ненужно 	
//	И в таблице "Товары" я активизирую поле с именем "ТоварыЦена"
//	И в таблице "Товары" в поле с именем 'ТоварыЦена' я ввожу текст '255,00'

	И в таблице "Товары" я активизирую поле с именем "ТоварыКоличество"
	И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '5'
	И я перехожу к следующему реквизиту
	И в таблице "Товары" я завершаю редактирование строки
	И элемент формы с именем 'ТоварыИтогСумма' стал равен '1 275'
		
* Сохранение документа
	И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
