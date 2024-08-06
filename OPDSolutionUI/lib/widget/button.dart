import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String title;

  final GestureTapCallback? onPressed;

  final EdgeInsets? margin;

  final bool loading;

  final bool disabled;

  final double? height;

  final double? width;

  final Color? borderColor;

  final TextStyle? textStyle;

  final Color backgroundColor;

  const Button({
    required this.onPressed,
    required this.title,
    required this.backgroundColor,
    this.margin,
    this.loading = false,
    this.disabled = false,
    this.height,
    this.width,
    this.borderColor,
    this.textStyle,
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
        decoration: BoxDecoration(
            color: borderColor,
            borderRadius: const BorderRadius.all(Radius.circular(8))),
        child: Padding(
            padding: const EdgeInsets.only(top: 4.5, left: 5),
            child: Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    color: Color(0xffebecf2)),
                margin: margin,
                width: width ?? MediaQuery.of(context).size.width,
                height: height ?? 100,
                child: ElevatedButton(
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                            const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)))),
                        backgroundColor:
                            MaterialStateProperty.all(backgroundColor)),
                    onPressed: (disabled || loading) ? null : onPressed,
                    child: loading
                        ? getLoadingIndicator()
                        : Text(title, style: textStyle)))));
  }
}
