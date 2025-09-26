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

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:path_provider/path_provider.dart';

Future<String?> downloadFileMobile(
  String url,
  String authToken,
) async {
  try {
    // Делаем запрос с авторизацией
    final response = await http.get(
      Uri.parse(url),
      headers: {'Authorization': 'Bearer $authToken'},
    );

    if (response.statusCode != 200) {
      print('Ошибка при загрузке файла: ${response.statusCode}');
      return null;
    }

    // Извлекаем имя файла из URL
    String fileName = 'download';
    if (url.contains('filename=')) {
      fileName = Uri.decodeComponent(url.split('filename=')[1].split('&')[0]);
    }

    // Получаем директорию для сохранения
    Directory directory;
    if (Platform.isAndroid) {
      // На Android сохраняем в Downloads
      directory = Directory('/storage/emulated/0/Download');
      if (!await directory.exists()) {
        // Если директория не существует, используем директорию приложения
        directory = await getApplicationDocumentsDirectory();
      }
    } else {
      // На iOS сохраняем в директорию приложения
      directory = await getApplicationDocumentsDirectory();
    }

    // Создаем полный путь к файлу
    final filePath = '${directory.path}/$fileName';

    // Записываем данные в файл
    final file = File(filePath);
    await file.writeAsBytes(response.bodyBytes);

    print('Файл сохранен: $filePath');

    // Возвращаем путь к файлу
    return filePath;
  } catch (e) {
    print('Ошибка при скачивании: $e');
    return null;
  }
}
