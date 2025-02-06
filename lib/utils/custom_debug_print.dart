import 'package:flutter/foundation.dart';

void customDebugPrint(String message, {String? label}) {
  if (kDebugMode) {
    final StackTrace stackTrace = StackTrace.current;
    final String traceString = stackTrace.toString().split("\n")[1];
    final String fileInfo =
        traceString.substring(traceString.indexOf('(') + 1, traceString.indexOf(')'));

    final String labelString = label != null ? "[$label] " : "";

    final String fullMessage = "$labelString$fileInfo: $message";

    debugPrint(fullMessage);
  }
}
