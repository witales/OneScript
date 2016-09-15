﻿Перем юТест;

Функция ПолучитьСписокТестов(ЮнитТестирование) Экспорт
	
	юТест = ЮнитТестирование;
	
	ВсеТесты = Новый Массив;
	
	ВсеТесты.Добавить("ТестДолжен_ПроверитьДобавлениеПустойСтроки");
	ВсеТесты.Добавить("ТестДолжен_ПроверитьДобавлениеСтрокиБезРазделителя");
	ВсеТесты.Добавить("ТестДолжен_ПроверитьДобавлениеСтрокиСРазделителем");
	ВсеТесты.Добавить("ТестДолжен_ПроверитьПолучениеТекста");
	ВсеТесты.Добавить("ТестДолжен_ПроверитьВставкуСтрокиВНачало");
	ВсеТесты.Добавить("ТестДолжен_ПроверитьВставкуСтрокиВКонец");
	ВсеТесты.Добавить("ТестДолжен_ПроверитьВставкуСтрокиБезРазделителя");
	ВсеТесты.Добавить("ТестДолжен_ПроверитьВставкуСтрокиСРазделителем");
	ВсеТесты.Добавить("ТестДолжен_ПроверитьПолучениеСтроки");
	ВсеТесты.Добавить("ТестДолжен_ПроверитьЗаменуСтрокиБезРазделителя");
	ВсеТесты.Добавить("ТестДолжен_ПроверитьЗаменуСтрокиСРазделителем");
	ВсеТесты.Добавить("ТестДолжен_ПроверитьЗаписьДокумента");
	ВсеТесты.Добавить("ТестДолжен_ПроверитьЗаписьДокументаВКодировкеПоУмолчанию");
	ВсеТесты.Добавить("ТестДолжен_ПроверитьЧтениеДокумента");
	ВсеТесты.Добавить("ТестДолжен_ПроверитьЧтениеДокументаВКодировкеПоУмолчанию");
	ВсеТесты.Добавить("ТестДолжен_ПроверитьУдалениеСтроки");

	Возврат ВсеТесты;
	
КонецФункции

Процедура ТестДолжен_ПроверитьДобавлениеПустойСтроки() Экспорт
	ТД = Новый ТекстовыйДокумент();
	ТД.ДобавитьСтроку("");
	ТД.ДобавитьСтроку("  ");
	ТД.ДобавитьСтроку("");
	
	юТест.ПроверитьРавенство(3, ТД.КоличествоСтрок());
	
КонецПроцедуры

Процедура ТестДолжен_ПроверитьДобавлениеСтрокиБезРазделителя() Экспорт
	ТД = Новый ТекстовыйДокумент();
	ТД.ДобавитьСтроку("Добрый вечер");
	ТД.ДобавитьСтроку("До свидания");
	
	юТест.ПроверитьРавенство(2, ТД.КоличествоСтрок());
КонецПроцедуры

Процедура ТестДолжен_ПроверитьДобавлениеСтрокиСРазделителем() Экспорт
	
	ТД = Новый ТекстовыйДокумент();
	ТД.ДобавитьСтроку("Добрый вечер
	|До свидания");
	
	юТест.ПроверитьРавенство(2, ТД.КоличествоСтрок());
	
КонецПроцедуры

Процедура ТестДолжен_ПроверитьПолучениеТекста() Экспорт
	ТД = Новый ТекстовыйДокумент;
	ТД.ДобавитьСтроку("1");
	ТД.ДобавитьСтроку("2");
	Текст = ТД.ПолучитьТекст();
	юТест.ПроверитьРавенство("1" + Символы.ПС + "2" + Символы.ПС, Текст);
КонецПроцедуры

Функция ДокументДляТестаВставки()
	ТД = Новый ТекстовыйДокумент;
	ТД.ДобавитьСтроку("Строка 1");
	ТД.ДобавитьСтроку("Строка 2");
	ТД.ДобавитьСтроку("Строка 3");
	Возврат ТД;
КонецФункции

Функция ПоказатьПереводыСтрок(Знач Текст)
	Текст = СтрЗаменить(Текст, Символы.ВК, "\r");
	Текст = СтрЗаменить(Текст, Символы.ПС, "\n");
	Возврат Текст;
КонецФункции

Процедура ТестДолжен_ПроверитьВставкуСтрокиВНачало() Экспорт
	ТД = ДокументДляТестаВставки();
	ТД.ВставитьСтроку(0, "Строка 0");
	ТД.ВставитьСтроку(-1, "Строка -1");
	ТД.ВставитьСтроку(1, "Строка -2");
	
	Эталон = "Строка -2
	|Строка -1
	|Строка 0
	|Строка 1
	|Строка 2
	|Строка 3
	|";
	
	юТест.ПроверитьРавенство(Эталон, ТД.ПолучитьТекст());
	
КонецПроцедуры

Процедура ТестДолжен_ПроверитьВставкуСтрокиВКонец() Экспорт
	
	ТД = ДокументДляТестаВставки();
	ТД.ВставитьСтроку(100, "Строка 100");
	ТД.ВставитьСтроку(4, "Строка 4");
	
	Эталон = "Строка 1
	|Строка 2
	|Строка 3
	|Строка 4
	|Строка 100
	|";
	
	юТест.ПроверитьРавенство(Эталон, ТД.ПолучитьТекст());
	
КонецПроцедуры

Процедура ТестДолжен_ПроверитьВставкуСтрокиБезРазделителя() Экспорт
	
	ТД = ДокументДляТестаВставки();
	ТД.ВставитьСтроку(2, "Строка 1.5");
	
	Эталон = "Строка 1
	|Строка 1.5
	|Строка 2
	|Строка 3
	|";
	
	юТест.ПроверитьРавенство(Эталон, ТД.ПолучитьТекст());
	

КонецПроцедуры

Процедура ТестДолжен_ПроверитьВставкуСтрокиСРазделителем() Экспорт
	
	ТД = ДокументДляТестаВставки();
	ТД.ВставитьСтроку(2, "Строка 1.5
	|Строка 1.6");
	
	Эталон = "Строка 1
	|Строка 1.5
	|Строка 1.6
	|Строка 2
	|Строка 3
	|";
	
	юТест.ПроверитьРавенство(Эталон, ТД.ПолучитьТекст());
	юТест.ПроверитьРавенство(5, ТД.КоличествоСтрок());

КонецПроцедуры

Процедура ТестДолжен_ПроверитьПолучениеСтроки() Экспорт
	
	ТД = ДокументДляТестаВставки();
	
	юТест.ПроверитьРавенство("Строка 1", ТД.ПолучитьСтроку(1));
	юТест.ПроверитьРавенство("Строка 2", ТД.ПолучитьСтроку(2));
	юТест.ПроверитьРавенство("Строка 3", ТД.ПолучитьСтроку(3));
	юТест.ПроверитьРавенство("", ТД.ПолучитьСтроку(300));
	юТест.ПроверитьРавенство("", ТД.ПолучитьСтроку(-1));
	
КонецПроцедуры

Процедура ТестДолжен_ПроверитьЗаменуСтрокиБезРазделителя() Экспорт
	ТД = ДокументДляТестаВставки();
	ТД.ЗаменитьСтроку(2, "Новая строка 2");
	
	Эталон = "Строка 1
	|Новая строка 2
	|Строка 3
	|";
	
	юТест.ПроверитьРавенство(Эталон, ТД.ПолучитьТекст());
	
КонецПроцедуры

Процедура ТестДолжен_ПроверитьЗаменуСтрокиСРазделителем() Экспорт
	ТД = ДокументДляТестаВставки();
	ТД.ЗаменитьСтроку(2, "Новая строка 2
	|Новая строка 2.5");
	
	Эталон = "Строка 1
	|Новая строка 2
	|Новая строка 2.5
	|Строка 3
	|";
	
	юТест.ПроверитьРавенство(Эталон, ТД.ПолучитьТекст());
	
КонецПроцедуры

Процедура ТестДолжен_ПроверитьЗаписьДокумента() Экспорт
	
	ВремФайл = юТест.ИмяВременногоФайла();
	ТД = ДокументДляТестаВставки();
	ТД.Записать(ВремФайл, КодировкаТекста.ANSI);
	
	юТест.ПроверитьРавенство(ВремФайл, ТД.ИспользуемоеИмяФайла);
	
	Чтение = Новый ЧтениеТекста(ВремФайл, КодировкаТекста.ANSI, Символы.ВК + Символы.ПС);
	Текст = Чтение.Прочитать();
	Чтение.Закрыть();
	
	Эталон = "Строка 1" + Символы.ВК + Символы.ПС
	+ "Строка 2" + Символы.ВК + Символы.ПС
	+ "Строка 3" + Символы.ВК + Символы.ПС;
	
	юТест.ПроверитьРавенство(ПоказатьПереводыСтрок(Эталон), ПоказатьПереводыСтрок(Текст));
	
КонецПроцедуры

Процедура ТестДолжен_ПроверитьЗаписьДокументаВКодировкеПоУмолчанию() Экспорт
	
	ВремФайл = юТест.ИмяВременногоФайла();
	ТД = ДокументДляТестаВставки();
	ТД.Записать(ВремФайл);
	
	юТест.ПроверитьРавенство(ВремФайл, ТД.ИспользуемоеИмяФайла);
	
	Чтение = Новый ЧтениеТекста(ВремФайл, , Символы.ВК + Символы.ПС);
	Текст = Чтение.Прочитать();
	Чтение.Закрыть();
	
	Эталон = "Строка 1" + Символы.ВК + Символы.ПС
	+ "Строка 2" + Символы.ВК + Символы.ПС
	+ "Строка 3" + Символы.ВК + Символы.ПС;
	
	юТест.ПроверитьРавенство(ПоказатьПереводыСтрок(Эталон), ПоказатьПереводыСтрок(Текст));
	
КонецПроцедуры

Процедура ТестДолжен_ПроверитьЧтениеДокумента() Экспорт
	
	ВремФайл = юТест.ИмяВременногоФайла();
	ТД = ДокументДляТестаВставки();
	ТД.Записать(ВремФайл, КодировкаТекста.ANSI);
	ТД = Новый ТекстовыйДокумент;
	ТД.Прочитать(ВремФайл, КодировкаТекста.ANSI);
	юТест.ПроверитьРавенство(ВремФайл, ТД.ИспользуемоеИмяФайла);
	
	Эталон = "Строка 1
	|Строка 2
	|Строка 3
	|";
	
	юТест.ПроверитьРавенство(Эталон, ТД.ПолучитьТекст());
	
КонецПроцедуры

Процедура ТестДолжен_ПроверитьЧтениеДокументаВКодировкеПоУмолчанию() Экспорт
	
	ВремФайл = юТест.ИмяВременногоФайла();
	ТД = ДокументДляТестаВставки();
	ТД.Записать(ВремФайл, КодировкаТекста.UTF8);
	ТД = Новый ТекстовыйДокумент;
	ТД.Прочитать(ВремФайл);
	юТест.ПроверитьРавенство(ВремФайл, ТД.ИспользуемоеИмяФайла);
	
	Эталон = "Строка 1
	|Строка 2
	|Строка 3
	|";
	
	юТест.ПроверитьРавенство(Эталон, ТД.ПолучитьТекст());
	
КонецПроцедуры


Процедура ТестДолжен_ПроверитьУдалениеСтроки() Экспорт
	ТД = Новый ТекстовыйДокумент();
	ТД.ДобавитьСтроку("1");
	ТД.ДобавитьСтроку("2");
	ТД.ДобавитьСтроку("3");

	ТД.УдалитьСтроку(2);

	юТест.ПроверитьРавенство(2, ТД.КоличествоСтрок());
	юТест.ПроверитьРавенство("1", ТД.ПолучитьСтроку(1));
	юТест.ПроверитьРавенство("3", ТД.ПолучитьСтроку(2));
	
КонецПроцедуры
