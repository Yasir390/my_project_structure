import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:training_app/constants/text_font_style.dart';

import '../gen/colors.gen.dart';

final class CustomFormField extends StatelessWidget {
  final String? hintText;
  final double? hintFontSize;
  final String? labelText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final double? fieldHeight;
  final int? maxline;
  final String? Function(String?)? validator;
  final bool? validation;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool obscureText;
  final bool isPass;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final Function(String)? onFieldSubmitted;
  final Function(String)? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final TextStyle? labelStyle;
  // final TextStyle? style;
  final bool? isEnabled;
  final double? cursorHeight;
  final Color? disableColor;
  final bool isRead;
  final double? borderRadius;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? contentPadding;
  final TextStyle? hintTextStyle;
  final void Function()? onTap;
  final Color? fillColor;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final InputBorder? errorBorder;
  final int? maxLength;
  final TextStyle? style;
  final TextAlign? textAlign;

  const CustomFormField({
    super.key,
    this.hintText,
    this.labelText,
    this.controller,
    this.keyboardType,
    this.fieldHeight,
    this.maxline,
    this.validator,
    this.validation = false,
    this.suffixIcon,
    this.prefixIcon,
    this.obscureText = false,
    this.isPass = false,
    this.focusNode,
    this.textInputAction = TextInputAction.next,
    this.onFieldSubmitted,
    this.onChanged,
    this.inputFormatters,
    this.labelStyle,
    this.isEnabled,
    // this.style,
    this.cursorHeight,
    this.disableColor,
    this.isRead = false,
    this.borderRadius,
    this.padding,
    this.contentPadding =
        const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
    this.hintFontSize,
    this.hintTextStyle,
    this.onTap,
    this.fillColor,
    this.enabledBorder,
    this.focusedBorder,
    this.errorBorder,
    this.maxLength,
    this.style,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? EdgeInsets.zero,
      height: fieldHeight,
      child: TextFormField(
        maxLength: maxLength,
        readOnly: isRead,

        style: style ?? TextFontStyle.text14cffffffw400OpenSans,
        textAlign: textAlign ?? TextAlign.start,
        cursorHeight: cursorHeight ?? 20.h,
        cursorColor: const Color(0xFFFFD700),
        focusNode: focusNode,
        obscureText: obscureText,
        textInputAction: textInputAction,
        autovalidateMode: validation!
            ? AutovalidateMode.always
            : AutovalidateMode.onUserInteraction,
        validator: validator,
        maxLines: maxline ?? 1,

        controller: controller,
        onFieldSubmitted: onFieldSubmitted,
        onTap: onTap,
        onChanged: onChanged,
        inputFormatters: inputFormatters,
        enabled: isEnabled,
        // obscuringCharacter: ".",
        decoration: InputDecoration(
          counterText: '', // This hides the max length text
          filled: true,
          fillColor: fillColor ?? AppColors.c020202,
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon != null
              ? Padding(
                  padding: EdgeInsets.all(12.sp),
                  child: prefixIcon,
                )
              : null,
          contentPadding: contentPadding ?? EdgeInsets.zero,
          hintText: hintText,
          hintStyle: hintTextStyle ?? TextFontStyle.text14c3D3D3Dw400OpenSans,
          labelText: labelText,
          errorStyle: TextStyle(
            fontSize: 10.sp,
            fontWeight: FontWeight.w400,
            // color: AppColors.cD12E34,
          ),
          enabledBorder: enabledBorder ??
              const UnderlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.c515151,
                ), // Bottom border
              ),
          focusedErrorBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
            ), // Bottom border
          ),
          focusedBorder: focusedBorder ??
              const UnderlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.c515151,
                ), // Bottom border
              ),
          // disabledBorder: OutlineInputBorder(
          //   borderRadius: BorderRadius.circular(borderRadius ?? 48.0.r),
          //   borderSide: const BorderSide(
          //     // color: disableColor ?? AppColors.c6D6D6D.withOpacity(0.19),
          //     width: 1,
          //   ),
          // ),
          errorBorder: errorBorder ??
              OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.red,
                ),
                borderRadius: BorderRadius.circular(borderRadius ?? 12.r),
              ),
        ),
        // style: style ?? TextFontStyle.headline16w400C161C24,
        keyboardType: keyboardType,
      ),
    );
  }
}
