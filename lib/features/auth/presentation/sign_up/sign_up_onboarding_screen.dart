import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:training_app/common_widgets/custom_elevated_button.dart';
import 'package:training_app/constants/text_font_style.dart';
import 'package:training_app/gen/assets.gen.dart';
import 'package:training_app/gen/colors.gen.dart';
import 'package:training_app/helpers/all_routes.dart';
import 'package:training_app/helpers/navigation_service.dart';
import 'package:training_app/helpers/ui_helpers.dart';

class SignUpOnboardingScreen extends StatelessWidget {
  const SignUpOnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(Assets.images.logInBackground.path),
                fit: BoxFit.cover)),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              UIHelper.verticalSpace(60.h),
              GestureDetector(
                onTap: () {
                  NavigationService.goBack;
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Row(
                    children: [
                      Icon(
                        Icons.keyboard_arrow_left,
                        color: AppColors.cffffff,
                        size: 30.sp,
                      ),
                      Text(
                        "Back",
                        style: TextFontStyle.text14cffffffw400OpenSans.copyWith(
                          fontSize: 17.sp,
                          fontFamily: 'SweetSansPro',
                        ),
                      )
                    ],
                  ),
                ),
              ),
              UIHelper.verticalSpace(10.h),
              Image.asset(
                Assets.images.applogo.path,
                height: 120.h,
                width: 120.w,
              ),
              UIHelper.verticalSpace(70.h),

              ///Sign Up With Google Button
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.w),
                child: CustomElevatedButton(
                  height: 55.h,
                  onTap: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        fit: BoxFit.cover,
                        Assets.icons.googleIcon,
                      ),
                      UIHelper.horizontalSpace(16.w),
                      Text(
                        "Sign up with Google",
                        style: TextFontStyle.headline18w400c1C1C1CStyleInter
                            .copyWith(
                          fontFamily: 'SweetSansPro',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // UIHelper.verticalSpace(22.h),

              // ///Sign Up With Facebook Button
              // Padding(
              //   padding: EdgeInsets.symmetric(horizontal: 40.w),
              //   child: CustomElevatedButton(
              //     height: 55.h,
              //     onTap: () {},
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.center,
              //       crossAxisAlignment: CrossAxisAlignment.center,
              //       children: [
              //         SvgPicture.asset(
              //           fit: BoxFit.cover,
              //           Assets.icons.faceBookIcon,
              //         ),
              //         UIHelper.horizontalSpace(16.w),
              //         Text(
              //           "Sign up with Facebook",
              //           style: TextFontStyle.headline18w400c1C1C1CStyleInter,
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              UIHelper.verticalSpace(30.h),

              ///Or Section
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 60.w),
                child: Row(
                  children: [
                    ///Left Divider
                    Expanded(
                      child: Divider(
                        thickness: 1.sp,
                        color: AppColors.cF4F4F4,
                      ),
                    ),
                    UIHelper.horizontalSpace(10.w),

                    ///Text : Or
                    Text(
                      "Or",
                      style: TextFontStyle.headline20w400c000000StyleOpenSans
                          .copyWith(
                        fontFamily: 'SweetSansPro',
                      ),
                    ),
                    UIHelper.horizontalSpace(10.w),
                    Expanded(
                      child: Divider(
                        thickness: 1.sp,
                        color: AppColors.cF4F4F4,
                      ),
                    ),
                  ],
                ),
              ),
              UIHelper.verticalSpace(25.h),

              ///Sign Up With Facebook Button
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.w),
                child: CustomElevatedButton(
                  height: 55.h,
                  onTap: () {
                    NavigationService.navigateTo(Routes.onboardingScreenThree);
                  },
                  title: "Sign up with E-mail",
                  textStyle:
                      TextFontStyle.headline18w400c1C1C1CStyleInter.copyWith(
                    fontFamily: 'SweetSansPro',
                  ),
                ),
              ),
              UIHelper.verticalSpace(120.h),
              RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      text: "THE ",
                      style: TextFontStyle.headline16w500c000000StyleInter
                          .copyWith(
                            fontFamily: 'SweetSansPro',
                          )
                          .copyWith(fontSize: 20.sp),
                      children: [
                        TextSpan(
                            text: "INDIVIDUAL ",
                            style: TextFontStyle
                                .headline20w500cFEDE1CStyleOpenSans
                                .copyWith(
                              fontFamily: 'SweetSansPro',
                            )),
                        TextSpan(
                            text: "WITHIN\nTHE COLLECTIVE.",
                            style: TextFontStyle.headline16w500c000000StyleInter
                                .copyWith(
                              fontSize: 20.sp,
                              fontFamily: 'SweetSansPro',
                            ))
                      ])),
              UIHelper.verticalSpace(90.h),
            ],
          ),
        ),
      ),
    );
  }
}
