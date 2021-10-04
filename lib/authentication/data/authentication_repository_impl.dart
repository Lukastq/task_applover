import 'package:applover/authentication/data/remote/authentication_remote_service.dart';
import 'package:applover/authentication/domain/authentication_failure.dart';
import 'package:applover/authentication/domain/authentication_repository.dart';
import 'package:dartz/dartz.dart';

class AuthenticationRepositoryImpl extends AuthenticationRepository {
  final AuthenticationRemoteService _authenticationRemoteService;

  AuthenticationRepositoryImpl(this._authenticationRemoteService);

  // To keep signIn status. In future this could be User object
  var _isSigned = false;

  @override
  Future<Either<AuthenticationFailure, Unit>> signIn(String emailAddress, String password) async {
    final response = await _authenticationRemoteService.singInWithEmailAndPassword(emailAddress, password);

    return response.map(
      data: (_) {
        _isSigned = true;

        return right(unit);
      },
      error: (_) {
        _isSigned = false;

        if (_.errorCode != null) {
          // Can add custom logic to diffrent errorCodes
          if (_.errorCode == 401) {
            return left(const AuthenticationFailure.invalidEmailAndPasswordCombination());
          }
        }

        return left(const AuthenticationFailure.serverError());
      },
      noInternetConnection: (_) {
        _isSigned = false;

        return left(const AuthenticationFailure.noInternetConnection());
      },
    );
  }

  @override
  Future<bool> isSingedIn() async {
    return _isSigned;
  }

  @override
  Future<void> signOut() async {
    await _authenticationRemoteService.singOut();
    _isSigned = false;
  }
}
