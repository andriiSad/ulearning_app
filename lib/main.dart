import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ulearning_app/common/routes/pages.dart';
import 'package:ulearning_app/pages/application/app_page.dart';

import 'common/values/colors.dart';
import 'firebase_options.dart';

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
      providers: AppPages.allProviders(context),
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
          debugShowCheckedModeBanner: false,
          home: const AppPage(),
          // initialRoute: '/',
          // routes: {
          //   '/signIn': (context) => const SignIn(),
          //   '/register': (context) => const Register(),
          // },
        ),
      ),
    );
  }
}
