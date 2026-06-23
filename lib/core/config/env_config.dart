import 'package:flutter_dotenv/flutter_dotenv.dart';

final class EnvConfig {
  const EnvConfig._();

  static Future<void> load() {
    return dotenv.load(fileName: '.env');
  }

  static String requiredString(String key) {
    if (!dotenv.isInitialized) {
      throw StateError('Environment has not been loaded.');
    }

    final value = dotenv.maybeGet(key)?.trim();
    if (value == null || value.isEmpty) {
      throw StateError('Missing required environment value: $key');
    }

    return value;
  }

  static String optionalString(String key) {
    if (!dotenv.isInitialized) {
      return '';
    }

    return dotenv.maybeGet(key)?.trim() ?? '';
  }
}
