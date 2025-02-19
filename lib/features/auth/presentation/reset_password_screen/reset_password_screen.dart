// ignore_for_file: unused_import, unused_local_variable, prefer_const_constructors, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:training_app/common_widgets/custom_elevated_button.dart';
import 'package:training_app/common_widgets/custom_text_form_field.dart';
import 'package:training_app/constants/text_font_style.dart';
import 'package:training_app/features/auth/presentation/sign_up/signup_screen.dart';
import 'package:training_app/gen/assets.gen.dart';
import 'package:training_app/gen/colors.gen.dart';
import 'package:training_app/helpers/all_routes.dart';
import 'package:training_app/helpers/navigation_service.dart';
import 'package:training_app/helpers/toast.dart';
import 'package:training_app/helpers/ui_helpers.dart';
import 'package:training_app/networks/api_access.dart';
import 'package:training_app/providers/auth_providers.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key, required this.email});
  final String email;

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  bool isObscure = true;
  bool isConfirmPassObscure = true;

  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();

    super.dispose();
  }

  Future<void> submitForm() async {
    if (_formKey.currentState!.validate()) {
      try {
        setState(() {
          _isLoading = true;
        });
        final success = await postResetPasswordRxObj.postResetPasswordRx(
          email: widget.email,
          password: _passwordController.text,
          passwordConfirmation: _confirmPasswordController.text,
        );

        if (success) {
          setState(() {
            _isLoading = false;
          });
          ToastUtil.showShortToast("Success");
          NavigationService.navigateToReplacement(Routes.signIsScreen);
        } else {
          setState(() {
            _isLoading = false;
          });
          ToastUtil.showShortToast("Reset password failed: Unknown error");
        }
      } catch (error) {
        setState(() {
          _isLoading = false;
        });
        ToastUtil.showShortToast("Reset password failed: ${error.toString()}");
      }
    } else {
      setState(() {
        _isLoading = false;
      });
      ToastUtil.showShortToast("Invalid form data");
    }
  }

  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    // final provider = Provider.of<AuthProviders>(context);
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(Assets.images.logInBackground.path),
                fit: BoxFit.cover)),
        child: Stack(
          children: [
            SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Form(
                key: _formKey,
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
                              style: TextFontStyle.text14cffffffw400OpenSans
                                  .copyWith(fontSize: 17.sp),
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

                    const Row(
                      children: [
                        // TextFieldLabelWidget(
                        //   text: "Password",
                        // ),
                      ],
                    ),

                    ///Form Field : Last Name
                    CustomFormField(
                      controller: _passwordController,
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            isObscure = !isObscure;
                          });
                        },
                        child: Icon(isObscure
                            ? Icons.visibility_off
                            : Icons.visibility),
                      ),
                      hintText: "********",
                      obscureText: isObscure,
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            value.length < 8) {
                          return "Enter Minimum 8 Digit";
                        } else {
                          return null;
                        }
                      },
                    ),
                    UIHelper.verticalSpace(20.h),
                    const Row(
                      children: [
                        // TextFieldLabelWidget(
                        //   text: "Confirm Password",
                        // ),
                      ],
                    ),

                    ///Form Field : Last Name
                    CustomFormField(
                      controller: _confirmPasswordController,
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            isConfirmPassObscure = !isConfirmPassObscure;
                          });
                        },
                        child: Icon(isConfirmPassObscure
                            ? Icons.visibility_off
                            : Icons.visibility),
                      ),
                      hintText: "********",
                      obscureText: isConfirmPassObscure,
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            value.length < 8) {
                          return "Enter Minimum 8 Digit";
                        } else {
                          return null;
                        }
                      },
                    ),

                    UIHelper.verticalSpace(50.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 50.w),
                      child: CustomElevatedButton(
                        onTap: () {
                          if (_passwordController.text !=
                              _confirmPasswordController.text) {
                            ToastUtil.showShortToast(
                                "Passwords and confirm password must be same");
                          } else {
                            submitForm();
                          }

                          // submitForm(email: _emailController.text);
                          // NavigationService.navigateTo(Routes.otpVerifyScreen);
                        },
                        title: 'Submit',
                        color: AppColors.cfbd518,
                        textStyle: TextFontStyle.headline24w600c000000StyleLato,
                      ),
                    ),

                    UIHelper.verticalSpace(100.h),
                    RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                            text: "THE ",
                            style: TextFontStyle.headline16w500c000000StyleInter
                                .copyWith(fontSize: 20.sp),
                            children: [
                              TextSpan(
                                  text: "INDIVIDUAL ",
                                  style: TextFontStyle
                                      .headline20w500cFEDE1CStyleOpenSans),
                              TextSpan(
                                  text: "WITHIN\nTHE COLLECTIVE.",
                                  style: TextFontStyle
                                      .headline16w500c000000StyleInter
                                      .copyWith(fontSize: 20.sp))
                            ])),
                    UIHelper.verticalSpace(90.h),
                  ],
                ),
              ),
            ),
            if (_isLoading)
              SpinKitCircle(
                color: Colors.yellow,
                size: 50.0,
              ),
          ],
        ),
      ),
    );
  }
}
