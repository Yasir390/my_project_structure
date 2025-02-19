// // ignore_for_file: prefer_typing_uninitialized_variables, avoid_print

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:provider/provider.dart';
// import 'package:training_app/common_widgets/custom_button.dart';
// import 'package:training_app/common_widgets/custom_text_field.dart';
// import 'package:training_app/constants/text_font_style.dart';
// import 'package:training_app/gen/colors.gen.dart';
// import 'package:training_app/helpers/navigation_service.dart';
// import 'package:training_app/helpers/toast.dart';
// import 'package:training_app/helpers/ui_helpers.dart';
// import 'package:training_app/networks/api_access.dart';

// class EditProfileScreen extends StatefulWidget {
//   final snap;
//   const EditProfileScreen({super.key, required this.snap});

//   @override
//   State<EditProfileScreen> createState() => _EditProfileScreenState();
// }

// class _EditProfileScreenState extends State<EditProfileScreen> {
//   final _nameController = TextEditingController();
//   final _preferredFootController = TextEditingController();
//   final _favClubController = TextEditingController();
//   final _actualClubController = TextEditingController();
//   final _favPositionController = TextEditingController();
//   final _favPlayerController = TextEditingController();
//   final _formKey = GlobalKey<FormState>();
//   var signupScreenProvider;
//   @override
//   void initState() {
//     super.initState();
//     signupScreenProvider =
//         Provider.of<SignupScreenProvider>(context, listen: false);
//     _nameController.text = widget.snap!.name;
//     _preferredFootController.text = widget.snap!.preferredFoot;
//     _favClubController.text = widget.snap!.favouriteClub;
//     _actualClubController.text = widget.snap!.club;
//     _favPositionController.text = widget.snap!.position;
//     _favPlayerController.text = widget.snap!.favouritePlayer;
//     signupScreenProvider.selectedDateController.text = widget.snap!.dateOfBirth;
//   }

//   @override
//   void dispose() {
//     _nameController.dispose();
//     _preferredFootController.dispose();
//     _favClubController.dispose();
//     _actualClubController.dispose();
//     _favPositionController.dispose();
//     _favPlayerController.dispose();

//     super.dispose();
//   }

// //..........profile data update method
//   Future<void> profileDataUpdate() async {
//     try {
//       if (_formKey.currentState!.validate()) {
//         setState(() {
//           _isLoading = true;
//         });
//         // XFile avatar = _selectedProfileImage!;
//         bool result = await postUpdateProfileRxObj.postUpdateProfileRx(
//           name: _nameController.text,
//           dateOfBirth: signupScreenProvider.selectedDateController.text,
//           position: _favPositionController.text,
//           preferredFoot: _preferredFootController.text,
//           favouritePlayer: _favPlayerController.text,
//           favouriteClub: _favClubController.text,
//           club: _actualClubController.text,
//         );

//         if (result) {
//           await getOwnProfileRxObj.getOwnProfileRx();
//           setState(() {
//             _isLoading = false;
//           });
//           // ToastUtil.showShortToast("Profile updated successfully.");
//           // NavigationService.goBack;
//           // getOwnProfileRxObj.getOwnProfileRx();
//         } else {
//           setState(() {
//             _isLoading = false;
//           });
//           ToastUtil.showShortToast("Failed to update profile.");
//         }
//       }
//     } catch (e) {
//       setState(() {
//         _isLoading = false;
//       });
//       // Log the error if needed or show a generic error message
//       print("Error updating profile picture: $e");
//       ToastUtil.showShortToast("An error occurred while updating the profile.");
//     }
//   }

//   bool _isLoading = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.c020202,
//       // appBar: AppBar(
//       //   backgroundColor: AppColors.c020202,
//       // ),
//       body: Stack(
//         children: [
//           SafeArea(
//             child: SingleChildScrollView(
//               physics: const BouncingScrollPhysics(),
//               padding: EdgeInsets.symmetric(horizontal: 20.w),
//               child: Form(
//                 key: _formKey,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     UIHelper.verticalSpace(25.h),
//                     GestureDetector(
//                       onTap: () {
//                         NavigationService.goBack;
//                       },
//                       child: const Icon(
//                         Icons.arrow_back,
//                         color: Colors.white,
//                       ),
//                     ),
//                     UIHelper.verticalSpace(20.h),
//                     //<<------------- enter name ------------>>
//                     const EditProfileTextFieldTitleWidget(
//                       text: 'Enter name',
//                     ),
//                     UIHelper.verticalSpace(5.h),
//                     CustomTextField(
//                       controller: _nameController,
//                       fillColor: AppColors.cA2A2A2.withOpacity(0.2),
//                       hintText: "Enter your name",
//                       style: TextFontStyle.headlinew700cffffffStyleOpenSans
//                           .copyWith(fontSize: 18.sp),
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return "Name is required";
//                         } else {
//                           return null;
//                         }
//                       },
//                     ),
//                     UIHelper.verticalSpace(10.h),
//                     //<<------------- Preferred Foot------------>>
//                     const EditProfileTextFieldTitleWidget(
//                       text: 'Preferred Foot',
//                     ),
//                     UIHelper.verticalSpace(5.h),
//                     CustomTextField(
//                       controller: _preferredFootController,
//                       fillColor: AppColors.cA2A2A2.withOpacity(0.2),
//                       hintText: "Enter preferred foot",
//                       style: TextFontStyle.headlinew700cffffffStyleOpenSans
//                           .copyWith(fontSize: 18.sp),
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return "Preferred Foot is required";
//                         } else {
//                           return null;
//                         }
//                       },
//                     ),
//                     UIHelper.verticalSpace(10.h),

//                     //<<------------- Favourite Club------------>>
//                     const EditProfileTextFieldTitleWidget(
//                       text: 'Favourite Club',
//                     ),
//                     UIHelper.verticalSpace(5.h),
//                     CustomTextField(
//                       controller: _favClubController,
//                       fillColor: AppColors.cA2A2A2.withOpacity(0.2),
//                       hintText: "Enter favourite club",
//                       style: TextFontStyle.headlinew700cffffffStyleOpenSans
//                           .copyWith(fontSize: 18.sp),
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return "Favourite Club is required";
//                         } else {
//                           return null;
//                         }
//                       },
//                     ),
//                     UIHelper.verticalSpace(10.h),

//                     //<<------------- Actual Club------------>>
//                     const EditProfileTextFieldTitleWidget(
//                       text: 'Actual Club',
//                     ),
//                     UIHelper.verticalSpace(5.h),
//                     CustomTextField(
//                       controller: _actualClubController,
//                       fillColor: AppColors.cA2A2A2.withOpacity(0.2),
//                       hintText: "Enter actual club",
//                       style: TextFontStyle.headlinew700cffffffStyleOpenSans
//                           .copyWith(fontSize: 18.sp),
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return "Actual Club is required";
//                         } else {
//                           return null;
//                         }
//                       },
//                     ),

//                     UIHelper.verticalSpace(10.h),

//                     //<<------------- Favourite Position Club------------>>
//                     const EditProfileTextFieldTitleWidget(
//                       text: 'Favourite Position ',
//                     ),
//                     UIHelper.verticalSpace(5.h),
//                     CustomTextField(
//                       controller: _favPositionController,
//                       fillColor: AppColors.cA2A2A2.withOpacity(0.2),
//                       hintText: "Enter favourite position ",
//                       style: TextFontStyle.headlinew700cffffffStyleOpenSans
//                           .copyWith(fontSize: 18.sp),
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return "Favourite Position is required";
//                         } else {
//                           return null;
//                         }
//                       },
//                     ),

//                     UIHelper.verticalSpace(10.h),

//                     //<<------------- Favourite Player Club------------>>
//                     const EditProfileTextFieldTitleWidget(
//                       text: 'Favourite Player',
//                     ),
//                     UIHelper.verticalSpace(5.h),
//                     CustomTextField(
//                       controller: _favPlayerController,
//                       fillColor: AppColors.cA2A2A2.withOpacity(0.2),
//                       hintText: "Enter favourite player",
//                       style: TextFontStyle.headlinew700cffffffStyleOpenSans
//                           .copyWith(fontSize: 18.sp),
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return "Favourite Player name is required";
//                         } else {
//                           return null;
//                         }
//                       },
//                     ),

//                     UIHelper.verticalSpace(10.h),

//                     //<<------------- Date of Birth ------------>>
//                     const EditProfileTextFieldTitleWidget(
//                       text: 'Date of Birth',
//                     ),
//                     UIHelper.verticalSpace(5.h),
//                     CustomTextField(
//                       controller: signupScreenProvider.selectedDateController,
//                       fillColor: AppColors.cA2A2A2.withOpacity(0.2),
//                       hintText: "DD/MM/YYYY",
//                       isRead: true,
//                       // isRead: true,
//                       style: TextFontStyle.headlinew700cffffffStyleOpenSans
//                           .copyWith(fontSize: 18.sp),
//                       onTap: () async {
//                         await signupScreenProvider.selectDateOfBirth(context);
//                       },
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return "DOB is required";
//                         } else {
//                           return null;
//                         }
//                       },
//                     ),

//                     UIHelper.verticalSpace(20.h),
//                     Align(
//                       alignment: Alignment.center,
//                       child: customeButton(
//                           name: "Update",
//                           onCallBack: () {
//                             profileDataUpdate();
//                           },
//                           height: 54.h,
//                           minWidth: 310.w,
//                           borderRadius: 0,
//                           color: AppColors.cfede1c,
//                           textStyle: TextFontStyle
//                               .headline24w600c000000StyleOpenSans
//                               .copyWith(
//                             fontSize: 18.sp,
//                             fontFamily: 'SweetSansPro',
//                           ),
//                           context: context),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           if (_isLoading)
//             const SpinKitCircle(
//               color: Colors.yellow,
//               size: 50.0,
//             ),
//         ],
//       ),
//     );
//   }
// }

// class EditProfileTextFieldTitleWidget extends StatelessWidget {
//   final String text;
//   const EditProfileTextFieldTitleWidget({
//     super.key,
//     required this.text,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Text(
//       text,
//       style: TextFontStyle.headline16w400cF4F4F4StyleOpenSans.copyWith(
//         fontFamily: 'SweetSansPro',
//       ),
//     );
//   }
// }
