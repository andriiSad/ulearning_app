import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/common/routes/names.dart';
import 'package:ulearning_app/common/values/colors.dart';

AppBar buildAppBar() {
  return AppBar(
    title: Container(
      margin: EdgeInsets.symmetric(
        horizontal: 7.w,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {},
            child: SizedBox(
              width: 18.w,
              height: 12.h,
              child: Image.asset('assets/icons/menu.png'),
            ),
          ),
          Text(
            'Profile',
            style: TextStyle(
              color: AppColors.primaryText,
              fontWeight: FontWeight.bold,
              fontSize: 16.sp,
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: SizedBox(
              width: 24.w,
              height: 24.h,
              child: Image.asset('assets/icons/more-vertical.png'),
            ),
          ),
        ],
      ),
    ),
  );
}

//profile icon and edit button
Widget profileIconAndEditButton() {
  return Container(
    width: 80.w,
    height: 80.h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20.h),
      image: const DecorationImage(
        image: AssetImage('assets/icons/headpic.png'),
      ),
    ),
    child: Container(
      alignment: Alignment.bottomRight,
      padding: EdgeInsets.only(
        right: 6.w,
      ),
      child: Image(
        width: 25.w,
        height: 25.h,
        image: const AssetImage(
          'assets/icons/edit_3.png',
        ),
      ),
    ),
  );
}

var imagesInfo = <String, String>{
  'Settings': 'assets/icons/settings.png',
  'Payment details': 'assets/icons/credit-card.png',
  'Achievements': 'assets/icons/award.png',
  'Love': 'assets/icons/heart(1).png',
  'Learning Reminders': 'assets/icons/cube.png',
};

//setting section buttons
Widget buildListView(BuildContext context) {
  return Column(
    children: [
      ...List.generate(
        imagesInfo.length,
        (index) => _buildListTile(
          title: imagesInfo.keys.elementAt(index),
          iconPath: imagesInfo.values.elementAt(index),
          callback: () {
            if (index == 0) {
              Navigator.of(context).pushNamed(AppRoutes.SETTINGS);
            } else {
              print('configure other routes');
            }
          },
        ),
      ),
    ],
  );
}

Widget _buildListTile({
  required String title,
  required String iconPath,
  required void Function() callback,
}) {
  return GestureDetector(
    onTap: callback,
    child: Container(
      margin: EdgeInsets.only(bottom: 15.h),
      child: Row(
        children: [
          Container(
            width: 40.w,
            height: 40.h,
            padding: EdgeInsets.all(7.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7.w),
              color: AppColors.primaryElement,
            ),
            child: Image.asset(iconPath),
          ),
          SizedBox(width: 15.w),
          Text(
            title,
            style: TextStyle(
              color: AppColors.primaryText,
              fontWeight: FontWeight.bold,
              fontSize: 16.sp,
            ),
          ),
        ],
      ),
    ),
  );
}
