import 'package:doc_ease/ui/common/index.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String title;
  final GestureTapCallback? onPressed;
  final EdgeInsets? margin;
  final bool loading;
  final bool disabled;
  final bool isWhiteBg;
  final double height;

  const Button({
    required this.onPressed,
    required this.title,
    required this.height,
    this.margin,
    this.loading = false,
    this.disabled = false,
    this.isWhiteBg = false,
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
                side: BorderSide(
                    color: isWhiteBg ? primaryColor : Colors.white, width: 1.0),
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
                : Text(
                    title,
                    style: TextStyle(
                        color: isWhiteBg
                            ? primaryColor
                            : const Color.fromARGB(255, 255, 255, 255),
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                  )));
  }
}
