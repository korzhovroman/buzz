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

import 'index.dart'; // Imports other custom actions

import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:io' show Platform, Directory, File;

// Импорты для веба
import 'package:http/http.dart' as http;
import 'dart:html' as html;

// Импорты для мобильных
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:open_file/open_file.dart';

Future<bool> downloadAttachmentUniversal(
  String attachmentUrl,
  String fileName,
  String authToken,
  int allegroAccountId,
) async {
  try {
    if (kIsWeb) {
      // === ВЕБ-ВЕРСИЯ ===
      String? attachmentId = _getAttachmentId(attachmentUrl);
      if (attachmentId == null) {
        print('ОШИБКА: Не удалось найти ID файла из URL: $attachmentUrl');
        return false;
      }

      final baseUrl = html.window.location.origin;
      final downloadUrl =
          '$baseUrl/api/allegro/$allegroAccountId/attachments/$attachmentId/proxy?filename=${Uri.encodeComponent(fileName)}';

      print('Скачиваем через: $downloadUrl');

      final response = await http.get(
        Uri.parse(downloadUrl),
        headers: {
          'Authorization': 'Bearer $authToken',
        },
      );

      if (response.statusCode == 200) {
        final blob = html.Blob([response.bodyBytes]);
        final url = html.Url.createObjectUrlFromBlob(blob);
        final anchor = html.document.createElement('a') as html.AnchorElement
          ..href = url
          ..style.display = 'none'
          ..download = fileName;
        html.document.body!.children.add(anchor);
        anchor.click();
        html.document.body!.children.remove(anchor);
        html.Url.revokeObjectUrl(url);

        print('Скачивание успешно.');
        return true;
      } else {
        print('ОШИБКА скачивания: ${response.statusCode}');
        print('Ответ сервера: ${response.body}');
        return false;
      }
    } else {
      // === МОБИЛЬНАЯ ВЕРСИЯ ===
      if (Platform.isAndroid) {
        if (!await Permission.storage.request().isGranted) {
          print('ОШИБКА: Нет разрешений на запись в хранилище.');
          return false;
        }
      }

      String? attachmentId = _getAttachmentId(attachmentUrl);
      if (attachmentId == null) {
        print('ОШИБКА: Не удалось найти ID файла');
        return false;
      }

      Directory? saveDir = await getTemporaryDirectory();
      final filePath = '${saveDir.path}/$fileName';

      final dio = Dio();
      dio.options.headers['Authorization'] = 'Bearer $authToken';

      // Используем прокси-эндпоинт
      final baseUrl = 'https://web-production-d213c.up.railway.app';
      final downloadUrl =
          '$baseUrl/api/allegro/$allegroAccountId/attachments/$attachmentId/proxy';

      await dio.download(downloadUrl, filePath);

      final file = File(filePath);
      if (await file.exists()) {
        OpenFile.open(filePath);
        return true;
      }
      return false;
    }
  } catch (e) {
    print('КРИТИЧЕСКАЯ ОШИБКА: $e');
    return false;
  }
}

String? _getAttachmentId(String input) {
  if (input.isEmpty) return null;
  final uuidRegex =
      RegExp(r'[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}');
  final match = uuidRegex.firstMatch(input);
  return match?.group(0);
}
