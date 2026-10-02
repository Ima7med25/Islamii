import 'package:flutter/material.dart';

extension Navigation on BuildContext {
  void pushNamed(String routeName, {Object? arguments}) => Navigator.of(
    this,
    rootNavigator: true,
  ).pushNamed(routeName, arguments: arguments);
  void pushReplacementNamed(String routeName, {Object? arguments}) =>
      Navigator.of(
        this,
        rootNavigator: true,
      ).pushReplacementNamed(routeName, arguments: arguments);
  void pushRemoveUntilNamed(String routeName, {Object? arguments}) =>
      Navigator.of(
        this,
        rootNavigator: true,
      ).pushReplacementNamed(routeName, arguments: arguments);
  void pop() => Navigator.of(this, rootNavigator: true).pop();
}
