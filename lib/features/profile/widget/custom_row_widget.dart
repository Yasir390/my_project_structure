import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:training_app/constants/text_font_style.dart';

class CustomRowWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final String title1;
  final String subtitle1;
  const CustomRowWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.title1,
    required this.subtitle1,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 52.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title.toUpperCase(),
                  style: TextFontStyle.headline16w400c898989StyleInter.copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'SweetSansPro',
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  subtitle,
                  style: TextFontStyle.text20cffffffw600OpenSans
                      .copyWith(fontSize: 18.sp),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title1.toUpperCase(),
                  style: TextFontStyle.headline16w400c898989StyleInter.copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'SweetSansPro',
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  subtitle1,
                  style: TextFontStyle.text20cffffffw600OpenSans
                      .copyWith(fontSize: 18.sp),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
