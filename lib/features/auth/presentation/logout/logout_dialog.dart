// ignore_for_file: unused_import, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:training_app/constants/app_constants.dart';
import 'package:training_app/gen/colors.gen.dart';
import 'package:training_app/helpers/all_routes.dart';
import 'package:training_app/helpers/di.dart';
import 'package:training_app/helpers/navigation_service.dart';
import 'package:training_app/helpers/toast.dart';
import 'package:training_app/networks/api_access.dart';
import 'package:training_app/providers/auth_providers.dart';

class LogoutDialogWidget extends StatefulWidget {
  const LogoutDialogWidget({super.key});

  @override
  State<LogoutDialogWidget> createState() => _LogoutDialogWidgetState();
}

class _LogoutDialogWidgetState extends State<LogoutDialogWidget> {
  late final authProvider;
  @override
  void initState() {
    super.initState();
    authProvider = Provider.of<AuthProviders>(context, listen: false);
  }

  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        "Logout",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      content: _isLoading
          ? const Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SpinKitCircle(
                  color: Colors.yellow,
                  size: 50.0,
                ),
              ],
            )
          : const Text(
              "Are you sure you want to logout?",
              style: TextStyle(fontSize: 16),
            ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {
                  // Close the dialog
                  Navigator.of(context).pop();
                },
                child: const Text(
                  "Cancel",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              // UIHelper.horizontalSpace(30.w),
              ElevatedButton(
                onPressed: () async {
                  authProvider.clearTextField();
                  setState(() {
                    _isLoading = true;
                  });
                  logOutRxObj.logoutRx().then(
                    (value) async {
                      if (value) {
                        ToastUtil.showShortToast("Logout successfully.");
                        await appData.write(kKeyIsLoggedIn, false);
                        await appData.write(kKeyAccessToken, '');
                        setState(() {
                          _isLoading = false;
                        });
                        NavigationService.navigateToUntilReplacement(
                            Routes.onboardingScreen1);
                      } else {
                        setState(() {
                          _isLoading = false;
                        });
                        ToastUtil.showShortToast("Failed to logout.");
                      }
                    },
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow,
                ),
                child: const Text(
                  "Logout",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
