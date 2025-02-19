// // ignore_for_file: prefer_typing_uninitialized_variables, prefer_const_constructors, unused_element

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:provider/provider.dart';
// import 'package:training_app/common_widgets/custom_elevated_button.dart';
// import 'package:training_app/common_widgets/custom_text_form_field.dart';
// import 'package:training_app/constants/app_list.dart';
// import 'package:training_app/constants/text_font_style.dart';
// import 'package:training_app/features/auth/presentation/sign_up/widgets/select_prefer_foot.dart';
// import 'package:training_app/features/auth/presentation/sign_up/widgets/signup_screen_appbar.dart';
// import 'package:training_app/gen/colors.gen.dart';
// import 'package:training_app/helpers/all_routes.dart';
// import 'package:training_app/helpers/navigation_service.dart';
// import 'package:training_app/helpers/toast.dart';
// import 'package:training_app/helpers/ui_helpers.dart';
// import 'package:training_app/networks/api_access.dart';
// import 'package:training_app/providers/onboarding_screen_four_provider.dart';
// import 'package:training_app/providers/onboarding_screen_three_provider.dart';

// class SignUpScreen2 extends StatefulWidget {
//   const SignUpScreen2({super.key});

//   @override
//   State<SignUpScreen2> createState() => _SignUpScreen2State();
// }

// class _SignUpScreen2State extends State<SignUpScreen2> {
//   final _formKey = GlobalKey<FormState>();
//   late final signupScreenProvider;
//   late final signupScreenProvider2;
//   @override
//   void initState() {
//     super.initState();
//     signupScreenProvider =
//         Provider.of<SignupScreenProvider>(context, listen: false);
//     signupScreenProvider2 =
//         Provider.of<SignupScreenProvider2>(context, listen: false);
//   }

//   Future<void> signupMethod() async {
//     if (_formKey.currentState!.validate()) {
//       setState(() {
//         _isLoading = true;
//       });
//       signUpRxObj
//           .signUpRx(
//         name: signupScreenProvider.nameController.text,
//         email: signupScreenProvider.emailController.text,
//         dateOfBirth: signupScreenProvider.selectedDateController.text,
//         gender: signupScreenProvider.selectedGender,
//         clubName: signupScreenProvider2.clubNameController.text,
//         positionName: signupScreenProvider2.positionNameController.text,
//         preferredFoot: signupScreenProvider2.selectedFoot,
//         favoriteClubName: signupScreenProvider2.favoriteClubNameController.text,
//         favoritePlayerName:
//             signupScreenProvider2.favoritePlayerNameController.text,
//         password: signupScreenProvider.passwordController.text,
//         confirmPassword: signupScreenProvider.confirmPasswordController.text,
//       )
//           .then(
//         (value) {
//           if (value) {
//             setState(() {
//               _isLoading = false;
//             });
//             NavigationService.navigateToUntilReplacement(
//                 Routes.bottomNavigation);
//           } else {
//             setState(() {
//               _isLoading = false;
//             });
//             ToastUtil.showShortToast("Failed to sign up");
//           }
//         },
//       );
//     }
//   }

//   bool _isLoading = false;
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<SignupScreenProvider2>(
//       builder: (context, provider, child) {
//         return Scaffold(
//           backgroundColor: AppColors.c020202,
//           body: SafeArea(
//             child: Form(
//               key: _formKey,
//               child: Stack(
//                 children: [
//                   if (_isLoading)
//                     SpinKitCircle(
//                       color: Colors.yellow,
//                       size: 50.0,
//                     ),
//                   SingleChildScrollView(
//                     child: Column(
//                       children: [
//                         ///AppBar
//                         ///  /// AppBar
//                         const SignupScreenAppBar(
//                           progressLineValue: 1.0,
//                         ),

//                         UIHelper.verticalSpace(20.h),

//                         Align(
//                           alignment: Alignment.centerLeft,
//                           child: Padding(
//                             padding: EdgeInsets.symmetric(horizontal: 40.w),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 ///Text : Hello....
//                                 Text(
//                                   "Hello!\nTell us about you..",
//                                   textAlign: TextAlign.start,
//                                   style: TextFontStyle
//                                       .headline21w400cF4F4F4StyleOpenSans
//                                       .copyWith(
//                                     fontFamily: 'SweetSansPro',
//                                   ),
//                                 ),
//                                 UIHelper.verticalSpace(30.h),

//                                 ///Text :First Name
//                                 Text(
//                                   "Club",
//                                   textAlign: TextAlign.start,
//                                   style: TextFontStyle
//                                       .headline16w400cF4F4F4StyleOpenSans
//                                       .copyWith(
//                                     fontFamily: 'SweetSansPro',
//                                   ),
//                                 ),
//                                 UIHelper.verticalSpace(10.h),

//                                 ///Form Field : Club Name
//                                 CustomFormField(
//                                   controller: provider.clubNameController,
//                                   hintText: "Club Name",
//                                   validator: (value) {
//                                     if (value == null || value.isEmpty) {
//                                       return "Enter club name";
//                                     } else {
//                                       return null;
//                                     }
//                                   },
//                                 ),
//                                 UIHelper.verticalSpace(24.h),

//                                 ///Text :First Name
//                                 Text(
//                                   "Position",
//                                   textAlign: TextAlign.start,
//                                   style: TextFontStyle
//                                       .headline16w400cF4F4F4StyleOpenSans
//                                       .copyWith(
//                                     fontFamily: 'SweetSansPro',
//                                   ),
//                                 ),
//                                 UIHelper.verticalSpace(10.h),

//                                 ///Form Field : Last Name
//                                 CustomFormField(
//                                   controller: provider.positionNameController,
//                                   hintText: "Position ",

//                                   validator: (value) {
//                                     if (value == null || value.isEmpty) {
//                                       return "Enter position name";
//                                     } else {
//                                       return null;
//                                     }
//                                   },
//                                   // onTap: () {
//                                   //   _showPositionDropdown(context, provider);
//                                   // },
//                                 ),
//                                 UIHelper.verticalSpace(24.h),

//                                 ///Text : Prefer Foot
//                                 Text(
//                                   "Preferred Foot",
//                                   style: TextFontStyle
//                                       .headline16w500c000000StyleInter
//                                       .copyWith(
//                                     fontFamily: 'SweetSansPro',
//                                   ),
//                                 ),
//                                 UIHelper.verticalSpace(10.h),

//                                 ///Select Prefer Foot
//                                 const SelectPreferFoot(),
//                                 UIHelper.verticalSpace(24.h),

//                                 ///Text : Favorite Club
//                                 Text(
//                                   "Favorite Club",
//                                   textAlign: TextAlign.start,
//                                   style: TextFontStyle
//                                       .headline16w400cF4F4F4StyleOpenSans
//                                       .copyWith(
//                                     fontFamily: 'SweetSansPro',
//                                   ),
//                                 ),
//                                 UIHelper.verticalSpace(10.h),

//                                 ///Form Field : Last Name
//                                 CustomFormField(
//                                   controller:
//                                       provider.favoriteClubNameController,
//                                   hintText: "Favorite club name",
//                                   validator: (value) {
//                                     if (value == null || value.isEmpty) {
//                                       return "Enter favorite club name";
//                                     } else {
//                                       return null;
//                                     }
//                                   },
//                                 ),
//                                 UIHelper.verticalSpace(24.h),

//                                 ///Text : Favorite Club
//                                 Text(
//                                   "Favorite Player",
//                                   textAlign: TextAlign.start,
//                                   style: TextFontStyle
//                                       .headline16w400cF4F4F4StyleOpenSans
//                                       .copyWith(
//                                     fontFamily: 'SweetSansPro',
//                                   ),
//                                 ),
//                                 UIHelper.verticalSpace(10.h),

//                                 ///Form Field : Last Name
//                                 CustomFormField(
//                                   controller:
//                                       provider.favoritePlayerNameController,
//                                   hintText: "Favorite player name",
//                                   validator: (value) {
//                                     if (value == null || value.isEmpty) {
//                                       return "Enter favorite player name";
//                                     } else {
//                                       return null;
//                                     }
//                                   },
//                                 ),
//                                 UIHelper.verticalSpace(80.h),

//                                 ///Navigate To Plan Screen
//                                 CustomElevatedButton(
//                                   height: 55.h,
//                                   onTap: () {
//                                     signupMethod();
//                                     // if (_formKey.currentState!.validate()) {
//                                     //   NavigationService.navigateTo(
//                                     //       Routes.bottomNavigation);
//                                     // }
//                                   },
//                                   title: "CONTINUE",
//                                   color: AppColors.cfede1c,
//                                   textStyle: TextFontStyle
//                                       .headline18w400c1C1C1CStyleInter
//                                       .copyWith(
//                                           fontFamily: 'SweetSansPro',
//                                           fontWeight: FontWeight.w600),
//                                 ),
//                                 UIHelper.verticalSpace(30.h),
//                               ],
//                             ),
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }

//   ////Position Drop Down

//   void _showPositionDropdown(
//     BuildContext context,
//     SignupScreenProvider2 provider,
//   ) {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           backgroundColor: AppColors.c181818,
//           content: SizedBox(
//             width: 1.sw,
//             height: 0.7.sh,
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 const Text(
//                   'Select Position',
//                   style: TextStyle(
//                     color: Colors.yellow,
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 // Expanded(
//                 //   child: ListView.builder(
//                 //     padding: EdgeInsets.zero,
//                 //     shrinkWrap: true,
//                 //     itemCount: AppList.positionList.length,
//                 //     itemBuilder: (context, index) {
//                 //       final item = AppList.positionList[index];
//                 //       return ListTile(
//                 //         title: Text(
//                 //           item,
//                 //           style: TextStyle(
//                 //             color: provider.selectedPosition == item
//                 //                 ? Colors.yellow
//                 //                 : Colors.white,
//                 //           ),
//                 //         ),
//                 //         onTap: () {
//                 //           provider.selectedPosition = item;
//                 //           provider.positionNameController.text =
//                 //               provider.selectedPosition;
//                 //           Navigator.pop(context);
//                 //         },
//                 //       );
//                 //     },
//                 //   ),
//                 // ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
