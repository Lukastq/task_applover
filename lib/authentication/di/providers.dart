import 'package:applover/authentication/application/login_form_state.dart';
import 'package:applover/authentication/application/login_form_state_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:applover/authentication/application/authentication_state_notifier.dart';
import 'package:applover/authentication/data/authentication_repository_impl.dart';
import 'package:applover/authentication/data/remote/authentication_remote_service.dart';
import 'package:applover/authentication/domain/authentication_repository.dart';

final authRemoteServiceProvider = Provider<AuthenticationRemoteService>(
  (ref) => throw UnimplementedError(),
);

final authRepositoryProvider = Provider<AuthenticationRepository>(
  (ref) => AuthenticationRepositoryImpl(ref.watch(authRemoteServiceProvider)),
);

final authenticationStateProvider = StateNotifierProvider<AuthenticationStatusNotifier, AuthenticationStatus>(
  (ref) => AuthenticationStatusNotifier(ref.watch(authRepositoryProvider)),
);

final loginFormStateProvider = StateNotifierProvider<LoginFormStateNotifier, LoginFormState>(
  (ref) => LoginFormStateNotifier(ref.watch(authRepositoryProvider)),
);
