import 'package:applover/authentication/data/remote/authentication_remote_service.dart';
import 'dart:math' as math;

import 'package:applover/authentication/data/remote/remote_response.dart';

class FakeAuthRemoteService extends AuthenticationRemoteService {
  final random = math.Random();

  @override
  Future<RemoteResponse> singInWithEmailAndPassword(String emailAddress, String password) async {
    await Future.delayed(const Duration(seconds: 2));

    final value = random.nextInt(6);

    switch (value) {
      case 0:
        return const RemoteResponse.noInternetConnection();
      case 1:
        return const RemoteResponse.error(errorCode: 401);
      case 2:
        return const RemoteResponse.error(errorCode: 501);
      default:
        return const RemoteResponse.data();
    }
  }

  @override
  Future<RemoteResponse> singOut() async {
    return const RemoteResponse.data();
  }
}
