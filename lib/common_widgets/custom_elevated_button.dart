import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:training_app/constants/text_font_style.dart';
import 'package:training_app/gen/colors.gen.dart';

class CustomElevatedButton extends StatelessWidget {
  final double? width;
  final double? height;
  final Color? color;
  final TextStyle? textStyle;
  final double? radius;
  final String? title;
  final void Function()? onTap;
  final Widget? child;

  const CustomElevatedButton({
    super.key,
    this.width,
    this.height,
    this.color,
    this.textStyle,
    this.radius,
    this.title,
    this.onTap,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height ?? 54.h,
        width: width ?? 1.sh,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius ?? 0.r),
          color: color ?? AppColors.cffffff,
        ),
        child: child ??
            Text(
              title ?? "",
              style:
                  textStyle ?? TextFontStyle.headline24w600c000000StyleOpenSans,
            ),
      ),
    );
  }
}
