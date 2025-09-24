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

// --------- НОВЫЕ ИМПОРТЫ ДЛЯ ВЕБ (ЭТО ИСПРАВЛЕНИЕ) ---------
import 'package:http/http.dart' as http;
import 'dart:html' as html;
// ---------------------------------------------------------

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
      // === ВЕБ-ВЕРСИЯ: ИСПРАВЛЕННАЯ ЛОГИКА ===
      String? attachmentId = _getAttachmentId(attachmentUrl);
      if (attachmentId == null) {
        print('ОШИБКА: Не удалось найти ID файла из URL: $attachmentUrl');
        return false;
      }

      final baseUrl = html.window.location.origin;
      final downloadUrl =
          '$baseUrl/api/allegro/$allegroAccountId/attachments/$attachmentId/proxy?download=true&filename=${Uri.encodeComponent(fileName)}';

      // 1. Делаем аутентифицированный запрос с помощью http-клиента
      final response = await http.get(
        Uri.parse(downloadUrl),
        headers: {
          'Authorization': 'Bearer $authToken',
        },
      );

      // 2. Проверяем, что запрос успешен
      if (response.statusCode == 200) {
        // 3. Создаем Blob из байтов файла
        final blob = html.Blob([response.bodyBytes]);
        // 4. Создаем временный URL для этого Blob
        final url = html.Url.createObjectUrlFromBlob(blob);
        // 5. Создаем невидимый элемент <a> для скачивания
        final anchor = html.document.createElement('a') as html.AnchorElement
          ..href = url
          ..style.display = 'none'
          ..download = fileName;
        html.document.body!.children.add(anchor);

        // 6. "Кликаем" по ссылке, чтобы запустить скачивание
        anchor.click();

        // 7. Убираем временные элементы
        html.document.body!.children.remove(anchor);
        html.Url.revokeObjectUrl(url);

        print('Скачивание в вебе инициировано успешно.');
        return true;
      } else {
        print(
            'ОШИБКА: Запрос на скачивание файла провалился со статусом ${response.statusCode}');
        return false;
      }
    } else {
      // === МОБИЛЬНАЯ ВЕРСИЯ (без изменений) ===
      if (Platform.isAndroid) {
        if (await Permission.storage.request().isGranted) {
          // либо есть разрешение, либо оно было только что дано
        } else {
          print('ОШИБКА: Нет разрешений на запись в хранилище.');
          return false;
        }
      }

      Directory? saveDir = await getTemporaryDirectory();

      final filePath = '${saveDir.path}/$fileName';

      final dio = Dio();
      dio.options.headers['Authorization'] = 'Bearer $authToken';
      dio.options.headers['Accept'] = '*/*';

      await dio.download(attachmentUrl, filePath);

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
