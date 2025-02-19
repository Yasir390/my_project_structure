// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:provider/provider.dart';
// import 'package:training_app/gen/colors.gen.dart';
// import 'package:training_app/providers/onboarding_screen_four_provider.dart';

// class SelectPreferFoot extends StatelessWidget {
//   const SelectPreferFoot({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<SignupScreenProvider2>(
//       builder: (context, provider, child) {
//         return Container(
//           padding: EdgeInsets.zero,
//           decoration: BoxDecoration(
//               color: AppColors.c020202,
//               border: Border.all(color: AppColors.cffffff),
//               borderRadius: BorderRadius.circular(10.r)),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               InkWell(
//                 onTap: () {
//                   // Set the selected Foot to "L"
//                   provider.setSelectedFoot("L");
//                 },
//                 child: Container(
//                   width: 36.w,
//                   height: 36.h,
//                   decoration: BoxDecoration(
//                     color: provider.selectedFoot == "L"
//                         ? AppColors.cffffff
//                         : AppColors.c020202,
//                     borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(10.r),
//                       bottomLeft: Radius.circular(10.r),
//                       topRight: provider.selectedFoot == "L"
//                           ? Radius.circular(10.r)
//                           : Radius.circular(0.r),
//                       bottomRight: provider.selectedFoot == "L"
//                           ? Radius.circular(10.r)
//                           : Radius.circular(0.r),
//                     ),
//                   ),
//                   child: Center(
//                     child: Text(
//                       "L",
//                       style: TextStyle(
//                         fontWeight: FontWeight.w400,
//                         fontSize: 14.w,
//                         color: provider.selectedFoot == "L"
//                             ? AppColors.c020202
//                             : AppColors.cffffff,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               InkWell(
//                 onTap: () {
//                   // Set the selected Foot to "R"
//                   provider.setSelectedFoot("R");
//                 },
//                 child: Container(
//                   width: 36.w,
//                   height: 36.h,
//                   decoration: BoxDecoration(
//                     color: provider.selectedFoot == "R"
//                         ? AppColors.cffffff
//                         : AppColors.c020202,
//                     borderRadius: BorderRadius.only(
//                       topLeft: provider.selectedFoot == "R"
//                           ? Radius.circular(10.r)
//                           : Radius.circular(0.r),
//                       bottomLeft: provider.selectedFoot == "R"
//                           ? Radius.circular(10.r)
//                           : Radius.circular(0.r),
//                       topRight: Radius.circular(10.r),
//                       bottomRight: Radius.circular(10.r),
//                     ),
//                   ),
//                   child: Center(
//                     child: Text(
//                       "R",
//                       style: TextStyle(
//                         fontWeight: FontWeight.w400,
//                         fontSize: 14.w,
//                         color: provider.selectedFoot == "R"
//                             ? AppColors.c020202
//                             : AppColors.cffffff,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
