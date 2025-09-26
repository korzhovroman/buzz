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
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:html' as html;

Future<void> downloadFile(
  String url,
  String authToken,
) async {
  // Получаем файл с авторизацией
  final response = await http.get(
    Uri.parse(url),
    headers: {'Authorization': 'Bearer $authToken'},
  );

  if (response.statusCode != 200) return;

  // Получаем имя файла из URL
  String fileName = url.contains('filename=')
      ? url.split('filename=')[1].split('&')[0]
      : 'file';

  // Получаем тип контента
  String contentType =
      response.headers['content-type'] ?? 'application/octet-stream';

  // Создаем Blob из данных
  final blob = html.Blob([response.bodyBytes], contentType);
  final downloadUrl = html.Url.createObjectUrlFromBlob(blob);

  // Создаем ссылку и запускаем скачивание
  final anchor = html.AnchorElement(href: downloadUrl)
    ..setAttribute('download', fileName)
    ..click();

  html.Url.revokeObjectUrl(downloadUrl);
}
