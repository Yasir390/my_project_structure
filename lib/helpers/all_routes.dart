// ignore_for_file: unreachable_switch_case

import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:training_app/features/auth/presentation/forget_pass/forget_password_screen.dart';
import 'package:training_app/features/auth/presentation/login/login_screen.dart';
import 'package:training_app/features/auth/presentation/otp/otp_screen.dart';
import 'package:training_app/features/auth/presentation/reset_password_screen/reset_password_screen.dart';
import 'package:training_app/features/auth/presentation/sign_up/sign_up_onboarding_screen.dart';
import 'package:training_app/features/profile/presentation/edit_profile_screen.dart';

import 'package:training_app/features/profile/presentation/profile_screen.dart';

import 'package:training_app/features/auth/presentation/sign_up/signup_screen2.dart';
import 'package:training_app/features/auth/presentation/sign_up/signup_screen.dart';

final class Routes {
  static final Routes _routes = Routes._internal();
  Routes._internal();
  static Routes get instance => _routes;

  static const String signIsScreen = '/signIsScreen';
  static const String signUpScreen = '/signUpScreen';
  static const String onboardingScreenThree = '/onboardingScreenThree';
  static const String onboardingScreenFour = '/onboardingScreenFour';
  static const String bottomNavigation = '/bottomNavigation';
  static const String planScreen = '/planScreen';
  static const String challengeDetails = '/challengeDetails';
  static const String leaderBoard = '/leaderBoard';
  static const String videoPlayer = '/videoPlayer';
  static const String profile = '/profile';
  static const String editProfile = '/editProfile';
  static const String guideBook = '/guideBook';
  static const String guideBookToNextScreen = '/guideBookToNextScreen';
  static const String finishSession = '/finishSession';
  static const String submitVideo = '/submitVideo';

  static const String homeScreen = '/homeScreen';

  static const String onboardingScreen1 = '/onboardingScreen1';
  static const String forgetPasswordScreen = '/forgetPasswordScreen';
  static const String otpVerifyScreen = '/otpVerifyScreen';
  static const String resetPasswordScreen = '/resetPasswordScreen';

  static const String changePasswordScreen = '/changePasswordScreen';
}

final class RouteGenerator {
  static final RouteGenerator _routeGenerator = RouteGenerator._internal();
  RouteGenerator._internal();
  static RouteGenerator get instance => _routeGenerator;

  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case Routes.submitVideo:
      //   return Platform.isAndroid
      //       ? _FadedTransitionRoute(
      //           widget: const ScreenTitle(widget: SubmitVideoScreen()),
      //           settings: settings)
      //       : CupertinoPageRoute(
      //           builder: (context) => const SubmitVideoScreen());
      case Routes.signIsScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const ScreenTitle(widget: LoginScreen()),
                settings: settings)
            : CupertinoPageRoute(builder: (context) => const LoginScreen());
      case Routes.signUpScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const ScreenTitle(widget: SignUpOnboardingScreen()),
                settings: settings)
            : CupertinoPageRoute(
                builder: (context) => const SignUpOnboardingScreen());


      // case Routes.bottomNavigation:
      //   return Platform.isAndroid
      //       ? _FadedTransitionRoute(
      //           widget: const ScreenTitle(widget: BottomNavigationScreen()),
      //           settings: settings)
      //       : CupertinoPageRoute(
      //           builder: (context) => const BottomNavigationScreen());

      // case Routes.planScreen:
      //   return Platform.isAndroid
      //       ? _FadedTransitionRoute(
      //           widget: const ScreenTitle(widget: PlanScreen()),
      //           settings: settings)
      //       : CupertinoPageRoute(builder: (context) => const PlanScreen());

      case Routes.otpVerifyScreen:
        Map args = settings.arguments as Map;
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: ScreenTitle(
                    widget: OtpVerifyScreen(
                  email: args['email'],
                )),
                settings: settings)
            : CupertinoPageRoute(
                builder: (context) => OtpVerifyScreen(
                      email: args['email'],
                    ));

      case Routes.resetPasswordScreen:
        Map args = settings.arguments as Map;
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: ScreenTitle(
                    widget: ResetPasswordScreen(
                  email: args['email'],
                )),
                settings: settings)
            : CupertinoPageRoute(
                builder: (context) => ResetPasswordScreen(
                      email: args['email'],
                    ));

      case Routes.forgetPasswordScreen:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const ScreenTitle(widget: ForgetPasswordScreen()),
                settings: settings)
            : CupertinoPageRoute(
                builder: (context) => const ForgetPasswordScreen());

      // case Routes.challengeDetails:
      //   return Platform.isAndroid
      //       ? _FadedTransitionRoute(
      //           widget: const ScreenTitle(widget: ChallengeDetailsScreen()),
      //           settings: settings)
      //       : CupertinoPageRoute(
      //           builder: (context) => const ChallengeDetailsScreen());

  

      case Routes.profile:
        return Platform.isAndroid
            ? _FadedTransitionRoute(
                widget: const ScreenTitle(widget: ProfileScreen()),
                settings: settings)
            : CupertinoPageRoute(builder: (context) => const ProfileScreen());

      // case Routes.editProfile:
      //   final Map args = settings.arguments as Map;
      //   return Platform.isAndroid
      //       ? _FadedTransitionRoute(
      //           widget: ScreenTitle(
      //               widget: EditProfileScreen(
      //             snap: args["snap"],
      //           )),
      //           settings: settings)
      //       : CupertinoPageRoute(
      //           builder: (context) => EditProfileScreen(
      //                 snap: args["snap"],
      //               ));

      // case Routes.guideBook:
      //   return Platform.isAndroid
      //       ? _FadedTransitionRoute(
      //           widget: const ScreenTitle(widget: GuideBookScreen()),
      //           settings: settings)
      //       : CupertinoPageRoute(builder: (context) => const GuideBookScreen());

      // case Routes.guideBookToNextScreen:
      //   return Platform.isAndroid
      //       ? _FadedTransitionRoute(
      //           widget: const ScreenTitle(widget: GuideBookToNextScreen()),
      //           settings: settings)
      //       : CupertinoPageRoute(
      //           builder: (context) => const GuideBookToNextScreen());

      // case Routes.finishSession:
      //   return Platform.isAndroid
      //       ? _FadedTransitionRoute(
      //           widget: const ScreenTitle(widget: FinishSessionScreen()),
      //           settings: settings)
      //       : CupertinoPageRoute(
      //           builder: (context) => const FinishSessionScreen());

      // case Routes.homeScreen:
      //   return Platform.isAndroid
      //       ? _FadedTransitionRoute(
      //           widget: const ScreenTitle(widget: HomeScreen()),
      //           settings: settings)
      //       : CupertinoPageRoute(builder: (context) => const HomeScreen());

      // case Routes.changePasswordScreen:
      //   return Platform.isAndroid
      //       ? _FadedTransitionRoute(
      //           widget: const ScreenTitle(widget: ChangePasswordScreen()),
      //           settings: settings)
      //       : CupertinoPageRoute(
      //           builder: (context) => const ChangePasswordScreen());

      default:
        return null;
    }
  }
}

class _FadedTransitionRoute extends PageRouteBuilder {
  final Widget widget;
  @override
  final RouteSettings settings;

  _FadedTransitionRoute({required this.widget, required this.settings})
      : super(
          settings: settings,
          reverseTransitionDuration: const Duration(milliseconds: 1),
          pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return widget;
          },
          transitionDuration: const Duration(milliseconds: 1),
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child) {
            return FadeTransition(
              opacity: CurvedAnimation(
                parent: animation,
                curve: Curves.ease,
              ),
              child: child,
            );
          },
        );
}

class ScreenTitle extends StatelessWidget {
  final Widget widget;

  const ScreenTitle({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: .5, end: 1),
      duration: const Duration(milliseconds: 500),
      curve: Curves.bounceIn,
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: child,
        );
      },
      child: widget,
    );
  }
}
