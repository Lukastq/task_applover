import 'package:applover/authentication/data/remote/fake_authentication_remote_service.dart';
import 'package:applover/authentication/di/providers.dart';
import 'package:applover/core/presentation/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    ProviderScope(
      overrides: [
        authRemoteServiceProvider.overrideWithValue(FakeAuthRemoteService()),
      ],
      child: const AppWidget(),
    ),
  );
}
