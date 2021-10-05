import 'package:applover/authentication/di/providers.dart';
import 'package:applover/core/presentation/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

final _textFieldInputDecoration = InputDecoration(
  hintStyle: GoogleFonts.roboto(fontSize: 14, color: AppColors.white),
  contentPadding: const EdgeInsets.all(14),
  border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors.white), borderRadius: BorderRadius.circular(6)),
  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors.green), borderRadius: BorderRadius.circular(6)),
);

class EmailAddressTextField extends ConsumerWidget {
  const EmailAddressTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(loginFormStateProvider.select((value) => value.emailAddress));

    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofillHints: const [AutofillHints.email],
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: _textFieldInputDecoration.copyWith(
        hintText: 'Email address',
      ),
      onChanged: (value) => ref.read(loginFormStateProvider.notifier).onEmailAddressChanged(value),
      validator: state.validator,
      onEditingComplete: () => FocusScope.of(context).nextFocus(),
    );
  }
}

class PasswordTextField extends ConsumerWidget {
  const PasswordTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(loginFormStateProvider.select((value) => value.password));

    return TextFormField(
      keyboardType: TextInputType.visiblePassword,
      autofillHints: const [AutofillHints.password],
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: _textFieldInputDecoration.copyWith(
        hintText: "Password",
        suffixIcon: IconButton(
          icon: Image.asset(
            !state.isObscureText ? 'assets/icons/b-preview.png' : 'assets/icons/preview.png',
            color: AppColors.white,
          ),
          onPressed: () => ref.read(loginFormStateProvider.notifier).onPasswordObscureTextChanged(),
        ),
      ),
      onChanged: (value) => ref.read(loginFormStateProvider.notifier).onPasswordChanged(value),
      validator: state.validator,
      obscureText: state.isObscureText,
      onEditingComplete: () => FocusScope.of(context).unfocus(),
    );
  }
}
