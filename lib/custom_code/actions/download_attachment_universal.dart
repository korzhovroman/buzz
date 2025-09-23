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

// Custom Action: downloadAttachmentUniversal
// Parameters:
// - attachmentId (String) - ID вложения
// - attachmentUrl (String) - URL файла (для мобильных)
// - fileName (String) - имя файла
// - authToken (String) - токен авторизации
// - allegroAccountId (int) - ID аккаунта Allegro

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:io' show Platform, Directory, File;
import 'dart:typed_data';

// Импорты для веб
import 'dart:html' as html show window;

// Импорты для мобильных (только если не веб)
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
    print('=== УНИВЕРСАЛЬНОЕ СКАЧИВАНИЕ ===');
    print('Платформа: ${kIsWeb ? "WEB" : Platform.operatingSystem}');
    print('Файл: $fileName');
    print('URL: $attachmentUrl');

    if (kIsWeb) {
      // === ЛОГИКА ДЛЯ ВЕБ-БРАУЗЕРА ===
      print('Используем веб-версию скачивания...');

      // Извлекаем ID из URL
      // URL формат: https://upload.allegro.pl/message-center/message-attachments/{ID}
      final uri = Uri.parse(attachmentUrl);
      final pathSegments = uri.pathSegments;

      String? attachmentId;
      for (int i = 0; i < pathSegments.length; i++) {
        if (pathSegments[i] == 'message-attachments' &&
            i + 1 < pathSegments.length) {
          attachmentId = pathSegments[i + 1];
          break;
        }
      }

      if (attachmentId == null) {
        print('ОШИБКА: Не удалось извлечь ID из URL');
        return false;
      }

      print('Извлеченный ID: $attachmentId');

      // Строим URL для proxy эндпоинта
      final proxyUrl =
          '/api/allegro/$allegroAccountId/attachments/$attachmentId/proxy';
      print('Proxy URL: $proxyUrl');

      // Открываем в новой вкладке - браузер сам предложит скачать
      html.window.open(proxyUrl, '_blank');

      print('Файл открыт в новой вкладке');
      return true;
    } else {
      // === ЛОГИКА ДЛЯ МОБИЛЬНЫХ УСТРОЙСТВ ===
      print('Используем мобильную версию скачивания...');

      // Проверяем параметры
      if (attachmentUrl.isEmpty || fileName.isEmpty || authToken.isEmpty) {
        print('ОШИБКА: Пустые параметры');
        return false;
      }

      // Проверяем разрешения для Android
      if (Platform.isAndroid) {
        print('Android: проверяем разрешения...');
        var status = await Permission.storage.status;
        if (!status.isGranted) {
          status = await Permission.storage.request();
          if (!status.isGranted) {
            print('ОШИБКА: Разрешения отклонены');
            return false;
          }
        }
        print('Разрешения получены');
      }

      // Выбираем папку для сохранения
      Directory? saveDir;
      if (Platform.isAndroid) {
        saveDir = Directory('/storage/emulated/0/Download');
        if (!saveDir.existsSync()) {
          saveDir = await getApplicationDocumentsDirectory();
        }
      } else {
        saveDir = await getApplicationDocumentsDirectory();
      }

      final filePath = '${saveDir.path}/$fileName';
      print('Сохраняем в: $filePath');

      // Скачиваем файл
      final dio = Dio();
      dio.options.headers['Authorization'] = 'Bearer $authToken';
      dio.options.headers['Accept'] = '*/*';
      dio.options.connectTimeout = Duration(seconds: 30);
      dio.options.receiveTimeout = Duration(minutes: 5);

      await dio.download(
        attachmentUrl,
        filePath,
        onReceiveProgress: (received, total) {
          if (total != -1) {
            final progress = (received / total * 100).toStringAsFixed(0);
            print('Прогресс: $progress%');
          }
        },
      );

      // Проверяем результат
      final file = File(filePath);
      if (file.existsSync()) {
        print('Файл сохранен: ${file.lengthSync()} байт');

        // Пытаемся открыть файл
        try {
          await OpenFile.open(filePath);
          print('Файл открыт');
        } catch (e) {
          print('Не удалось открыть файл: $e');
        }

        return true;
      } else {
        print('ОШИБКА: Файл не сохранился');
        return false;
      }
    }
  } catch (e) {
    print('ОШИБКА: $e');
    return false;
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
