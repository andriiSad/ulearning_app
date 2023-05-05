import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_app/common/widgets/flutter_toast.dart';

import 'bloc/sign_in_blocs.dart';

class SignInController {
  const SignInController({required this.context});
  final BuildContext context;

  Future<void> handleSignIn(String type) async {
    try {
      if (type == 'email') {
        final state = context.read<SignInBloc>().state;
        String emailAdress = state.email;
        String password = state.password;
        if (emailAdress.isEmpty) {
          toastInfo(msg: 'You need to fill email');
          return;
        }
        if (password.isEmpty) {
          toastInfo(msg: 'You need to fill password');
          return;
        }
        try {
          final credential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: emailAdress, password: password);
          if (credential.user == null) {
            toastInfo(msg: 'User does not exist');
            return;
          }
          if (!credential.user!.emailVerified) {
            toastInfo(msg: 'You need to verify your account');
            return;
          }
          var user = credential.user;
          if (user != null) {
            //we got verified user from Firebase
            toastInfo(msg: 'user is not null');
          } else {
            //we have error getting user from Firebase
            toastInfo(msg: 'User does not exist');
            return;
          }
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            toastInfo(msg: 'No user found for that email.');
          } else if (e.code == 'wrong-password') {
            toastInfo(msg: 'Wrong password provided for that user.');
          } else if (e.code == 'invalid-email') {
            toastInfo(msg: 'Your email format is wrong');
          } else {
            toastInfo(msg: e.code);
          }
        }
      }
    } catch (e) {
      print(e);
    }
  }
}
