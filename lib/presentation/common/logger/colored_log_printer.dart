import 'dart:developer' as dev;

import 'package:loggy/loggy.dart';

/// Pretty printer that uses developer.log to show log messages
class ColoredDeveloperPrinter extends LoggyPrinter {
  const ColoredDeveloperPrinter();

  static final Map<LogLevel, String> _levelPrefixes = <LogLevel, String>{
    LogLevel.debug: '🐛 ',
    LogLevel.info: '👻 ',
    LogLevel.warning: '⚠️ ',
    LogLevel.error: '‼️ ',
  };

  // For undefined log levels
  static const String _defaultPrefix = '🤔 ';

  @override
  void onLog(LogRecord record) {
    final time = record.time.toIso8601String().split('T')[1];
    final callerFrame =
        record.callerFrame == null ? '-' : '(${record.callerFrame?.location})';
    final logLevel =
        record.level.toString().replaceAll('Level.', '').toUpperCase();
    final prefix = levelPrefix(record.level) ?? _defaultPrefix;

    final message = '$prefix$time $logLevel $callerFrame ${record.message}';
    final String colored;
    switch (record.level.priority) {
      case 2: // debug
        colored = '\x1B[32m$message\x1B[0m'; // green
        break;
      case 4: // info
        colored = '\x1B[34m$message\x1B[0m'; // blue
        break;
      case 8: // warning
        colored = '\x1B[33m$message\x1B[0m'; // yellow
        break;
      case 16: // error
        colored = '\x1B[31m$message\x1B[0m'; // red
        break;
      default:
        colored = '\x1B[34m$message\x1B[0m'; // blue
    }

    dev.log(
      colored,
      name: record.loggerName,
      error: record.error,
      stackTrace: record.stackTrace,
      level: record.level.priority,
      time: record.time,
      zone: record.zone,
      sequenceNumber: record.sequenceNumber,
    );
  }

  /// Get prefix for level
  String? levelPrefix(LogLevel level) {
    return _levelPrefixes[level];
  }
}
