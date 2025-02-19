import 'dart:developer';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shimmer/shimmer.dart';
import 'package:training_app/constants/text_font_style.dart';
import 'package:training_app/features/profile/model/profile_model.dart';
import 'package:training_app/features/profile/widget/custom_row_widget.dart';
import 'package:training_app/gen/assets.gen.dart';
import 'package:training_app/gen/colors.gen.dart';
import 'package:training_app/helpers/all_routes.dart';
import 'package:training_app/helpers/navigation_service.dart';
import 'package:training_app/helpers/toast.dart';
import 'package:training_app/helpers/ui_helpers.dart';
import 'package:training_app/networks/api_access.dart';
import 'package:training_app/networks/endpoints.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();

    apiCall();
  }

  apiCall() async {
    await getOwnProfileRxObj.getOwnProfileRx();
    // await getSavedMusicRxObj.getSavedMusicRx();
  }

  final ImagePicker _picker = ImagePicker();

  XFile? _selectedProfileImage;

  //......... profile image picker
  Future<void> _pickProfileImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _selectedProfileImage = pickedFile;
      });
      profilePicUpdate();
    }
  }

  //..........profile pic update api
  Future<void> profilePicUpdate() async {
    try {
      if (_selectedProfileImage != null) {
        XFile avatar = _selectedProfileImage!;
        bool result = await postProfilePicUpdateRxObj.postProfilePicUpdateRx(
          avatar: avatar,
        );

        if (result) {
          ToastUtil.showShortToast("Profile updated successfully.");
          getOwnProfileRxObj.getOwnProfileRx();
        } else {
          ToastUtil.showShortToast("Failed to update profile.");
        }
      } else {
        ToastUtil.showShortToast("No profile image selected.");
      }
    } catch (e) {
      // Log the error if needed or show a generic error message
      log("Error updating profile picture: $e");
      ToastUtil.showShortToast("An error occurred while updating the profile.");
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(Assets.images.profileScreenBg2.path),
                fit: BoxFit.fill)),
        child: StreamBuilder<ProfileModel>(
            stream: getOwnProfileRxObj.dataFetcher,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    UIHelper.verticalSpace(height * 0.48),
                    const Center(
                      child: SpinKitCircle(
                        color: Colors.yellow,
                        size: 50.0,
                      ),
                    ),
                  ],
                );
              }
              if (snapshot.hasError) {
                return Center(
                  child: Text(
                    'Error: No data',
                    style: TextFontStyle.text10cffffffw600OpenSans,
                  ),
                );
              }
              if (snapshot.hasData) {
                final profileSnap = snapshot.data!;
                return Column(
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.only(left: 20.w, right: 20.w, top: 65.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              NavigationService.goBack;
                            },
                            child: const Icon(
                              Icons.close,
                              color: AppColors.cffffff,
                              size: 28,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              NavigationService.navigateToWithArgs(
                                  Routes.editProfile, {
                                "snap": profileSnap,
                              });
                            },
                            child: const Icon(
                              Icons.edit_outlined,
                              color: AppColors.cffffff,
                              size: 25,
                            ),
                          )
                        ],
                      ),
                    ),
                    UIHelper.verticalSpace(58.h),
                    //<<.......... profile picture.............

                    Stack(
                      children: [
                        ClipOval(
                          child: Container(
                              color: AppColors.cffffff,
                              height: 122.h,
                              width: 122.h,
                              child: _selectedProfileImage != null
                                  ? Image.file(
                                      File(_selectedProfileImage!.path),
                                      fit: BoxFit.cover,
                                      width: size.width,
                                    )
                                  : profileSnap.avatar != ""
                                      ? CachedNetworkImage(
                                          width: 122.h,
                                          height: 122.h,
                                          imageUrl:
                                              imageUrl + profileSnap.avatar!,

                                          placeholder: (context, url) =>
                                              Shimmer.fromColors(
                                            baseColor: Colors.grey[300]!,
                                            highlightColor: Colors.grey[100]!,
                                            direction: ShimmerDirection
                                                .ltr, // Left-to-right shimmer direction
                                            child: Container(
                                              height: 90,
                                              width: 100,
                                              color: Colors
                                                  .white, // Placeholder color
                                            ),
                                          ),
                                          errorWidget: (context, url, error) =>
                                              Icon(
                                            Icons.person, size: 70.sp,
                                            // Optional: Customize error icon color
                                          ),
                                          fadeInDuration: const Duration(
                                              milliseconds:
                                                  500), // Optional: animation duration
                                          fit: BoxFit
                                              .cover, // Optional: controls how the image should be fitted in its space
                                        )
                                      : Image.asset(
                                          Assets.icons.personPlaceholder.path,
                                          width: 122.h,
                                          height: 122.h,
                                        )),
                        ),
                        Positioned(
                            right: -3.w,
                            bottom: 0.h,
                            child: IconButton(
                                highlightColor: Colors.transparent,
                                onPressed: () {
                                  _pickProfileImage();
                                },
                                icon: SvgPicture.asset(
                                  Assets.icons.editLine1,
                                  height: 30,
                                  width: 30,
                                ))),
                      ],
                    ),

                    UIHelper.verticalSpace(18.h),

                    Text(
                      profileSnap.name ?? " ",
                      style: TextFontStyle.headline18w600cFEDE1CStyleOpenSans
                          .copyWith(
                        fontSize: 40.sp,
                        fontFamily: 'SweetSansPro',
                      ),
                    ),
                    UIHelper.verticalSpace(15.h),
                    Text(profileSnap.email ?? " ",
                        style: TextFontStyle.headline16w400c898989StyleInter),
                    Text("Age: ${profileSnap.age ?? 0.toString()}",
                        style: TextFontStyle.headline16w400c898989StyleInter
                            .copyWith(
                          fontFamily: 'SweetSansPro',
                        )),
                    UIHelper.verticalSpace(24.h),
                    Padding(
                      padding: EdgeInsets.only(left: 52.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Member Since".toUpperCase(),
                                  style: TextFontStyle
                                      .headline16w400c898989StyleInter
                                      .copyWith(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'SweetSansPro',
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  profileSnap.createdAt ?? " ",
                                  style: TextFontStyle.text20cffffffw600OpenSans
                                      .copyWith(fontSize: 16.sp),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Streak".toUpperCase(),
                                  style: TextFontStyle
                                      .headline16w400c898989StyleInter
                                      .copyWith(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'SweetSansPro',
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  "Coming Soon!",
                                  style: TextFontStyle.text20cffffffw600OpenSans
                                      .copyWith(
                                          fontSize: 16.sp,
                                          color: const Color(0xFFFEDE1C)),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    UIHelper.verticalSpace(24.h),
                    Divider(
                      color: AppColors.c3D3D3D,
                      thickness: 1.h,
                    ),
                    UIHelper.verticalSpace(24.h),
                    CustomRowWidget(
                      title: 'Date of Birth',
                      subtitle: profileSnap.dateOfBirth ?? " ",
                      title1: 'Preferred Foot',
                      subtitle1: profileSnap.preferredFoot ?? " ",
                    ),
                    UIHelper.verticalSpace(32.h),
                    CustomRowWidget(
                      title: 'Favourite Club',
                      subtitle: profileSnap.favouriteClub ?? " ",
                      title1: 'Actual Club',
                      subtitle1: profileSnap.club ?? " ",
                    ),
                    UIHelper.verticalSpace(32.h),
                    CustomRowWidget(
                      title: 'Favourite Position',
                      subtitle: profileSnap.position ?? " ",
                      title1: 'Favourite Player',
                      subtitle1: profileSnap.favouritePlayer ?? " ",
                    ),
                    UIHelper.verticalSpace(34.h),
                    Divider(
                      color: AppColors.c3D3D3D,
                      thickness: 1.h,
                    ),
                  ],
                );
              } else {
                return Center(
                  child: Text(
                    'Error: No data',
                    style: TextFontStyle.text10cffffffw600OpenSans,
                  ),
                );
              }
            }),
      ),
    );
  }
}
