// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:path_provider/path_provider.dart';

// Эта функция скачивает файл и возвращает локальный путь к нему.
Future<String?> downloadAuthenticatedFile(
  String? fileUrl,
  String? authToken,
) async {
  if (fileUrl == null ||
      authToken == null ||
      fileUrl.isEmpty ||
      authToken.isEmpty) {
    print('URL или токен отсутствуют.');
    return null;
  }

  try {
    final response = await http.get(
      Uri.parse(fileUrl),
      headers: {'Authorization': 'Bearer $authToken'},
    );

    if (response.statusCode == 200) {
      final dir = await getTemporaryDirectory();
      final fileName = fileUrl.split('/').last.split('?').first;
      final file = File('${dir.path}/$fileName');
      await file.writeAsBytes(response.bodyBytes);
      // Возвращаем путь к сохраненному файлу
      return file.path;
    } else {
      print('Ошибка загрузки файла: Код ${response.statusCode}');
      return null;
    }
  } catch (e) {
    print('Ошибка в Custom Action downloadAuthenticatedFile: $e');
    return null;
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
