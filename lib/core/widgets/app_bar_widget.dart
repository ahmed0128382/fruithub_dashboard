import 'package:flutter/material.dart';
import 'package:fruithub_dashboard/core/utils/app_colors.dart';
import 'package:fruithub_dashboard/core/utils/app_styles.dart';

AppBar appBarWidget(context, {required String title}) {
  return AppBar(
    backgroundColor: Colors.white,
    centerTitle: true,
    title: Text(
      title,
      style: AppStyles.bold19,
    ),
    leading: GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Icon(Icons.arrow_back_ios_new)),
    actions: [
      IconButton(
        icon: const Icon(
          Icons.notifications,
          size: 30,
          color: AppColors.primaryColor,
        ),
        onPressed: () {
          // Handle notification button press
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('لا توجد إشعارات جديدة')),
          );
        },
      ),
    ],
  );
}

// class AppBarWidget extends StatelessWidget {
//   const AppBarWidget({super.key, required this.title});
//   final String title;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(color: Colors.white),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           GestureDetector(
//               onTap: () {
//                 Navigator.of(context).pop();
//               },
//               child: Icon(Icons.arrow_back_ios_new)),
//           Text(
//             title,
//             style: AppStyles.bold19,
//           ),
//           IconButton(
//             icon: const Icon(
//               Icons.notifications,
//               size: 30,
//               color: AppColors.primaryColor,
//             ),
//             onPressed: () {
//               // Handle notification button press
//               ScaffoldMessenger.of(context).showSnackBar(
//                 const SnackBar(content: Text('لا توجد إشعارات جديدة')),
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
