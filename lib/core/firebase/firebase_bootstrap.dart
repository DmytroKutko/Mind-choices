import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

import '../config/env_config.dart';
import '../../firebase_options.dart';

Future<FirebaseApp> initializeFirebaseApp() async {
  final app = Firebase.apps.isNotEmpty
      ? Firebase.app()
      : await Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        );

  await _activateFirebaseAppCheck();

  return app;
}

Future<void> _activateFirebaseAppCheck() async {
  await FirebaseAppCheck.instance.activate(
    providerAndroid: kReleaseMode
        ? const AndroidPlayIntegrityProvider()
        : const AndroidDebugProvider(),
    providerApple: kReleaseMode
        ? const AppleAppAttestWithDeviceCheckFallbackProvider()
        : const AppleDebugProvider(),
    providerWeb: _webProvider,
  );

  await FirebaseAppCheck.instance.setTokenAutoRefreshEnabled(true);
}

WebProvider? get _webProvider {
  if (!kIsWeb) {
    return null;
  }

  if (kReleaseMode && _webRecaptchaSiteKey.isNotEmpty) {
    return ReCaptchaV3Provider(_webRecaptchaSiteKey);
  }

  return WebDebugProvider();
}

String get _webRecaptchaSiteKey {
  return EnvConfig.optionalString('APP_CHECK_RECAPTCHA_SITE_KEY');
}
