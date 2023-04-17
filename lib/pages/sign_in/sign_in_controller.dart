import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          print('email is empty');
        }
        if (password.isEmpty) {
          print('password is empty');
        }
        try {
          final credential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: emailAdress, password: password);
          if (credential.user == null) {
            print('user does not exist');
          }
          if (!credential.user!.emailVerified) {
            print('user not verified');
          }
          var user = credential.user;
          if (user != null) {
            print('user is not null');
            //we got verified user from Firebase
          } else {
            print('user is null');
            //we have error getting user from Firebase
          }
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            print('No user found for that email.');
          } else if (e.code == 'wrong-password') {
            print('Wrong password provided for that user.');
          } else if (e.code == 'invalid-email') {
            print('Invalid email provided for that user.');
          }
        }
      }
    } catch (e) {
      print(e);
    }
  }
}
