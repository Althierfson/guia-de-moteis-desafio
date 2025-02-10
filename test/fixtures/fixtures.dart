import 'dart:io';

Future<String> readMock(String fileName) async => File("test/mocks/$fileName").readAsString();
