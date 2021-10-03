import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:applover/core/presentation/constants.dart' as constants;

import 'widgets/login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double maxWidth = math.max(MediaQuery.of(context).size.width, constants.maxWidth);

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 64, right: 16, left: 16, bottom: 40),
          child: Center(
            child: SizedBox(
              width: maxWidth,
              child: const LoginForm(),
            ),
          ),
        ),
      ),
    );
  }
}

