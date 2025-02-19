// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:provider/provider.dart';
// import 'package:training_app/common_widgets/custom_elevated_button.dart';
// import 'package:training_app/common_widgets/custom_text_form_field.dart';
// import 'package:training_app/constants/text_font_style.dart';
// import 'package:training_app/features/auth/presentation/sign_up/widgets/signup_screen_appbar.dart';
// import 'package:training_app/gen/colors.gen.dart';
// import 'package:training_app/helpers/all_routes.dart';
// import 'package:training_app/helpers/navigation_service.dart';
// import 'package:training_app/helpers/toast.dart';
// import 'package:training_app/helpers/ui_helpers.dart';
// // import 'package:training_app/providers/onboarding_screen_three_provider.dart';

// class SignUpScreen extends StatefulWidget {
//   const SignUpScreen({super.key});

//   @override
//   State<SignUpScreen> createState() => _SignUpScreenState();
// }

// class _SignUpScreenState extends State<SignUpScreen> {
//   bool isObscure = true;
//   bool isConfirmPassObscure = true;
//   final _formKey = GlobalKey<FormState>();
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<SignupScreenProvider>(
//       builder: (context, provider, child) {
//         return Scaffold(
//           backgroundColor: AppColors.c020202,
//           body: SingleChildScrollView(
//             child: SafeArea(
//               child: Form(
//                 key: _formKey,
//                 child: Column(
//                   children: [
//                     /// AppBar
//                     const SignupScreenAppBar(
//                       progressLineValue: 0.5,
//                     ),
//                     UIHelper.verticalSpace(20.w),

//                     Align(
//                       alignment: Alignment.centerLeft,
//                       child: Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 40.w),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             /// Text: Hello...
//                             Text(
//                               "Hello!\nTell us about you..",
//                               textAlign: TextAlign.start,
//                               style: TextFontStyle
//                                   .headline21w400cF4F4F4StyleOpenSans
//                                   .copyWith(
//                                 fontFamily: 'SweetSansPro',
//                               ),
//                             ),
//                             UIHelper.verticalSpace(30.h),

//                             /// Text: First Name
//                             Text(
//                               "Name",
//                               textAlign: TextAlign.start,
//                               style: TextFontStyle
//                                   .headline16w400cF4F4F4StyleOpenSans
//                                   .copyWith(
//                                 fontFamily: 'SweetSansPro',
//                               ),
//                             ),
//                             UIHelper.verticalSpace(8.h),

//                             /// Form Field: First Name
//                             CustomFormField(
//                               controller: provider.nameController,
//                               hintText: "Name",
//                               validator: (value) {
//                                 if (value == null || value.isEmpty) {
//                                   return "Name is required";
//                                 } else {
//                                   return null;
//                                 }
//                               },
//                             ),
//                             UIHelper.verticalSpace(20.h),
//                             const TextFieldLabelWidget(
//                               text: "Email",
//                             ),
//                             UIHelper.verticalSpace(8.h),

//                             ///Form Field : email
//                             CustomFormField(
//                               controller: provider.emailController,
//                               hintText: "Email",
//                               validator: (value) {
//                                 final bool emailValid = RegExp(
//                                         r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
//                                     .hasMatch(value ?? "");
//                                 if (value == null || value.isEmpty) {
//                                   return "Please enter your email";
//                                 } else if (!emailValid) {
//                                   return "Please enter a valid email";
//                                 } else {
//                                   return null;
//                                 }
//                               },
//                             ),
//                             UIHelper.verticalSpace(20.h),
//                             const TextFieldLabelWidget(
//                               text: "Password",
//                             ),

//                             CustomFormField(
//                               controller: provider.passwordController,
//                               suffixIcon: GestureDetector(
//                                 onTap: () {
//                                   setState(() {
//                                     isObscure = !isObscure;
//                                   });
//                                 },
//                                 child: Icon(isObscure
//                                     ? Icons.visibility_off
//                                     : Icons.visibility),
//                               ),
//                               hintText: "********",
//                               obscureText: isObscure,
//                               validator: (value) {
//                                 if (value == null ||
//                                     value.isEmpty ||
//                                     value.length < 8) {
//                                   return "Enter Minimum 8 Digit";
//                                 } else {
//                                   return null;
//                                 }
//                               },
//                             ),
//                             UIHelper.verticalSpace(20.h),
//                             const TextFieldLabelWidget(
//                               text: "Confirm Password",
//                             ),

//                             ///Form Field : Last Name
//                             CustomFormField(
//                               controller: provider.confirmPasswordController,
//                               suffixIcon: GestureDetector(
//                                 onTap: () {
//                                   setState(() {
//                                     isConfirmPassObscure =
//                                         !isConfirmPassObscure;
//                                   });
//                                 },
//                                 child: Icon(isConfirmPassObscure
//                                     ? Icons.visibility_off
//                                     : Icons.visibility),
//                               ),
//                               hintText: "********",
//                               obscureText: isConfirmPassObscure,
//                               validator: (value) {
//                                 if (value == null ||
//                                     value.isEmpty ||
//                                     value.length < 8) {
//                                   return "Enter Minimum 8 Digit";
//                                 } else {
//                                   return null;
//                                 }
//                               },
//                             ),
//                             UIHelper.verticalSpace(20.h),

//                             /// Date of Birth and Age Section
//                             Row(
//                               children: [
//                                 /// Date of Birth Section
//                                 Flexible(
//                                   flex: 3,
//                                   child: Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       /// Text: Date of Birth
//                                       ///
//                                       const TextFieldLabelWidget(
//                                         text: "Date of Birth",
//                                       ),

//                                       UIHelper.verticalSpace(8.h),

//                                       /// Form Field: Date of Birth
//                                       CustomFormField(
//                                         controller:
//                                             provider.selectedDateController,
//                                         hintText: "DD/MM/YYYY",
//                                         isRead: true,
//                                         onTap: () async {
//                                           await provider
//                                               .selectDateOfBirth(context);
//                                         },
//                                         validator: (value) {
//                                           if (value == null || value.isEmpty) {
//                                             return "DOB is required";
//                                           } else {
//                                             return null;
//                                           }
//                                         },
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 UIHelper.horizontalSpace(20.w),

//                                 /// Age Section
//                                 Flexible(
//                                   flex: 1,
//                                   child: Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       /// Text: Age
//                                       Text(
//                                         "Age",
//                                         textAlign: TextAlign.start,
//                                         style: TextFontStyle
//                                             .headline16w400cF4F4F4StyleOpenSans
//                                             .copyWith(
//                                           fontFamily: 'SweetSansPro',
//                                         ),
//                                       ),
//                                       UIHelper.verticalSpace(8.h),

//                                       /// Form Field: Age
//                                       CustomFormField(
//                                         controller: provider.ageController,
//                                         hintText: "Auto",
//                                         isRead: true,
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             UIHelper.verticalSpace(24.h),

//                             /// Text: Select your gender
//                             Text(
//                               "Select your gender",
//                               textAlign: TextAlign.start,
//                               style: TextFontStyle
//                                   .headline16w400cF4F4F4StyleOpenSans
//                                   .copyWith(
//                                 fontFamily: 'SweetSansPro',
//                               ),
//                             ),
//                             UIHelper.verticalSpace(15.h),

//                             /// Gender Selection
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 /// Gender: Male
//                                 InkWell(
//                                   onTap: () =>
//                                       provider.selectGender("Male"), // Set Male
//                                   child: Container(
//                                     width: 136,
//                                     height: 112,
//                                     alignment: Alignment.center,
//                                     decoration: BoxDecoration(
//                                       color: provider.selectedGender == "Male"
//                                           ? AppColors.c181818
//                                           : AppColors.c020202,
//                                       borderRadius: BorderRadius.circular(10),
//                                     ),
//                                     child: Column(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.center,
//                                       children: [
//                                         SvgPicture.asset(
//                                           'assets/icons/male_icon.svg',
//                                           fit: BoxFit.cover,
//                                         ),
//                                         SizedBox(height: 5.h),
//                                         Text(
//                                           "Male",
//                                           style: TextFontStyle
//                                               .headline16w400cF4F4F4StyleOpenSans
//                                               .copyWith(
//                                             fontFamily: 'SweetSansPro',
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),

//                                 SizedBox(width: 16.w),

//                                 /// Gender: Female
//                                 InkWell(
//                                   onTap: () => provider
//                                       .selectGender("Female"), // Set Female
//                                   child: Container(
//                                     width: 136,
//                                     height: 112,
//                                     alignment: Alignment.center,
//                                     decoration: BoxDecoration(
//                                       color: provider.selectedGender == "Female"
//                                           ? AppColors.c181818
//                                           : AppColors.c020202,
//                                       borderRadius: BorderRadius.circular(10),
//                                     ),
//                                     child: Column(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.center,
//                                       children: [
//                                         SvgPicture.asset(
//                                           'assets/icons/female_icon.svg',
//                                           fit: BoxFit.cover,
//                                         ),
//                                         SizedBox(height: 5.h),
//                                         Text(
//                                           "Female",
//                                           style: TextFontStyle
//                                               .headline16w400cF4F4F4StyleOpenSans,
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             UIHelper.verticalSpace(24.h),

//                             Align(
//                               child: GestureDetector(
//                                 onTap: () async {
//                                   provider.selectGender("None");
//                                 },
//                                 child: Container(
//                                   width: 136,
//                                   height: 112,
//                                   alignment: Alignment.center,
//                                   decoration: BoxDecoration(
//                                     color: provider.selectedGender == "None"
//                                         ? AppColors.c181818
//                                         : AppColors.c020202,
//                                     borderRadius: BorderRadius.circular(10),
//                                   ),
//                                   child: Text(
//                                     "Prefer not to say",
//                                     textAlign: TextAlign.center,
//                                     style: TextFontStyle
//                                         .headline16w400cF4F4F4StyleOpenSans
//                                         .copyWith(
//                                       fontFamily: 'SweetSansPro',
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             UIHelper.verticalSpace(80.h),

//                             /// Continue Button
//                             CustomElevatedButton(
//                               height: 55.h,
//                               onTap: () {
//                                 if (_formKey.currentState!.validate()) {
//                                   if (provider.selectedGender == "") {
//                                     ToastUtil.showShortToast(
//                                         "Select your gender");
//                                   } else if (provider.passwordController.text !=
//                                       provider.confirmPasswordController.text) {
//                                     ToastUtil.showShortToast(
//                                         "Password and confirm password must be the same");
//                                   } else {
//                                     NavigationService.navigateTo(
//                                         Routes.onboardingScreenFour);
//                                   }
//                                 }
//                               },
//                               title: "CONTINUE",
//                               color: const Color(0xFFFFD700),
//                               textStyle: TextFontStyle
//                                   .headline18w400c1C1C1CStyleInter
//                                   .copyWith(
//                                       fontFamily: 'SweetSansPro',
//                                       fontWeight: FontWeight.w600),
//                             ),
//                             UIHelper.verticalSpace(30.h),
//                           ],
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

// class TextFieldLabelWidget extends StatelessWidget {
//   final String text;
//   const TextFieldLabelWidget({
//     required this.text,
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Text(
//       text,
//       textAlign: TextAlign.start,
//       style: TextFontStyle.headline16w400cF4F4F4StyleOpenSans.copyWith(
//         fontFamily: 'SweetSansPro',
//       ),
//     );
//   }
// }
