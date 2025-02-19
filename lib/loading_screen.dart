import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:training_app/constants/app_constants.dart';

import 'package:training_app/networks/api_access.dart';
import 'package:training_app/networks/dio/dio.dart';
import 'package:training_app/splash_screen.dart';
import 'helpers/di.dart';
import 'helpers/helper_methods.dart';

final class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  bool _isLoading = true;

  @override
  void initState() {
    loadInitialData();
    super.initState();
  }

  loadInitialData() async {
    await setInitValue();
    bool data = appData.read(kKeyIsLoggedIn) ?? false;
    log("==== $data");
    if (data) {
      String token = appData.read(kKeyAccessToken);
      DioSingleton.instance.update(token);
      await getOwnProfileRxObj.getOwnProfileRx();
      // await getHomeDataRxObj.getHomeDataRx();
      // await getChallengeResponseRxObj.getChallengeResponseRx();
   
    }
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const SplashScreen();
    } else {
      return appData.read(kKeyIsLoggedIn)
          ? const Text("")
          : const Text("");
    }
  }
}
