
import 'package:applover/core/presentation/success_page.dart';
import 'package:applover/core/presentation/theme/app_colors.dart';
import 'package:applover/core/presentation/widgets/applover_logo.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'loading_page.dart';
import 'login_text_fields.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: AutofillGroup(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 96,
              width: 96,
              child: Hero(
                tag: "applover",
                child: ApploverLogo(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24, bottom: 40),
              child: Text("Login", style: GoogleFonts.roboto(fontSize: 20)),
            ),
            const LoginEmailTextField(),
            const SizedBox(height: 18),
            const LoginPasswordTextField(),
            const SizedBox(height: 18),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();

                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) {
                          return const LoadingPage();
                        },
                        transitionsBuilder: (context, animation, secondaryAnimation, child) {
                          const begin = Offset(-1.0, 0.0);
                          const end = Offset.zero;
                          final tween = Tween(begin: begin, end: end);
                          final offsetAnimation = animation.drive(tween);

                          return SlideTransition(
                            position: offsetAnimation,
                            child: child,
                          );
                        },
                      ),
                    );

                    await Future.delayed(Duration(seconds: 2));

                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) {
                          return const SuccessPage();
                        },
                        transitionsBuilder: (context, animation, secondaryAnimation, child) {
                          const begin = Offset(-1.0, 0.0);
                          const end = Offset.zero;
                          final tween = Tween(begin: begin, end: end);
                          final offsetAnimation = animation.drive(tween);

                          return SlideTransition(
                            position: offsetAnimation,
                            child: child,
                          );
                        },
                      ),
                    );
                  }
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(AppColors.green),
                  padding: MaterialStateProperty.all(const EdgeInsets.all(14)),
                ),
                child: Text(
                  "Login",
                  style: GoogleFonts.roboto(fontSize: 14, color: AppColors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
