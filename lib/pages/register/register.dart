import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/pages/register/bloc/register_blocs.dart';
import 'package:ulearning_app/pages/register/bloc/register_states.dart';
import 'package:ulearning_app/pages/register/register_controller.dart';

import '../common_widgets.dart';
import 'bloc/register_events.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBlocs, RegisterStates>(
      builder: (context, state) {
        return Container(
          color: Colors.white,
          child: SafeArea(
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: buildAppBar('Sign Up'),
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: 20.h),
                        child: reusableText(
                            'Enter your details below & free sign up'),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 60.h),
                      padding: EdgeInsets.only(
                        left: 25.w,
                        right: 25.w,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          reusableText('User name'),
                          buildTextField(
                            hintText: 'Enter your user name',
                            iconName: 'user',
                            func: (value) {
                              context
                                  .read<RegisterBlocs>()
                                  .add(UserNameEvent(value));
                            },
                          ),
                          reusableText('Email'),
                          buildTextField(
                            hintText: 'Enter your email adress',
                            iconName: 'user',
                            func: (value) {
                              context
                                  .read<RegisterBlocs>()
                                  .add(EmailEvent(value));
                            },
                          ),
                          reusableText('Password'),
                          buildTextField(
                            hintText: 'Enter your password',
                            iconName: 'lock',
                            isPassword: true,
                            func: (value) {
                              context
                                  .read<RegisterBlocs>()
                                  .add(PasswordEvent(value));
                            },
                          ),
                          reusableText('Confirm Password'),
                          buildTextField(
                            hintText: 'Enter your password again',
                            iconName: 'lock',
                            isPassword: true,
                            func: (value) {
                              context
                                  .read<RegisterBlocs>()
                                  .add(RePasswordEvent(value));
                            },
                          ),
                          reusableText(
                              'By creating an account you have to agree with our them & condication'),
                          buildLigInAndRegButton(
                            buttonName: 'Sign Up',
                            buttonType: 'login',
                            callback: () {
                              RegisterController(context: context)
                                  .handleEmailRegister();
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
