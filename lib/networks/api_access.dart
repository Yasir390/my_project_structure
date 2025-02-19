import 'package:rxdart/subjects.dart';
import 'package:training_app/features/auth/data/rx_login/rx.dart';
import 'package:training_app/features/auth/data/rx_post_logout/rx_post_logout/rx.dart';
import 'package:training_app/features/auth/data/rx_post_reset_password/rx.dart';
import 'package:training_app/features/auth/data/rx_post_send_otp/rx.dart';
import 'package:training_app/features/auth/data/rx_post_signup/rx.dart';
import 'package:training_app/features/auth/data/rx_post_verify_otp/rx.dart';
import 'package:training_app/features/auth/model/login_response_model.dart';
import 'package:training_app/features/auth/model/signup_response_model.dart';

import 'package:training_app/features/profile/data/rx_get_own_profile/rx.dart';
import 'package:training_app/features/profile/data/rx_post_profile_pic_update/rx.dart';
import 'package:training_app/features/profile/data/rx_post_update_profile_data/rx.dart';
import 'package:training_app/features/profile/model/profile_model.dart';

// signup
SignUpRx signUpRxObj = SignUpRx(
    empty: SignUpResponseModel(),
    dataFetcher: BehaviorSubject<SignUpResponseModel>());
//login
GetLoginRX getLoginRxObj = GetLoginRX(
    empty: LoginResponseModel(),
    dataFetcher: BehaviorSubject<LoginResponseModel>());

//logout
LogoutRx logOutRxObj = LogoutRx(empty: {}, dataFetcher: BehaviorSubject<Map>());

//send otp

PostSendOTPRx postSendOTPRxObj =
    PostSendOTPRx(empty: {}, dataFetcher: BehaviorSubject<Map>());

//verify otp
PostVerifyOTPRx postVerifyOTPRxObj =
    PostVerifyOTPRx(empty: {}, dataFetcher: BehaviorSubject<Map>());

//profile pic update
PostProfilePicUpdateRx postProfilePicUpdateRxObj =
    PostProfilePicUpdateRx(empty: {}, dataFetcher: BehaviorSubject<Map>());

//profile data update
PostUpdateProfileRx postUpdateProfileRxObj =
    PostUpdateProfileRx(empty: {}, dataFetcher: BehaviorSubject<Map>());

// //change password
// PostChangePasswordRx postChangePasswordRxObj =
//     PostChangePasswordRx(empty: {}, dataFetcher: BehaviorSubject<Map>());

//Reset password
PostResetPasswordRx postResetPasswordRxObj =
    PostResetPasswordRx(empty: {}, dataFetcher: BehaviorSubject<Map>());

//profile
GetOwnProfileRx getOwnProfileRxObj = GetOwnProfileRx(
    empty: ProfileModel(), dataFetcher: BehaviorSubject<ProfileModel>());

// //get challenge response
// GetChallengeResponseRx getChallengeResponseRxObj = GetChallengeResponseRx(
//     empty: ChallengeResponseModel(),
//     dataFetcher: BehaviorSubject<ChallengeResponseModel>());

// //home page data
// GetHomeDataRx getHomeDataRxObj = GetHomeDataRx(
//     empty: HomeDataResponseModel(),
//     dataFetcher: BehaviorSubject<HomeDataResponseModel>());

// //home page data
// GetLeaderBoardRx getLeaderBoardRxObj = GetLeaderBoardRx(
//     empty: LeaderBoardUserModel(),
//     dataFetcher: BehaviorSubject<LeaderBoardUserModel>());

// //verify otp
// PostChallengeDataRx postChallengeDataRxObj =
//     PostChallengeDataRx(empty: {}, dataFetcher: BehaviorSubject<Map>());
