import 'package:applover/authentication/domain/validation/validators.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_form_state.freezed.dart';

String? _mapEmailAddressValidatorToErrorText(String? value) {
  return validateEmailAddress(value).fold(
    (l) => l.map(
      empty: (_) => 'Insert email address',
      invalid: (_) => 'Invalid email address',
    ),
    (r) => null,
  );
}

String? _mapPasswordValidatorToErrorText(String? value) {
  return validatePassword(value).fold(
    (l) => l.map(
      empty: (_) => 'Insert password',
      tooShort: (_) => 'Password should be at least 6 letters long',
    ),
    (r) => null,
  );
}

@freezed
class LoginFormState with _$LoginFormState {
  const LoginFormState._();
  const factory LoginFormState({
    required FormField emailAddress,
    required FormField password,
    required LoginFormStatus status,
  }) = _LoginFormState;

  factory LoginFormState.initial() => const LoginFormState(
        emailAddress: FormField(
          value: null,
          validator: _mapEmailAddressValidatorToErrorText,
          isObscureText: false,
        ),
        password: FormField(
          value: null,
          validator: _mapPasswordValidatorToErrorText,
          isObscureText: true,
        ),
        status: LoginFormStatus.editing(),
      );
}

@freezed
class LoginFormStatus with _$LoginFormStatus {
  const LoginFormStatus._();
  const factory LoginFormStatus.editing() = _WorkInProgress;
  const factory LoginFormStatus.submissionInProgress() = _IsSubmmiting;
  const factory LoginFormStatus.submissionSuccess() = _SubmittedSuccess;
  const factory LoginFormStatus.submissionFailure(String message) = _SubmittedFailure;
}

@freezed
class FormField with _$FormField {
  const FormField._();
  const factory FormField({
    required String? value,
    /// Returns `null` if form field is valid , otherwise returns error text
    required String? Function(String? value) validator,
    required bool isObscureText,
  }) = _FormField;
}
