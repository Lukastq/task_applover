import 'package:applover/authentication/application/authentication_state_notifier.dart';
import 'package:applover/authentication/di/providers.dart';
import 'package:applover/authentication/presentation/widgets/loading_page.dart';
import 'package:flutter/material.dart';

import 'package:applover/authentication/presentation/login_page.dart';
import 'package:applover/core/presentation/success_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'theme/app_theme.dart';

class AppWidget extends ConsumerWidget {
  AppWidget({Key? key}) : super(key: key);

  final _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AuthenticationStatus>(
      authenticationStateProvider,
      (state) {
        state.map(
          unauthenticated: (_) => _navigatorKey.currentState!.pushNamedAndRemoveUntil('login_page', (route) => false),
          authenticated: (_) => _navigatorKey.currentState!.pushNamedAndRemoveUntil('success_page', (route) => false),
        );
      },
    );

    return MaterialApp(
      theme: appTheme,
      initialRoute: 'login_page',
      navigatorKey: _navigatorKey,
      onGenerateRoute: (settings) {
        
        Widget _customSlideTransition(context, animation, secondaryAnimation, child) {
          const begin = Offset(-1.0, 0.0);
          const end = Offset.zero;
          final tween = Tween(begin: begin, end: end);
          final offsetAnimation = animation.drive(tween);

          return SlideTransition(
            position: offsetAnimation,
            child: child,
          );
        }

        if (settings.name == 'success_page') {
          return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) {
              return const SuccessPage();
            },
            transitionsBuilder: _customSlideTransition,
          );
        } else if (settings.name == 'login_page') {
          return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) {
              return const LoginPage();
            },
            transitionsBuilder: _customSlideTransition,
          );
        } else if (settings.name == 'login_page_loader') {
          return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) {
              return const LoadingPage();
            },
            transitionsBuilder: _customSlideTransition,
          );
        }
      },
    );
  }
}
