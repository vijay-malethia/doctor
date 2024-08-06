import 'package:flutter/material.dart';
import '/ui/common/index.dart';

class DropDown extends StatelessWidget {
  final String? initValue;
  final List<dynamic>? items;
  final Function(String?)? onChanged;

  final Color? iconColor;

  const DropDown({
    this.initValue,
    this.items,
    this.onChanged,
    this.iconColor,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 64,
        padding: const EdgeInsets.only(left: 10, right: 10),
        alignment: Alignment.center,
        decoration: const BoxDecoration(
            color: Color.fromARGB(255, 248, 249, 255),
            border: Border(bottom: BorderSide(color: primaryColor, width: 1))),
        child: renderDrowdown(context, initValue, items, onChanged, iconColor));
  }
}

Widget renderDrowdown(BuildContext context, initValue, List<dynamic>? items,
    onChanged, iconColor) {
  return DropdownButton(
      isExpanded: true,
      style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Color.fromARGB(255, 23, 25, 27)),
      elevation: 0,
      value: initValue,
      iconDisabledColor: Colors.black,
      dropdownColor: bglightColor,
      iconEnabledColor: iconColor,
      focusColor: bglightColor,
      underline: const SizedBox(),
      icon: const Icon(Icons.keyboard_arrow_down),
      items: items!.map((dynamic items) {
        return DropdownMenuItem(value: items, child: Text(items));
      }).toList(),
      onChanged: onChanged);
}
