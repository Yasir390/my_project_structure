// ignore_for_file: constant_identifier_names, non_constant_identifier_names

const String url = "https://iunctura.softvencefsd.xyz";
const String imageUrl = "$url/";

//implementation 'com.facebook.android:facebook-android-sdk:[4,5)'

final class NetworkConstants {
  NetworkConstants._();
  static const ACCEPT = "Accept";
  static const APP_KEY = "App-Key";
  static const ACCEPT_LANGUAGE = "Accept-Language";
  static const ACCEPT_LANGUAGE_VALUE = "pt";
  static const APP_KEY_VALUE = String.fromEnvironment("APP_KEY_VALUE");
  static const ACCEPT_TYPE = "application/json";
  static const AUTHORIZATION = "Authorization";
  static const CONTENT_TYPE = "content-Type";
}

final class PaymentGateway {
  PaymentGateway._();
  static String gateway(String orderId) =>
      "https://demo.vivapayments.com/web/checkout?ref={$orderId}";
}

final class Endpoints {
  Endpoints._();

//in use

//signup
  static String signUpEndpoint() => "/api/register";

//login
  static String loginEndPoint() => "/api/login";

//logout
  static String logoutEndPoint() => "/api/logout";

  //send otp
  static String sendOTPEndPoint() => "/api/auth/forgot-password";

  //send otp
  static String verifyOTPEndPoint() => "/api/auth/verify-otp";

  // profile
  static String ownProfileEndPoint() => "/api/view-profile";

  // resetPassword
  static String resetPasswordEndPoint() => "/api/auth/reset-password";

  // get challenge response
  static String getChallengeResponseEndPoint() => "/api/get-task";
  static String postChallengeDataEndPoint() => "/api/challenge-point/create";

  // profile Update EndPoint
  static String profileUpdateEndPoint() => "/api/profile-update";

  // home data api EndPoint
  static String homeDataApiEndPoint() => "/api/get-cms";

  // leader board api EndPoint
  static String leaderBoardApiEndPoint({required int id}) =>
      "/api/leaderboard?id=$id";
}
