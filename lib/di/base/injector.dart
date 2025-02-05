import 'package:flutter/widgets.dart';
import 'package:flutter_template/di/base/component.dart';

/// Special widget for DI
/// It provide dependencies to children.
/// Children can get component dependency by 'of' and 'Component.get(Type)'
///
class Injector extends StatefulWidget {
  final Component component;
  final WidgetBuilder builder;

  //конст - кеширование?
  const Injector({this.component, Key key, this.builder}) : super(key: key);

  static _Injector of(BuildContext context) {
    var injector =
        context.ancestorInheritedElementForWidgetOfExactType(_Injector)?.widget;
    if (injector == null) {
      throw Exception("Can not find nearest Injector. Do you define it?");
    }

    return injector;
  }

  @override
  _InjectorState createState() => _InjectorState();
}

class _InjectorState extends State<Injector> {
  @override
  Widget build(BuildContext context) {
    return _Injector(
      component: widget.component,
      child: _InjectorProxy(
        builder: (c) => widget.builder(c),
      ),
    );
  }
}

class _InjectorProxy extends StatelessWidget {
  final WidgetBuilder builder;

  const _InjectorProxy({Key key, this.builder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return builder(context);
  }
}

/// Special class fo Dependency Injection
/// Here you are able to manipulate your dependencies
/// Making this class extend [InheritedWidget] able to provide dependencies
/// and define "scopes"
class _Injector extends InheritedWidget {
  final Component component;

  //конст - кеширование?
  const _Injector({this.component, Key key, Widget child})
      : super(key: key, child: child);

  ///проверить
  T get<T>(Type t) {
    return component.get<T>(t);
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    //не имеет своего стейта, не реагирует на изменение зависимостей,
    //это лишь провайдер
    return false;
  }
}
