import 'package:applover/core/presentation/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final _textFieldInputDecoration = InputDecoration(
  hintStyle: GoogleFonts.roboto(fontSize: 14, color: AppColors.white),
  contentPadding: const EdgeInsets.all(14),
  border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors.white), borderRadius: BorderRadius.circular(6)),
  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors.green), borderRadius: BorderRadius.circular(6)),
);

class LoginEmailTextField extends StatelessWidget {
  const LoginEmailTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofillHints: const [AutofillHints.email],
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: _textFieldInputDecoration.copyWith(
        hintText: "Email address",
      ),
      validator: (value) {
        if (value == null) {
          return "Insert email address";
        }

        final email = value.trim();

        if (email.isEmpty) {
          return "Insert email address";
        }
        if (email.length > 320) {
          return "Invalid email address";
        }
        bool valid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);

        if (!valid) {
          return "Invalid email address";
        }
        return null;
      },
    );
  }
}

class LoginPasswordTextField extends StatefulWidget {
  const LoginPasswordTextField({Key? key}) : super(key: key);

  @override
  State<LoginPasswordTextField> createState() => _LoginPasswordTextFieldState();
}

class _LoginPasswordTextFieldState extends State<LoginPasswordTextField> {
  bool preview = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.visiblePassword,
      autofillHints: const [AutofillHints.password],
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: _textFieldInputDecoration.copyWith(
        hintText: "Password",
        suffixIcon: IconButton(
          icon: Image.asset(preview ? 'assets/icons/b-preview.png' : 'assets/icons/preview.png', color: AppColors.white),
          onPressed: () {
            setState(() => preview = !preview);
          },
        ),
      ),
      validator: (password) {
        if (password == null || password.isEmpty) {
          return "Insert password";
        }
        if (password.length < 6) {
          return "Password should be at least 6 letters long";
        }
      },
      obscureText: !preview,
    );
  }
}
