import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/routes/names.dart';
import 'package:ulearning_app/common/values/colors.dart';
import 'package:ulearning_app/common/values/constant.dart';
import 'package:ulearning_app/global.dart';
import 'package:ulearning_app/pages/application/bloc/app_events.dart';

import '../../application/bloc/app_blocs.dart';

AppBar buildAppBar() {
  return AppBar(
    centerTitle: true,
    title: Text(
      'Settings',
      style: TextStyle(
        color: AppColors.primaryText,
        fontWeight: FontWeight.bold,
        fontSize: 16.sp,
      ),
    ),
  );
}

Widget logoutButton(BuildContext context) {
  return GestureDetector(
    onTap: () {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Confirm Logout'),
            content: const Text('Are you sure you want to logout?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () => _removeUserData(context),
                child: const Text('Confirm'),
              ),
            ],
          );
        },
      );
    },
    child: Container(
      height: 100.h,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/icons/Logout.png'),
          fit: BoxFit.fitHeight,
        ),
      ),
    ),
  );
}

void _removeUserData(BuildContext context) {
  // nedded to open home page after re-login
  context.read<AppBlocs>().add(const TriggerAppEvent(0));
  //to clear the user token
  Global.storageService.remove(AppConstants.STORAGE_USER_TOKEN);
  //show sign_in page
  Navigator.of(context)
      .pushNamedAndRemoveUntil(AppRoutes.SIGN_IN, (route) => false);
}
