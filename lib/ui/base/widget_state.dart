import 'package:flutter/widgets.dart';
import 'package:flutter_template/di/base/component.dart';
import 'package:flutter_template/di/base/injector.dart';
import 'package:flutter_template/ui/base/widget_model.dart';

abstract class WidgetState<T extends StatefulWidget, WM extends WidgetModel>
    extends State<T> {
  @protected
  WM wm;

  @protected
  Component get component;

  @override
  Widget build(BuildContext context) {
    return Injector(
      component: component,
      builder: (context) {
        _attachWidgetModel(context);
        return buildState(context);
      },
    );
  }

  Widget buildState(BuildContext context);

  void _attachWidgetModel(BuildContext context) {
    wm = Injector.of(context).get(WM);
  }

  @override
  void dispose() {
    wm.dispose();
    super.dispose();
  }
}
