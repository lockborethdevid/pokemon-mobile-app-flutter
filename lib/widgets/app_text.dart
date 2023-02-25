import 'package:flutter/cupertino.dart';

class Apptext extends StatelessWidget {
  final double size;
  final Color color;
  final String text;
  const Apptext({Key? key, required this.color, required this.text, required this.size }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        color: color,
      ),
    );
  }
}
