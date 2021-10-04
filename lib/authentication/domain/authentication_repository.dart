import 'package:applover/authentication/domain/authentication_failure.dart';
import 'package:dartz/dartz.dart';

abstract class AuthenticationRepository {
  Future<bool> isSingedIn();
  Future<Either<AuthenticationFailure, Unit>> signIn(String email, String address);
  Future<void> signOut();
}
