import 'package:applover/authentication/data/authentication_repository_impl.dart';
import 'package:applover/authentication/data/remote/remote_response.dart';
import 'package:applover/authentication/domain/authentication_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:applover/authentication/data/remote/authentication_remote_service.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'authentication_repository_impl_test.mocks.dart';

@GenerateMocks([AuthenticationRemoteService])
void main() {
  final emailAddress = "test@test.com";
  final password = "Test12345";

  group('Sign In:', () {
    final mockAuthRemoteSerivce = MockAuthenticationRemoteService();
    final repository = AuthenticationRepositoryImpl(mockAuthRemoteSerivce);

    test('Should return unit when the call to remote serivce to sing in returns RemoteResponse.data()', () async {
      final mockAuthRemoteSerivce = MockAuthenticationRemoteService();
      final repository = AuthenticationRepositoryImpl(mockAuthRemoteSerivce);

      when(mockAuthRemoteSerivce.singInWithEmailAndPassword(emailAddress, password)).thenAnswer((_) async => const RemoteResponse.data());

      final result = await repository.signIn(emailAddress, password);

      verify(mockAuthRemoteSerivce.singInWithEmailAndPassword(emailAddress, password));
      expect(result, equals(const Right(unit)));
    });
    test('Should return noInternetConnection when call to remote service returns RemoteResponse.NoInternetConnection()', () async {
      when(mockAuthRemoteSerivce.singInWithEmailAndPassword(emailAddress, password))
          .thenAnswer((_) async => const RemoteResponse.noInternetConnection());

      final result = await repository.signIn(emailAddress, password);

      verify(mockAuthRemoteSerivce.singInWithEmailAndPassword(emailAddress, password));
      expect(result, equals(const Left(AuthenticationFailure.noInternetConnection())));
    });

    test('Should return invalid email and password combination when call to remote service returns errorCode == 401', () async {
      when(mockAuthRemoteSerivce.singInWithEmailAndPassword(emailAddress, password))
          .thenAnswer((_) async => const RemoteResponse.error(errorCode: 401));

      final result = await repository.signIn(emailAddress, password);

      verify(mockAuthRemoteSerivce.singInWithEmailAndPassword(emailAddress, password));
      expect(result, equals(const Left(AuthenticationFailure.invalidEmailAndPasswordCombination())));
    });

    test('Should return server error when call to remote service returns other errorCode than 401', () async {
      when(mockAuthRemoteSerivce.singInWithEmailAndPassword(emailAddress, password))
          .thenAnswer((_) async => const RemoteResponse.error(errorCode: 500));

      final result = await repository.signIn(emailAddress, password);

      verify(mockAuthRemoteSerivce.singInWithEmailAndPassword(emailAddress, password));
      expect(result, equals(const Left(AuthenticationFailure.serverError())));
    });
  });
}
