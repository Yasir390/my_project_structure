import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:training_app/common_widgets/custom_button.dart';
import 'package:training_app/constants/text_font_style.dart';
import 'package:training_app/gen/assets.gen.dart';
import 'package:training_app/helpers/ui_helpers.dart';

class CustomComingSoonBlur extends StatelessWidget {
  final String? title;
  final String? btnName;
  const CustomComingSoonBlur({
    super.key,
    this.title,
    this.btnName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 275,
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage(
            Assets.images.comingsoonblur.path,
          ),
          fit: BoxFit.cover,
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title ?? "COMING SOON",
              style: TextFontStyle.headline23w600c000000StyleOpenSans.copyWith(
                fontFamily: 'SweetSansPro',
              ),
            ),
            UIHelper.verticalSpace(4.h),
            customeButton(
                name: btnName ?? "PRO PLAN",
                onCallBack: () {},
                height: 45.h,
                minWidth: 160.w,
                borderRadius: 0.r,
                color: const Color(0xFFFFD700),
                borderColor: const Color(0xFFFFD700),
                textStyle:
                    TextFontStyle.headline24w600c000000StyleOpenSans.copyWith(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'SweetSansPro',
                ),
                context: context),
          ],
        ));
  }
}
