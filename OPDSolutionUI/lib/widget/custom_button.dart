// import 'package:flutter/material.dart';

// import '../ui/common/app_colors.dart';

// class CustomButton extends StatelessWidget {
//   final String title;
//   final GestureTapCallback? onPressed;
//   final EdgeInsets? margin;
//   final bool loading;
//   final bool disabled;
//   final double? height;
//   final double? width;
//   final Color? borderColor;
//   final TextStyle? textStyle;
//   final bool borderCheck;

//   const CustomButton({
//     required this.onPressed,
//     required this.title,
//     this.margin,
//     this.loading = false,
//     this.disabled = false,
//     this.height,
//     this.width,
//     this.borderColor,
//     this.textStyle,
//     this.borderCheck = false,
//     Key? key,
//   }) : super(key: key);

//   Widget getLoadingIndicator() {
//     return const SizedBox(
//         width: 20,
//         height: 20,
//         child:
//             CircularProgressIndicator(strokeWidth: 2.5, color: Colors.white));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: (disabled || loading) ? null : onPressed,
//       child: Container(
//         decoration: borderCheck
//             ? BoxDecoration(border: Border.all(color: primaryColor))
//             : const BoxDecoration(
//                 color: primaryLight,
//                 border: Border(
//                     right: BorderSide(
//                         color: Color.fromARGB(255, 248, 245, 245), width: 2.0),
//                     bottom: BorderSide(
//                         color: Color.fromARGB(255, 248, 245, 245), width: 2.0),
//                     left: BorderSide(color: Colors.black12, width: 2),
//                     top: BorderSide(color: Colors.black12, width: 2))),
//         child: Padding(
//           padding: const EdgeInsets.only(top: 4.5, left: 5),
//           child: Container(
//               decoration: const BoxDecoration(
//                   borderRadius: BorderRadius.all(Radius.circular(8)),
//                   color: Color(0xfff8f9ff)),
//               margin: margin,
//               width: width ?? MediaQuery.of(context).size.width,
//               height: height ?? 100,
//               child: Center(
//                   child: Text(title,
//                       style: const TextStyle(
//                           fontSize: 20, fontWeight: FontWeight.w800)))),
//         ),
//       ),
//     );
//   }
// }
