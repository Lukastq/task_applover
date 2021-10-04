import 'package:applover/authentication/domain/authentication_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'authentication_state_notifier.freezed.dart';

@freezed
class AuthenticationStatus with _$AuthenticationStatus {
  const AuthenticationStatus._();
  const factory AuthenticationStatus.unauthenticated() = _Unauthenticated;
  const factory AuthenticationStatus.authenticated() = _Authenticated;
}

class AuthenticationStatusNotifier extends StateNotifier<AuthenticationStatus> {
  final AuthenticationRepository _authenticationRepository;

  AuthenticationStatusNotifier(this._authenticationRepository) : super(const AuthenticationStatus.unauthenticated());

  void checkAuthenticationStatus() async {
    final result = await _authenticationRepository.isSingedIn();

    state = result ? const AuthenticationStatus.authenticated() : const AuthenticationStatus.unauthenticated();
  }

  void signOut() async {
    await _authenticationRepository.signOut();
    state = const AuthenticationStatus.unauthenticated();
  }
}
