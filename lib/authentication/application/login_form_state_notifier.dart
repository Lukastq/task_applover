import 'package:applover/authentication/application/login_form_state.dart';
import 'package:applover/authentication/domain/authentication_repository.dart';
import 'package:applover/authentication/domain/validation/validators.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginFormStateNotifier extends StateNotifier<LoginFormState> {
  final AuthenticationRepository _authenticationRepository;

  LoginFormStateNotifier(this._authenticationRepository) : super(LoginFormState.initial());

  void onPasswordChanged(String? value) {
    state = state.copyWith(
      password: state.password.copyWith(value: value),
      status: const LoginFormStatus.editing(),
    );
  }

  void onEmailAddressChanged(String? value) {
    state = state.copyWith(
      emailAddress: state.emailAddress.copyWith(value: value),
      status: const LoginFormStatus.editing(),
    );
  }

  void onPasswordObscureTextChanged() {
    state = state.copyWith(
      password: state.password.copyWith(
        isObscureText: !state.password.isObscureText,
      ),
    );
  }

  void submit() async {
    final emailAddressIsValid = validateEmailAddress(state.emailAddress.value).isRight();
    final passwordIsValid = validatePassword(state.password.value).isRight();

    if (emailAddressIsValid && passwordIsValid) {
      state = state.copyWith(status: const LoginFormStatus.submissionInProgress());

      final authFailureOrLoggedIn = await _authenticationRepository.signIn(
        state.emailAddress.value!,
        state.password.value!,
      );

      authFailureOrLoggedIn.fold(
        (l) => state = state.copyWith(
          status: LoginFormStatus.submissionFailure(
            l.map(
              noInternetConnection: (_) => 'Device is offline',
              invalidEmailAndPasswordCombination: (_) => 'Email address or password is invalid',
              serverError: (_) => _.message ?? 'Server error. Please try later...',
            ),
          ),
        ),
        (r) => state = state.copyWith(status: const LoginFormStatus.submissionSuccess()),
      );
    } else {
      state = state.copyWith(
        status: const LoginFormStatus.submissionFailure("Login form has invalid fields!"),
      );
    }
  }
}
