// ignore_for_file: prefer_typing_uninitialized_variables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:training_app/common_widgets/custom_elevated_button.dart';
import 'package:training_app/common_widgets/custom_text_form_field.dart';
import 'package:training_app/constants/text_font_style.dart';
import 'package:training_app/gen/assets.gen.dart';
import 'package:training_app/gen/colors.gen.dart';
import 'package:training_app/helpers/all_routes.dart';
import 'package:training_app/helpers/navigation_service.dart';
import 'package:training_app/helpers/toast.dart';
import 'package:training_app/helpers/ui_helpers.dart';
import 'package:training_app/networks/api_access.dart';
import 'package:training_app/providers/auth_providers.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final authProvider;
  @override
  void initState() {
    super.initState();
    authProvider = Provider.of<AuthProviders>(context, listen: false);
  }

  final _formKey = GlobalKey<FormState>();
  Future<void> submitForm() async {
    try {
      if (_formKey.currentState!.validate()) {
        setState(() {
          _isLoading = true;
        });
        await getLoginRxObj
            .getLoginRX(
          email: authProvider.loginEmailController.text,
          password: authProvider.logInPassController.text,
        )
            .then((value) {
          setState(() {
            _isLoading = false;
          });
          if (value) {
            NavigationService.navigateToReplacement(Routes.bottomNavigation);
          } else {
            ToastUtil.showShortToast("Invalid Credentials");
          }
          // value.
          // getOwnProfileRxObj.getOwnProfileRx();
        });
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      ToastUtil.showShortToast(e.toString());
    }
  }

  bool isObscure = true;
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AuthProviders>(context);
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
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 50.w),
                      child: Row(
                        children: [
                          Text(
                            "EMAIL ADDRESS",
                            textAlign: TextAlign.start,
                            style: TextFontStyle
                                .headline16w400cF4F4F4StyleOpenSans
                                .copyWith(
                              fontFamily: 'SweetSansPro',
                            ),
                          ),
                        ],
                      ),
                    ),
                    UIHelper.verticalSpace(8.h),

                    ///Form Field : First Name
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 50.w),
                      child: CustomFormField(
                        controller: provider.loginEmailController,
                        hintText: "Email",
                        validator: (value) {
                          final bool emailValid = RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value ?? "");
                          if (value == null || value.isEmpty) {
                            return "Please enter your email";
                          } else if (!emailValid) {
                            return "Please enter a valid email";
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                    UIHelper.verticalSpace(20.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 50.w),
                      child: Row(
                        children: [
                          Text(
                            "PASSWORD",
                            textAlign: TextAlign.start,
                            style: TextFontStyle
                                .headline16w400cF4F4F4StyleOpenSans
                                .copyWith(
                              fontFamily: 'SweetSansPro',
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 50.w),
                      child: CustomFormField(
                        controller: provider.logInPassController,
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
                    ),

                    ///Form Field : Last Name
                    // Padding(
                    //   padding: EdgeInsets.symmetric(horizontal: 50.w),
                    //   child: CustomFormField(
                    //     controller: provider.logInPassController,
                    //     hintText: "********",
                    //   ),
                    // ),
                    UIHelper.verticalSpace(50.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 50.w),
                      child: CustomElevatedButton(
                        onTap: () {
                          submitForm();
                        },
                        title: 'LOGIN',
                        color: Color(0xFFFFD700),
                        textStyle: TextFontStyle.headline24w600c000000StyleLato
                            .copyWith(
                          fontFamily: 'SweetSansPro',
                        ),
                      ),
                    ),
                    UIHelper.verticalSpace(30.h),
                    GestureDetector(
                      onTap: () {
                        NavigationService.navigateTo(
                            Routes.forgetPasswordScreen);
                      },
                      child: Text(
                        'Forgot Password',
                        style: TextFontStyle.headline20w500cFEDE1CStyleOpenSans
                            .copyWith(
                          decoration: TextDecoration.underline,
                          fontFamily: 'SweetSansPro',
                        ),
                      ),
                    ),
                    UIHelper.verticalSpace(100.h),
                    RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                            text: "THE ",
                            style: TextFontStyle.headline16w500c000000StyleInter
                                .copyWith(
                              fontSize: 20.sp,
                              fontFamily: 'SweetSansPro',
                            ),
                            children: [
                              TextSpan(
                                text: "INDIVIDUAL ",
                                style: TextFontStyle
                                    .headline20w500cFEDE1CStyleOpenSans
                                    .copyWith(
                                  fontFamily: 'SweetSansPro',
                                ),
                              ),
                              TextSpan(
                                  text: "WITHIN\nTHE COLLECTIVE.",
                                  style: TextFontStyle
                                      .headline16w500c000000StyleInter
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
