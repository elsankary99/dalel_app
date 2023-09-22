import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test/app.dart';
import 'package:test/core/database/shared_pref_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final container = ProviderContainer();
  await container.read(sharedPrefProvider).init();
  runApp(DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) =>
        UncontrolledProviderScope(container: container, child: const MyApp()),
  ));
}
