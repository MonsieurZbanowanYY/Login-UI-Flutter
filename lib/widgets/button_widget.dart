import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final List<Color> backColor;

  final List<Color> textColor;
  final GestureTapCallback onPressed;

  const ButtonWidget({
    Key? key,
    required this.text,
    required this.backColor,
    required this.textColor,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Shader textGradient = LinearGradient(
      colors: <Color>[textColor[0], textColor[1]],
    ).createShader(
      const Rect.fromLTWH(
        0.0,
        0.0,
        200.0,
        70.0,
      ),
    );
    var size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.07,
      width: size.width * 0.9,
      child: InkWell(
        onTap: onPressed,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            gradient: LinearGradient(
              stops: const [0.4, 2],
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
              colors: backColor,
            ),
          ),
          child: Align(
            child: Text(
              text,
              style: TextStyle(
                foreground: Paint()..shader = textGradient,
                fontWeight: FontWeight.bold,
                fontSize: size.height * 0.02,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
