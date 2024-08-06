import 'package:doc_ease/ui/common/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Input extends StatelessWidget {
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? trailing;
  final Widget? suffixIcon;
  final bool obscureText;
  final void Function(String)? onChanged;
  final TextInputAction? textInputAction;
  final String? initialValue;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final int? maxLines;
  final int? maxLength;
  final TextStyle? hintstyle;
  final TextStyle? textStyle;
  final EdgeInsets? margin;
  final TextCapitalization? textCapitalization;
  final FocusNode? focusNode;
  final void Function(String)? onFieldSubmitted;
  final bool readOnly;
  final void Function()? onTap;
  final void Function()? onEditingComplete;
  final bool autofocus;
  final double? letterSpacing;
  final bool textAlign;
  final List<TextInputFormatter>? inputFormatters;

  const Input(
      {this.hintText,
      this.prefixIcon,
      this.trailing,
      this.suffixIcon,
      this.obscureText = false,
      this.onChanged,
      this.textInputAction,
      this.initialValue,
      this.keyboardType,
      this.controller,
      this.maxLines,
      this.maxLength,
      this.textStyle,
      this.margin,
      this.textCapitalization,
      this.focusNode,
      this.onFieldSubmitted,
      this.readOnly = false,
      this.onTap,
      this.autofocus = true,
      this.letterSpacing,
      this.textAlign = false,
      this.onEditingComplete,
      this.inputFormatters,
      this.hintstyle,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            color: Color.fromARGB(255, 248, 249, 255),
            border: Border(bottom: BorderSide(color: primaryColor, width: 1))),
        child: Row(children: [
          Expanded(
              child: TextFormField(
                  textAlign: textAlign ? TextAlign.center : TextAlign.start,
                  onTap: onTap,
                  controller: controller,
                  inputFormatters: inputFormatters,
                  readOnly: readOnly,
                  obscureText: obscureText,
                  decoration: InputDecoration(
                      hintText: hintText,
                      hintStyle: hintstyle,
                      counterText: '',
                      prefixIcon: prefixIcon,
                      suffixIcon: suffixIcon,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide.none)),
                  textAlignVertical: TextAlignVertical.center,
                  style: const TextStyle(
                      letterSpacing: 0,
                      fontSize: 18,
                      color: kcDarkGreyColor,
                      fontWeight: FontWeight.w700),
                  onChanged: onChanged,
                  onEditingComplete: onEditingComplete,
                  autocorrect: false,
                  autofocus: autofocus,
                  textInputAction: textInputAction,
                  initialValue: initialValue,
                  keyboardType: keyboardType,
                  maxLines: maxLines,
                  maxLength: maxLength,
                  focusNode: focusNode,
                  onFieldSubmitted: onFieldSubmitted,
                  textCapitalization:
                      textCapitalization ?? TextCapitalization.none)),
          trailing ?? Container()
        ]));
  }
}
