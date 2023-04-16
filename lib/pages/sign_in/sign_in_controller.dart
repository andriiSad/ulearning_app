import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/sign_in_blocs.dart';

class SignInController {
  const SignInController({required this.context});
  final BuildContext context;

  void handleSignIn(String type) {
    try {
      if (type == 'email') {
        final state = context.read<SignInBloc>().state;
      }
    } catch (e) {
      print(e);
    }
  }
}
