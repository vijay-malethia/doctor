import 'package:flutter/material.dart';

import '/ui/common/index.dart';

class Button extends StatelessWidget {
  final String title;
  final GestureTapCallback? onPressed;
  final EdgeInsets? margin;
  final bool loading;
  final bool disabled;
  final bool isWhiteBg;
  final bool border;
  final double height;
  final bool textColor;
  final Color color;

  const Button({
    required this.onPressed,
    required this.title,
    required this.height,
    this.margin,
    this.loading = false,
    this.disabled = false,
    this.isWhiteBg = false,
    this.border = false,
    this.textColor = false,
    this.color = primaryColor,
    Key? key,
  }) : super(key: key);

  Widget getLoadingIndicator() {
    return const SizedBox(
        width: 20,
        height: 20,
        child:
            CircularProgressIndicator(strokeWidth: 2.5, color: Colors.white));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        margin: margin,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                elevation: 0,
                side: border
                    ? BorderSide(
                        color: isWhiteBg ? primaryColor : Colors.white,
                        width: 1.0)
                    : null,
                minimumSize: const Size(double.infinity, 55),
                disabledBackgroundColor:
                    const Color.fromARGB(255, 181, 216, 244),
                backgroundColor: isWhiteBg ? Colors.white : primaryColor,
                textStyle: const TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontSize: 22,
                    fontWeight: FontWeight.w700),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(9))),
            onPressed: (disabled || loading) ? null : onPressed,
            child: loading
                ? getLoadingIndicator()
                : Text(title,
                    style: TextStyle(
                        color: isWhiteBg
                            ? textColor
                                ? primaryColor
                                : color
                            : const Color.fromARGB(255, 255, 255, 255),
                        fontSize: 18,
                        fontWeight: FontWeight.w700))));
  }
}
