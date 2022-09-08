import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String get fileName {
    String env = const String.fromEnvironment('ENVIRONMENT', defaultValue: 'DEV');
    if (env == 'DEV') {
      // environment for dev
      return '.env';
    } else if (env == 'STAG') {
      // environment for staging
      return '.env.stag';
    }
    // environment for production
    return '.env.prod';
  }

  static String get apiUrl {
    return dotenv.get('API_URL');
  }
}
