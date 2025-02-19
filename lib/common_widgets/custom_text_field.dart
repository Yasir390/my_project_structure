import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:training_app/constants/text_font_style.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    this.onChanged,
    this.prefixIcon,
    this.prefixIconColor,
    this.hintText,
    this.validator,
    this.fillColor,
    this.isRead = false,
    this.cursorColor,
    this.hintStyle,
    this.suffixIcon,
    this.onTap,
    this.width,
    this.height,
    this.iconSize,
    this.style,
  });

  final TextEditingController controller;
  final Function(String)? onChanged;
  final Widget? prefixIcon;
  final Color? prefixIconColor;
  final String? hintText;
  final String? Function(String?)? validator;
  final Color? fillColor;
  final Color? cursorColor;
  final bool isRead;
  final TextStyle? hintStyle;
  final Widget? suffixIcon;
  final double? width;
  final double? height;
  final double? iconSize;
  final TextStyle? style;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: TextFormField(
        validator: validator,
        readOnly: isRead,
        onTap: onTap,
        style: style ??
            TextFontStyle.text14cA2A2A2w600OpenSans
                .copyWith(fontSize: 17.sp, fontWeight: FontWeight.w400),
        onChanged: onChanged,
        controller: controller,
        cursorColor: cursorColor ?? Colors.yellow,
        decoration: InputDecoration(
            fillColor: fillColor,
            filled: true,
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
            hintText: hintText,
            hintStyle: hintStyle ??
                TextFontStyle.text14cA2A2A2w600OpenSans
                    .copyWith(fontSize: 17.sp, fontWeight: FontWeight.w400),
            border: const OutlineInputBorder(
              borderSide: BorderSide.none,
            )),
      ),
    );
  }
}
