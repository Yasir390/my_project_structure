import 'package:provider/provider.dart';
import 'package:training_app/providers/auth_providers.dart';


var providers = [
  ChangeNotifierProvider<AuthProviders>(create: ((context) => AuthProviders())),
  // ChangeNotifierProvider<SignupScreenProvider>(
  //     create: ((context) => SignupScreenProvider())),
  // ChangeNotifierProvider<SignupScreenProvider2>(
  //     create: ((context) => SignupScreenProvider2())),
  // ChangeNotifierProvider<PlanScreenProvider>(
  //     create: ((context) => PlanScreenProvider())),
  // ChangeNotifierProvider<LeaderBoardProvider>(
  //     create: ((context) => LeaderBoardProvider())),
  // ChangeNotifierProvider<ChallangeExecutionCameraScreenProvider>(
  //     create: ((context) => ChallangeExecutionCameraScreenProvider())),
  // ChangeNotifierProvider<BoostVideoScreenProvider>(
  //     create: ((context) => BoostVideoScreenProvider())),
  // ChangeNotifierProvider<ChallengeDetailsScreenProvider>(
      // create: ((context) => ChallengeDetailsScreenProvider())),
];
