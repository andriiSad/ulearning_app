import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/pages/home/bloc/home_page_blocs.dart';
import 'package:ulearning_app/pages/home/bloc/home_page_states.dart';

import '../../../common/values/colors.dart';
import '../bloc/home_page_events.dart';

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
          SizedBox(
            width: 15.w,
            height: 12.h,
            child: Image.asset('assets/icons/menu.png'),
          ),
          GestureDetector(
            child: Container(
              width: 40.w,
              height: 40.h,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/icons/person.png'),
                ),
              ),
            ),
          )
        ],
      ),
    ),
  );
}

//reusable big text widget
Widget homePageText(
  String text, {
  Color color = AppColors.primaryText,
  int top = 5,
}) {
  return Container(
    margin: EdgeInsets.only(
      top: top.h,
    ),
    child: Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: 24.sp,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

Widget searchView() {
  return Row(
    children: [
      Container(
        width: 280.w,
        height: 40.h,
        decoration: BoxDecoration(
          color: AppColors.primaryBackground,
          borderRadius: BorderRadius.circular(15.h),
          border: Border.all(
            color: AppColors.primaryFourElementText,
          ),
        ),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 17.w),
              width: 16.w,
              height: 16.w,
              child: Image.asset('assets/icons/search.png'),
            ),
            SizedBox(
              width: 190.w,
              height: 40.h,
              child: TextField(
                keyboardType: TextInputType.multiline,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(5, 5, 0, 5),
                  hintText: 'search your course',
                  hintStyle: TextStyle(
                    color: AppColors.primarySecondaryElementText,
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
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
                obscureText: false,
              ),
            ),
          ],
        ),
      ),
      SizedBox(
        width: 5.w,
      ),
      GestureDetector(
        child: Container(
          width: 40.w,
          height: 40.h,
          decoration: BoxDecoration(
            color: AppColors.primaryElement,
            borderRadius: BorderRadius.all(
              Radius.circular(13.w),
            ),
            border: Border.all(color: AppColors.primaryElement),
          ),
          child: Image.asset('assets/icons/options.png'),
        ),
      ),
    ],
  );
}

Widget slidersView(
  BuildContext context,
  HomePageStates state,
) {
  return Column(
    children: [
      Container(
        margin: EdgeInsets.only(top: 20.h),
        width: 325.w,
        height: 160.h,
        child: PageView(
          onPageChanged: (value) {
            context.read<HomePageBlocs>().add(HomePageDots(value));
          },
          children: [
            _slidersContainer(),
            _slidersContainer(path: 'assets/icons/image_1.png'),
            _slidersContainer(path: 'assets/icons/image_2.png'),
          ],
        ),
      ),
      Container(
        child: DotsIndicator(
          dotsCount: 3,
          position: state.index.toDouble(),
          decorator: DotsDecorator(
            color: AppColors.primaryThirdElementText,
            activeColor: AppColors.primaryElement,
            size: const Size.square(5.0),
            activeSize: const Size(17.0, 5.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
        ),
      ),
    ],
  );
}

Widget _slidersContainer({String path = 'assets/icons/art.png'}) {
  return Container(
    width: 325.w,
    height: 160.h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(
        Radius.circular(20.h),
      ),
      image: DecorationImage(
        fit: BoxFit.fill,
        image: AssetImage(path),
      ),
    ),
  );
}

Widget menuView() {
  return Column(
    children: [
      Container(
        width: 325.w,
        margin: EdgeInsets.only(top: 15.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            _reusableText('Choose your course'),
            GestureDetector(
              onTap: () {},
              child: _reusableText(
                'See all',
                color: AppColors.primaryThirdElementText,
                fontSize: 10,
              ),
            ),
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.only(top: 20.h),
        child: Row(
          children: [
            _reusableMenuText('All'),
            _reusableMenuText(
              'Popular',
              textColor: AppColors.primaryThirdElementText,
              backgroundColor: AppColors.primaryElementText,
            ),
            _reusableMenuText(
              'Newest',
              textColor: AppColors.primaryThirdElementText,
              backgroundColor: AppColors.primaryElementText,
            ),
          ],
        ),
      ),
    ],
  );
}

Widget _reusableMenuText(
  String menuText, {
  Color textColor = AppColors.primaryElementText,
  Color backgroundColor = AppColors.primaryElement,
}) {
  return Container(
    padding: EdgeInsets.symmetric(
      horizontal: 15.w,
      vertical: 5.h,
    ),
    margin: EdgeInsets.only(
      right: 20.w,
    ),
    decoration: BoxDecoration(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(7.w),
      border: Border.all(
        color: backgroundColor,
      ),
    ),
    child: _reusableText(
      menuText,
      color: textColor,
      fontWeight: FontWeight.normal,
      fontSize: 11,
    ),
  );
}

Widget _reusableText(
  String text, {
  Color color = AppColors.primaryText,
  int fontSize = 16,
  FontWeight fontWeight = FontWeight.bold,
}) {
  return Text(
    text,
    style: TextStyle(
      color: color,
      fontWeight: fontWeight,
      fontSize: fontSize.sp,
    ),
  );
}
