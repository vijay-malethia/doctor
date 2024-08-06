import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String title;
  final GestureTapCallback? onPressed;
  final EdgeInsets? margin;
  final bool loading;
  final bool disabled;

  const Button({
    required this.onPressed,
    required this.title,
    this.margin,
    this.loading = false,
    this.disabled = false,
    Key? key,
  }) : super(key: key);

  Widget getLoadingIndicator() {
    return const SizedBox(
      width: 20,
      height: 20,
      child: CircularProgressIndicator(
        strokeWidth: 2.5,
        color: Colors.white,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      margin: margin,
      child: ElevatedButton(
        style: Theme.of(context).elevatedButtonTheme.style,
        onPressed: (disabled || loading) ? null : onPressed,
        child: loading ? getLoadingIndicator() : Text(title),
      ),
    );
  }
}
