import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test/app.dart';
import 'package:test/core/database/shared_pref_helper.dart';
import 'package:test/core/function/check_state_changes.dart';
import 'package:test/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  checkStateChanges();
  final container = ProviderContainer();
  await container.read(sharedPrefProvider).init();
  runApp(DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) =>
        UncontrolledProviderScope(container: container, child: const MyApp()),
  ));
}
