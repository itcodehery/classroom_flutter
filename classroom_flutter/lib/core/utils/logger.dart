import 'package:logger/logger.dart';

class AppLogger {
  static final Logger _logger = Logger(
    printer: PrettyPrinter(
      methodCount: 2,
      errorMethodCount: 5,
      lineLength: 80,
      colors: true,
      printEmojis: true,
    ),
  );

  static void debug(String message) {
    _logger.d(message);
  }

  static void info(String message) {
    _logger.i(message);
  }

  static void warning(String message) {
    _logger.w(message);
  }

  static void error(String message, [error, StackTrace? stackTrace]) {
    _logger.e(message);
  }

  static void verbose(String message) {
    _logger.t(message);
  }

  static void fatal(String message) {
    _logger.f(message);
  }

  static void setLogLevel(Level level) {
    Logger.level = level;
  }
}
