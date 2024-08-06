// import 'package:flutter/material.dart';

// class DropDown extends StatelessWidget {
//   final String? initValue;
//   final List<dynamic>? items;
//   final Function(String?)? onChanged;
//   final Color? dropdownColor;
//   final TextStyle? style;
//   final Color? iconColor;
//   const DropDown({
//     this.initValue,
//     this.items,
//     this.onChanged,
//     this.dropdownColor,
//     this.style,
//     this.iconColor,
//     super.key,
//   });
//   @override
//   Widget build(BuildContext context) {
//     return renderDrowdown(
//         context, initValue, items, onChanged, dropdownColor, style, iconColor);
//   }
// }

// Widget renderDrowdown(BuildContext context, initValue, List<dynamic>? items,
//     onChanged, backgroundColor, style, iconColor) {
//   return DropdownButton(
//       dropdownColor: Colors.grey.shade300,
//       isExpanded: true,
//       style: style,
//       elevation: 0,
//       value: initValue,
//       iconSize: 0.0,
//       iconDisabledColor: Colors.black,
//       iconEnabledColor: iconColor,
//       focusColor: backgroundColor,
//       underline: const SizedBox(),
//       items: items!.map((dynamic items) {
//         return DropdownMenuItem(
//             value: items,
//             child: Text(items,
//                 style: const TextStyle(
//                     color: Color(0xff17181A),
//                     fontSize: 14,
//                     fontWeight: FontWeight.w600)));
//       }).toList(),
//       onChanged: onChanged);
// }
