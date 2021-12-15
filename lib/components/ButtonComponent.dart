import 'package:flutter/material.dart';
import 'package:neumorphism_design/components/ButtonComponentProperties.dart';

class ButtonComponent extends StatefulWidget {
  // const ButtonComponent({Key? key, required this.props}) : super(key: key);

  const ButtonComponent({Key? key, required this.props, required this.onClick})
      : super(key: key);

  final ButtonComponentProperties props;
  final VoidCallback onClick;

  @override
  _ButtonComponentState createState() => _ButtonComponentState();
}

extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}

class _ButtonComponentState extends State<ButtonComponent> {
  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.transparent,
        elevation: 0,
        child: Container(
          width: 200,
          height: 200,
          padding: EdgeInsets.all(20),
          child: Ink(
            decoration: BoxDecoration(
                color: HexColor.fromHex(widget.props.backgroundColor),
                borderRadius: BorderRadius.all(Radius.circular(50)),
                boxShadow: [
                  BoxShadow(
                      color: widget.props.darkMode
                          ? HexColor.fromHex("#8A000000")
                          : HexColor.fromHex("#FF9E9E9E"),
                      offset: Offset(-4.0, 4.0),
                      blurRadius: 15.0,
                      spreadRadius: 1.0),
                  BoxShadow(
                      color: widget.props.darkMode
                          ? HexColor.fromHex("#FF424242")
                          : HexColor.fromHex("#FFFFFFFF"),
                      offset: Offset(4.0, -4.0),
                      blurRadius: 15.0,
                      spreadRadius: 1.0),
                ]),
            child: InkWell(
                splashColor: widget.props.darkMode
                    ? HexColor.fromHex("#8A000000")
                    : HexColor.fromHex("#FFFFFFFF"),
                borderRadius: BorderRadius.all(Radius.circular(50)),
                onTap: widget.onClick,
                child: widget.props.child),
          ),
        ));
  }
}
