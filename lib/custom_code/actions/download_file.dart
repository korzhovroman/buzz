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

// BEGIN CUSTOM ACTION CODE

import 'dart:io';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
// Условный импорт для веб-платформы
import 'dart:html' as html;
import 'package:flutter/foundation.dart' show kIsWeb;

Future<void> downloadFile(
  String url,
  String authToken,
) async {
  // --- ЛОГИКА ДЛЯ ВЕБ-БРАУЗЕРА ---
  if (kIsWeb) {
    try {
      final dio = Dio();
      final response = await dio.get(
        url,
        options: Options(
          headers: {'Authorization': 'Bearer $authToken'},
          responseType: ResponseType.bytes, // Важно для файлов
        ),
      );

      if (response.statusCode == 200) {
        String fileName = 'downloaded_file';
        final disposition = response.headers.value('content-disposition');
        if (disposition != null && disposition.contains('filename=')) {
          final startIndex = disposition.toLowerCase().indexOf('filename=');
          if (startIndex != -1) {
            String tempName = disposition.substring(startIndex + 9);
            if (tempName.startsWith('"')) {
              tempName = tempName.substring(1, tempName.length - 1);
            }
            fileName = Uri.decodeFull(tempName);
          }
        }

        final blob =
            html.Blob([response.data], response.headers.value('content-type'));
        final blobUrl = html.Url.createObjectUrlFromBlob(blob);
        final anchor = html.AnchorElement(href: blobUrl)
          ..setAttribute("download", fileName)
          ..style.display = 'none';
        html.document.body!.append(anchor);
        anchor.click();
        anchor.remove();
        html.Url.revokeObjectUrl(blobUrl);
      } else {
        print('Web Download Error: ${response.statusCode}');
      }
    } catch (e) {
      print('Web Download Exception: $e');
    }
    return;
  }

  // --- ЛОГИКА ДЛЯ МОБИЛЬНЫХ ПРИЛОЖЕНИЙ (ANDROID/IOS) ---
  try {
    // 1. Запрашиваем разрешение на доступ к хранилищу
    var status = await Permission.storage.request();
    if (status.isGranted) {
      // 2. Определяем, куда сохранить файл
      final Directory? dir = await getExternalStorageDirectory(); // Для Android
      // Для iOS можно использовать getApplicationDocumentsDirectory()
      if (dir == null) {
        print('Mobile Download Error: Could not get storage directory.');
        return;
      }
      final String savePath = '${dir.path}/your_downloads';
      await Directory(savePath).create(recursive: true);

      String fileName = 'downloaded_file';
      // (Можно добавить логику извлечения имени файла, как в веб-части)

      final String fullPath = '$savePath/$fileName';
      print('File will be saved to: $fullPath');

      // 3. Скачиваем файл с помощью Dio
      final dio = Dio();
      await dio.download(
        url,
        fullPath,
        options: Options(
          headers: {'Authorization': 'Bearer $authToken'},
        ),
      );

      print('Mobile file downloaded successfully.');
      // Здесь можно добавить показ уведомления пользователю
    } else {
      print('Mobile Download Error: Storage permission not granted.');
    }
  } catch (e) {
    print('Mobile Download Exception: $e');
  }
}

// DO NOT REMOVE OR MODIFY THE CODE BELOW!
