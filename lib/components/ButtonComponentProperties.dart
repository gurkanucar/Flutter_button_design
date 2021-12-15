import 'package:flutter/material.dart';

class ButtonComponentProperties {
  final String _backgroundColor;
  final Widget _child;
  final bool _darkMode;

  ButtonComponentProperties(this._backgroundColor , this._child, this._darkMode);

  Widget get child => _child;

  bool get darkMode => _darkMode;

  String get backgroundColor => _backgroundColor;

}
