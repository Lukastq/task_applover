import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:applover/authentication/application/login_form_state.dart';
import 'package:applover/authentication/di/providers.dart';
import 'package:applover/core/presentation/theme/app_colors.dart';

import 'login_text_fields.dart';

class LoginForm extends ConsumerStatefulWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends ConsumerState<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    ref.listen<LoginFormStatus>(
      loginFormStateProvider.select((state) => state.status),
      (state) {
        state.maybeMap(
          orElse: () {},
          submissionInProgress: (_) => Navigator.of(context).pushNamed('login_page_loader'),
          submissionFailure: (_) {
            if (Navigator.of(context).canPop()) {
              Navigator.of(context).pop();
            }
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                SnackBar(
                  content: Text(
                    _.message,
                    style: GoogleFonts.roboto(fontSize: 14, color: Theme.of(context).colorScheme.onError),
                  ),
                  backgroundColor: Theme.of(context).errorColor,
                ),
              );
          },
          submissionSuccess: (_) {
            ref.read(authenticationStateProvider.notifier).checkAuthenticationStatus();
          },
        );
      },
    );

    return AutofillGroup(
      child: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.disabled,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 24, bottom: 40),
              child: Text("Login", style: GoogleFonts.roboto(fontSize: 20)),
            ),
            const EmailAddressTextField(),
            const SizedBox(height: 18),
            const PasswordTextField(),
            const SizedBox(height: 18),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    FocusScope.of(context).unfocus();
                    _formKey.currentState!.save();
                    ref.read(loginFormStateProvider.notifier).submit();
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
