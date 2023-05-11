import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_app/common/routes/names.dart';
import 'package:ulearning_app/pages/register/bloc/register_blocs.dart';
import 'package:ulearning_app/pages/register/register.dart';
import 'package:ulearning_app/pages/sign_in/bloc/sign_in_blocs.dart';
import 'package:ulearning_app/pages/sign_in/sign_in.dart';
import 'package:ulearning_app/pages/welcome/welcome.dart';

import '../../pages/application/app_page.dart';
import '../../pages/welcome/bloc/welcome_blocs.dart';

class AppPages {
  static List<PageEntity> routes() {
    return [
      PageEntity(
        route: AppRoutes.INITIAL,
        page: const Welcome(),
        bloc: BlocProvider(
          create: (_) => WelcomeBloc(),
        ),
      ),
      PageEntity(
        route: AppRoutes.SIGN_IN,
        page: const SignIn(),
        bloc: BlocProvider(
          create: (_) => SignInBloc(),
        ),
      ),
      PageEntity(
        route: AppRoutes.REGISTER,
        page: const Register(),
        bloc: BlocProvider(
          create: (_) => RegisterBlocs(),
        ),
      ),
      PageEntity(
        route: AppRoutes.APPLICATION,
        page: const AppPage(),
      ),
    ];
  }

//return all bloc providers
  static List<dynamic> allProviders(BuildContext context) {
    List<dynamic> blocProviders = <dynamic>[];

    for (var bloc in routes()) {
      blocProviders.add(bloc.bloc);
    }
    return blocProviders;
  }
}

//unify blocProvider and routes and pages
class PageEntity {
  PageEntity({
    required this.route,
    required this.page,
    this.bloc,
  });

  String route;
  Widget page;
  dynamic bloc;
}
