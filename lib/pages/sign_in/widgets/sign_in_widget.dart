import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/values/colors.dart';

AppBar buildAppBar() {
  return AppBar(
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(1.0),
      child: Container(
        //height defines thickness of the underline
        height: 1,
        color: AppColors.primarySecondaryBackground,
      ),
    ),
    title: Text(
      'Log In',
      style: TextStyle(
        color: AppColors.primaryText,
        fontSize: 16.sp,
        fontWeight: FontWeight.normal,
      ),
    ),
    centerTitle: true,
  );
}

//we need context for accesing bloc
Widget buildThirdPartyLogin(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(
      top: 40.h,
      bottom: 20.h,
    ),
    padding: EdgeInsets.only(
      left: 65.w,
      right: 65.w,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _reusableIcons(iconName: 'google'),
        _reusableIcons(iconName: 'apple'),
        _reusableIcons(iconName: 'facebook'),
      ],
    ),
  );
}

Widget _reusableIcons({
  required String iconName,
}) {
  return GestureDetector(
    onTap: () {},
    child: SizedBox(
      width: 40.w,
      height: 40.w,
      child: Image.asset('assets/icons/$iconName.png'),
    ),
  );
}

Widget reusableText(String text) {
  return Container(
    margin: EdgeInsets.only(
      bottom: 5.h,
    ),
    child: Text(
      text,
      style: TextStyle(
        color: Colors.grey.withOpacity(0.5),
        fontWeight: FontWeight.normal,
        fontSize: 14.sp,
      ),
    ),
  );
}

Widget buildTextField({
  required String hintText,
  required String iconName,
  void Function(String value)? func,
  bool isPassword = false,
}) {
  return Container(
    width: 325.w,
    height: 50.h,
    margin: EdgeInsets.only(
      bottom: 20.h,
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(
        15.w,
      ),
      border: Border.all(
        color: AppColors.primaryFourthElementText,
      ),
    ),
    child: Row(
      children: [
        Container(
          width: 16.w,
          height: 16.w,
          margin: EdgeInsets.only(
            left: 17.w,
          ),
          child: Image.asset(
            'assets/icons/$iconName.png',
          ),
        ),
        SizedBox(
          width: 250.w,
          height: 50.h,
          child: TextField(
            onChanged: (value) => func!(value),
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: const TextStyle(
                color: AppColors.primarySecondaryElementText,
              ),
              border: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
              disabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
            ),
            style: TextStyle(
              color: AppColors.primaryText,
              fontFamily: 'Avenir',
              fontWeight: FontWeight.normal,
              fontSize: 14.sp,
            ),
            autocorrect: false,
            obscureText: isPassword ? true : false,
          ),
        ),
      ],
    ),
  );
}

Widget forgotPassword() {
  return SizedBox(
    width: 260.w,
    height: 44.h,
    child: GestureDetector(
      onTap: () {},
      child: Text(
        'Forgot Password?',
        style: TextStyle(
          color: AppColors.primaryText,
          fontSize: 12.sp,
          decoration: TextDecoration.underline,
        ),
      ),
    ),
  );
}

Widget buildLigInAndRegButton({
  required String buttonName,
  required String buttonType,
  required void Function() callback,
}) {
  return GestureDetector(
    onTap: callback,
    child: Container(
      width: 325.w,
      height: 50.h,
      margin: EdgeInsets.only(
        top: buttonType == 'login' ? 40.w : 20.h,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          15.w,
        ),
        color: buttonType == 'login'
            ? AppColors.primaryElement
            : AppColors.primaryBackground,
        border: Border.all(
          color: buttonType == 'login'
              ? Colors.transparent
              : AppColors.primaryFourthElementText,
        ),
        boxShadow: const [
          BoxShadow(
            spreadRadius: 1,
            blurRadius: 2,
            offset: Offset(0, 1),
            color: AppColors.primaryFourthElementText,
          ),
        ],
      ),
      child: Center(
        child: Text(
          buttonName,
          style: TextStyle(
            color: buttonType == 'login'
                ? AppColors.primaryBackground
                : AppColors.primaryText,
            fontSize: 16.sp,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    ),
  );
}
