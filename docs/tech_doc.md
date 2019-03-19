# Техническое описнание шаблона для проектов на Flutter

## Code-style and conventions

## Используемый стек

* rxDart
* http

## Архитектура

1. Domain - слой моделей
2. Repository - репозитории(запросы в любые хранилища)
3. Interactor - интеракторы(полностью на стримах), бизнес-логика
4. ViewModel - связывает виджеты и слой интеракторов. Логика UI слоя
5. Экран/виджет - только декларативноя логика, связь со стримами из модели через StreamBuilder(пока)

## DI

Ручной. Свой.
Основан на InheritedWidget.
 - `Injector` - виджет, в который помещается  компонент и виджеты требующие зависимостей
    также с помощью метода of получаем компонент и его заивисимости

 - `Component` - класс, отвечающий за иницализацию модулей и их кнфигурацию
 - `Module` - провайдер зависимости


## Структура проекта | Project Structure

- ./ - папка проекта
- ./assets/ - директория расположения графических ресурсов
- ./docs/ - документация проекта(тех.док, тех.долг)
- ./android/ - папка, содержащая нативный код для Android
- ./ios - аналогично для iOS
- ./lib/ - код на Dart, Flutter-приложение
    - ./lib/di - вся конфигурация DI
    - ./lib/domain - Domain -слой
    - ./lib/interactor - Interactor-слой
        - ./lib/interactor/common - общееиспользуемые классы
        - ./lib/interactor/*some_interactor*/repository - репозиторий для интерактора
    - ./lib/ui - UI-слой
        - ./lib/ui/app - пакет с главным виджетом приложения
        - ./lib/ui/base - базовые классы для ui
        - ./lib/ui/common - общеиспользуемые классы UI
        - ./lib/ui/res - пакет для ресурсов(strings.dart, colors.dart, text_styles.dart)
        - ./lib/ui/screen - пакеты конкретных экранов/виджетов(сам виджет + VM)
    - ./lib/util - утилиты
- ./test - тесты

