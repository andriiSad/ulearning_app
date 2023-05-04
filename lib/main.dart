import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ulearning_app/app_blocs.dart';
import 'package:ulearning_app/app_states.dart';
import 'package:ulearning_app/pages/bloc_providers.dart';
import 'package:ulearning_app/pages/sign_in/sign_in.dart';
import 'package:ulearning_app/pages/welcome/welcome.dart';

import 'app_events.dart';
import 'common/values/colors.dart';
import 'firebase_options.dart';
import 'pages/register/register.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: AppBlocProviders.allBlocProviders,
      child: ScreenUtilInit(
        builder: (context, child) => MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            appBarTheme: const AppBarTheme(
              iconTheme: IconThemeData(
                color: AppColors.primaryText,
              ),
              backgroundColor: Colors.white,
              elevation: 0,
            ),
            primarySwatch: Colors.blue,
          ),
          home: const Welcome(),
          debugShowCheckedModeBanner: false,
          routes: {
            '/signIn': (context) => const SignIn(),
            '/register': (context) => const Register(),
          },
        ),
      ),
    );
  }
}
