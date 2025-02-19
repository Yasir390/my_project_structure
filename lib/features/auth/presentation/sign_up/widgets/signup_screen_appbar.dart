import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:training_app/constants/text_font_style.dart';
import 'package:training_app/gen/colors.gen.dart';
import 'package:training_app/helpers/navigation_service.dart';
import 'package:training_app/helpers/ui_helpers.dart';

class SignupScreenAppBar extends StatelessWidget {
  const SignupScreenAppBar({super.key, required this.progressLineValue});
  final double progressLineValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 4.w,
        right: 32.w,
        top: 20.h,
        bottom: 20.h,
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Row(
          children: [
            InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () {
                NavigationService.goBack;
              },
              child: Row(
                children: [
                  const Icon(
                    Icons.arrow_back_ios,
                    color: AppColors.cffffff,
                  ),
                  Text(
                    'Back',
                    style: TextFontStyle.headline17w400cFFFFFFStyleOpenSans
                        .copyWith(
                      fontFamily: 'SweetSansPro',
                    ),
                  ),
                ],
              ),
            ),
            UIHelper.horizontalSpace(30.w),
            Expanded(
              child: LinearProgressIndicator(
                color: AppColors.cfede1c,
                backgroundColor: AppColors.c515151,
                borderRadius: BorderRadius.circular(53.sp),
                value: progressLineValue,
                minHeight: 5.h,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
