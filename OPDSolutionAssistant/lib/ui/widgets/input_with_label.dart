import 'package:doc_ease/ui/common/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputWithLabel extends StatelessWidget {
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? trailing;
  final Widget? suffixIcon;
  final bool obscureText;
  final void Function(String)? onChanged;
  final String? initialValue;
  final String? label;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final int? maxLines;
  final TextInputAction? textInputAction;

  final int? maxLength;
  final TextStyle? textStyle;
  final EdgeInsets? margin;
  final TextAlign? textAlign;
  final TextCapitalization? textCapitalization;
  final FocusNode? focusNode;
  final void Function(String)? onFieldSubmitted;
  final bool readOnly;
  final void Function()? onTap;
  final bool autofocus;
  final List<TextInputFormatter>? inputformat;

  const InputWithLabel(
      {this.hintText,
      this.prefixIcon,
      this.trailing,
      this.suffixIcon,
      this.maxLines,
      this.obscureText = false,
      this.onChanged,
      this.initialValue,
      this.label,
      this.textInputAction,
      this.keyboardType,
      this.controller,
      this.textAlign,
      this.maxLength,
      this.textStyle,
      this.margin,
      this.textCapitalization,
      this.focusNode,
      this.onFieldSubmitted,
      this.readOnly = false,
      this.onTap,
      this.autofocus = true,
      Key? key,
      this.inputformat})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: label == null ? 65 : 65,
        decoration: const BoxDecoration(
            color: Color(0xffe8e8ec),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(2),
                topRight: Radius.circular(3),
                bottomLeft: Radius.circular(3),
                bottomRight: Radius.circular(3))),
        child: Padding(
            padding: const EdgeInsets.only(top: 5, left: 5),
            child: Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(5),
                        bottomRight: Radius.circular(5),
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5)),
                    color: primaryLight),
                child: Row(children: [
                  Expanded(
                      flex: 5,
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                    padding: const EdgeInsets.only(left: 14),
                                    child: Text(
                                      '$label',
                                      style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600),
                                    )),
                                if (hintText != null) verticalSpaceTiny,
                                SizedBox(
                                    height: 25,
                                    child: TextFormField(
                                        inputFormatters: inputformat,
                                        maxLines: maxLines,
                                        onTap: onTap,
                                        controller: controller,
                                        readOnly: readOnly,
                                        obscureText: obscureText,
                                        textAlign: textAlign ?? TextAlign.left,
                                        decoration: InputDecoration(
                                            hintText: hintText,
                                            counterText: '',
                                            prefixIcon: prefixIcon,
                                            suffixIcon: suffixIcon,
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                borderSide: BorderSide.none)),
                                        textAlignVertical:
                                            TextAlignVertical.bottom,
                                        style: const TextStyle(
                                            height: 1,
                                            color:
                                                Color.fromARGB(255, 33, 31, 31),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500),
                                        onChanged: onChanged,
                                        autocorrect: false,
                                        autofocus: autofocus,
                                        textInputAction: textInputAction,
                                        initialValue: initialValue,
                                        keyboardType: keyboardType,
                                        maxLength: maxLength,
                                        focusNode: focusNode,
                                        cursorHeight: 18,
                                        onFieldSubmitted: onFieldSubmitted,
                                        textCapitalization:
                                            textCapitalization ??
                                                TextCapitalization.none))
                              ]))),
                  Expanded(flex: 1, child: trailing ?? Container())
                ]))));
  }
}
