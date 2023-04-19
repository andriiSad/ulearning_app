import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/pages/sign_in/bloc/sign_in_blocs.dart';
import 'package:ulearning_app/pages/sign_in/bloc/sign_in_events.dart';
import 'package:ulearning_app/pages/sign_in/bloc/sign_in_states.dart';
import 'package:ulearning_app/pages/sign_in/sign_in_controller.dart';

import '../common_widgets.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(
      builder: (context, state) {
        return Container(
          color: Colors.white,
          child: SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: buildAppBar('Log In'),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildThirdPartyLogin(context),
                    Center(
                        child: reusableText('Or use your email account login')),
                    Container(
                      margin: EdgeInsets.only(top: 66.h),
                      padding: EdgeInsets.only(
                        left: 25.w,
                        right: 25.w,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          reusableText('Email'),
                          SizedBox(
                            height: 5.h,
                          ),
                          buildTextField(
                            hintText: 'Enter your email adress',
                            iconName: 'user',
                            func: (value) {
                              context.read<SignInBloc>().add(EmailEvent(value));
                            },
                          ),
                          reusableText('Password'),
                          SizedBox(
                            height: 5.h,
                          ),
                          buildTextField(
                            hintText: 'Enter your password',
                            iconName: 'lock',
                            isPassword: true,
                            func: (value) {
                              context
                                  .read<SignInBloc>()
                                  .add(PasswordEvent(value));
                            },
                          ),
                          forgotPassword(),
                          buildLigInAndRegButton(
                            buttonName: 'Log In',
                            buttonType: 'login',
                            callback: () {
                              SignInController(context: context)
                                  .handleSignIn('email');
                            },
                          ),
                          buildLigInAndRegButton(
                            buttonName: 'Sign Up',
                            buttonType: 'register',
                            callback: () {
                              Navigator.of(context).pushNamed('/register');
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
