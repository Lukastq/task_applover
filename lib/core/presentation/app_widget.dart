import 'package:flutter/material.dart';

import 'package:applover/authentication/presentation/login_page.dart';
import 'package:applover/core/presentation/success_page.dart';

import 'theme/app_theme.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: appTheme,
      initialRoute: 'login',
      routes: {
        'login': (_) => const LoginPage(),
        'success_page': (_) => const SuccessPage(),
      },
    );
  }
}
