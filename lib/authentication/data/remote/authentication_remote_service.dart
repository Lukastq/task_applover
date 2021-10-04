import 'package:applover/authentication/data/remote/remote_response.dart';

abstract class AuthenticationRemoteService {
  Future<RemoteResponse> singInWithEmailAndPassword(String emailAddress, String password);
  Future<RemoteResponse> singOut();
}
