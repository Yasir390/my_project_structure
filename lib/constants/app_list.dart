// import 'package:training_app/features/plan/models/plan_model.dart';
// import 'package:training_app/gen/assets.gen.dart';

// class AppList {
//   static List signUpScreenBottomIconList = [
//     Assets.images.signUpScreenIconOne.path,
//     Assets.images.signUpScreenIconTwo.path,
//     Assets.images.signUpScreenIconThree.path,
//     Assets.images.signUpScreenIconFour.path,
//   ];

//   static List<String> positionList = [
//     "Postion 1",
//     "Postion 2",
//     "Postion 3",
//     "Postion 4",
//     "Postion 5",
//     "Postion 6",
//     "Postion 7",
//     "Postion 8",
//     "Postion 9",
//     "Postion 10",
//     "Postion 11",
//     "Postion 12",
//     "Postion 13",
//     "Postion 14",
//     "Postion 15",
//     "Postion 16",
//     "Postion 17",
//     "Postion 18",
//     "Postion 19",
//     "Postion 20",
//   ];

//   static List<PlanModel> monthly = [
//     PlanModel(
//       planType: 'BASIC',
//       planStatus: false,
//       planPrice: 9.99,
//       title: 'per player/month\nbilled monthly',
//       description:
//           'The basic player membership plan gives players access to a weekly player challenge, with the ability to be on the leaderboard.',
//     ),
//     PlanModel(
//       planType: 'PRO',
//       planStatus: true,
//       planPrice: 19.99,
//       title: 'per player/month\nbilled monthly',
//       description:
//           'Everything in the Basic plan, plus the ‘train’ and ‘learn’ portals, packed with resources to develop every aspect of your game.',
//     ),
//   ];

//   static List<PlanModel> yearly = [
//     PlanModel(
//       planType: 'BASIC',
//       planStatus: false,
//       planPrice: 109.99,
//       title: 'per player/year\nbilled monthly',
//       subTitle: "*ONE MONTH FREE",
//       description:
//           'The basic player membership plan gives players access to a weekly player challenge, with the ability to be on the leaderboard, and earn achievements.',
//     ),
//     PlanModel(
//       planType: 'PRO',
//       planStatus: true,
//       planPrice: 219.99,
//       title: 'per player/year\nbilled monthly',
//       subTitle: "*ONE MONTH FREE",
//       description:
//           'Everything in the Basic plan, plus the ‘train’ and ‘learn’ portals, packed with resources to develop every aspect of your game.',
//     ),
//     PlanModel(
//       planType: 'TRAINING MEMBERSHIP',
//       planStatus: true,
//       planPrice: 299.99,
//       title: 'per player/year\nbilled monthly',
//       description:
//           'For players attending our in-person private sessions. Everything in the Pro plan, plus a Beestera training shirt, two performance reports, and up to 20% discounts off in-person sessions.',
//     ),
//   ];

//   // static List<LeaderboardPlayersDataModel> leaderboardList = [
//   //   LeaderboardPlayersDataModel(
//   //     profileImagePath: Assets.images.profilePicture.path,
//   //     userName: "Marticulo",
//   //     teamName: "Albany",
//   //     repsCompleted: 15,
//   //   ),
//   //   LeaderboardPlayersDataModel(
//   //     profileImagePath: Assets.images.profilePicture.path,
//   //     userName: "Burbank",
//   //     teamName: "Scorpions",
//   //     repsCompleted: 14,
//   //   ),
//   //   LeaderboardPlayersDataModel(
//   //     profileImagePath: Assets.images.profilePicture.path,
//   //     userName: "Marticulo",
//   //     teamName: "Albany",
//   //     repsCompleted: 15,
//   //   ),
//   //   LeaderboardPlayersDataModel(
//   //     profileImagePath: Assets.images.profilePicture.path,
//   //     userName: "Burbank",
//   //     teamName: "Scorpions",
//   //     repsCompleted: 14,
//   //   ),
//   //   LeaderboardPlayersDataModel(
//   //     profileImagePath: Assets.images.profilePicture.path,
//   //     userName: "Marticulo",
//   //     teamName: "Albany",
//   //     repsCompleted: 15,
//   //   ),
//   //   LeaderboardPlayersDataModel(
//   //     profileImagePath: Assets.images.profilePicture.path,
//   //     userName: "Burbank",
//   //     teamName: "Scorpions",
//   //     repsCompleted: 14,
//   //   ),
//   //   LeaderboardPlayersDataModel(
//   //     profileImagePath: Assets.images.profilePicture.path,
//   //     userName: "Marticulo",
//   //     teamName: "Albany",
//   //     repsCompleted: 15,
//   //   ),
//   //   LeaderboardPlayersDataModel(
//   //     profileImagePath: Assets.images.profilePicture.path,
//   //     userName: "Burbank",
//   //     teamName: "Scorpions",
//   //     repsCompleted: 14,
//   //   ),
//   //   LeaderboardPlayersDataModel(
//   //     profileImagePath: Assets.images.profilePicture.path,
//   //     userName: "Marticulo",
//   //     teamName: "Albany",
//   //     repsCompleted: 15,
//   //   ),
//   //   LeaderboardPlayersDataModel(
//   //     profileImagePath: Assets.images.profilePicture.path,
//   //     userName: "Burbank",
//   //     teamName: "Scorpions",
//   //     repsCompleted: 14,
//   //   ),
//   //   LeaderboardPlayersDataModel(
//   //     profileImagePath: Assets.images.profilePicture.path,
//   //     userName: "Marticulo",
//   //     teamName: "Albany",
//   //     repsCompleted: 15,
//   //   ),
//   //   LeaderboardPlayersDataModel(
//   //     profileImagePath: Assets.images.profilePicture.path,
//   //     userName: "Burbank",
//   //     teamName: "Scorpions",
//   //     repsCompleted: 14,
//   //   ),
//   //   LeaderboardPlayersDataModel(
//   //     profileImagePath: Assets.images.profilePicture.path,
//   //     userName: "Marticulo",
//   //     teamName: "Albany",
//   //     repsCompleted: 15,
//   //   ),
//   //   LeaderboardPlayersDataModel(
//   //     profileImagePath: Assets.images.profilePicture.path,
//   //     userName: "Burbank",
//   //     teamName: "Scorpions",
//   //     repsCompleted: 14,
//   //   ),
//   //   LeaderboardPlayersDataModel(
//   //     profileImagePath: Assets.images.profilePicture.path,
//   //     userName: "Marticulo",
//   //     teamName: "Albany",
//   //     repsCompleted: 15,
//   //   ),
//   //   LeaderboardPlayersDataModel(
//   //     profileImagePath: Assets.images.profilePicture.path,
//   //     userName: "Burbank",
//   //     teamName: "Scorpions",
//   //     repsCompleted: 14,
//   //   ),
//   //   LeaderboardPlayersDataModel(
//   //     profileImagePath: Assets.images.profilePicture.path,
//   //     userName: "Marticulo",
//   //     teamName: "Albany",
//   //     repsCompleted: 15,
//   //   ),
//   //   LeaderboardPlayersDataModel(
//   //     profileImagePath: Assets.images.profilePicture.path,
//   //     userName: "Burbank",
//   //     teamName: "Scorpions",
//   //     repsCompleted: 14,
//   //   ),
//   //   LeaderboardPlayersDataModel(
//   //     profileImagePath: Assets.images.profilePicture.path,
//   //     userName: "Marticulo",
//   //     teamName: "Albany",
//   //     repsCompleted: 15,
//   //   ),
//   //   LeaderboardPlayersDataModel(
//   //     profileImagePath: Assets.images.profilePicture.path,
//   //     userName: "Burbank",
//   //     teamName: "Scorpions",
//   //     repsCompleted: 14,
//   //   ),
//   // ];
// }
