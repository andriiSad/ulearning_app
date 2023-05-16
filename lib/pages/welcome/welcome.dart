import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/pages/welcome/bloc/welcome_blocs.dart';
import 'package:ulearning_app/pages/welcome/bloc/welcome_events.dart';
import 'package:ulearning_app/pages/welcome/bloc/welcome_states.dart';

import '../../common/values/colors.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  late final PageController _pageController;
  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Welcome'),
          backgroundColor: AppColors.primaryElement,
          centerTitle: true,
        ),
        body: BlocBuilder<WelcomeBloc, WelcomeState>(
          builder: (context, state) {
            return Container(
              margin: EdgeInsets.only(top: 45.h),
              width: 375.w,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  PageView(
                    controller: _pageController,
                    onPageChanged: (index) {
                      state.page = index;
                      context.read<WelcomeBloc>().add(WelcomeEvent());
                    },
                    children: [
                      _page(
                        index: 1,
                        context: context,
                        buttonName: 'Next',
                        title: 'First See Learning',
                        subTitle:
                            'Forget about a for of paper all knowledge in ome learning',
                        imagePath: 'assets/images/reading.png',
                      ),
                      _page(
                        index: 2,
                        context: context,
                        buttonName: 'Next',
                        title: 'Connect With Everyone',
                        subTitle:
                            'Always keep in touch with your tutor & friend. Lets get connected',
                        imagePath: 'assets/images/boy.png',
                      ),
                      _page(
                        index: 3,
                        context: context,
                        buttonName: 'Get Started',
                        title: 'Always Fascinated Learning',
                        subTitle:
                            'Anywhere, anytime. The time is at your discretion so study whenever you want',
                        imagePath: 'assets/images/man.png',
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 40.h,
                    child: DotsIndicator(
                      position: state.page.toDouble(),
                      dotsCount: 3,
                      mainAxisAlignment: MainAxisAlignment.center,
                      decorator: DotsDecorator(
                        color: AppColors.primaryThreeElementText,
                        activeColor: AppColors.primaryElement,
                        size: const Size.square(8.0),
                        activeSize: const Size(
                          18.0,
                          8.0,
                        ),
                        activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _page({
    required int index,
    required BuildContext context,
    required String buttonName,
    required String title,
    required String subTitle,
    required String imagePath,
  }) {
    return Column(
      children: [
        SizedBox(
          width: 345.w,
          height: 345.w,
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: TextStyle(
              color: AppColors.primaryText,
              fontSize: 24.sp,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        Container(
          width: 375.w,
          padding: EdgeInsets.only(
            left: 30.w,
            right: 30.w,
          ),
          child: Text(
            subTitle,
            style: TextStyle(
              color: AppColors.primarySecondaryElementText,
              fontSize: 14.sp,
              fontWeight: FontWeight.normal,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        GestureDetector(
          onTap: () {
            //within 0-2 index
            if (index < 3) {
              //animation
              _pageController.animateToPage(
                index,
                duration: const Duration(
                  milliseconds: 500,
                ),
                curve: Curves.decelerate,
              );
            } else {
              //jump to a new page
              Navigator.of(context).pushNamedAndRemoveUntil(
                '/sign_in',
                (route) => false,
              );
            }
          },
          child: Container(
            margin: EdgeInsets.only(
              top: 80.h,
              left: 25.w,
              right: 25.w,
            ),
            width: 325.w,
            height: 50.h,
            decoration: BoxDecoration(
              color: AppColors.primaryElement,
              borderRadius: BorderRadius.all(
                Radius.circular(15.w),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            child: Center(
              child: Text(
                buttonName,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
