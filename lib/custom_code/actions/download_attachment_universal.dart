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
// - attachmentUrl (String) - URL файла
// - fileName (String) - имя файла
// - authToken (String) - токен авторизации
// - allegroAccountId (int) - ID аккаунта Allegro

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:io' show Platform, Directory, File;
import 'dart:typed_data';

// Импорты для веб
import 'dart:html' as html show window, document, AnchorElement, Url;

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
    print('=== СКАЧИВАНИЕ ФАЙЛА ===');
    print('Платформа: ${kIsWeb ? "WEB" : "МОБИЛЬНАЯ"}');
    print('Файл: $fileName');

    if (kIsWeb) {
      // === ВЕБ-ВЕРСИЯ - ГЛАВНОЕ ИСПРАВЛЕНИЕ ===

      // Извлекаем ID из URL лучше
      String? attachmentId = _getAttachmentId(attachmentUrl);

      if (attachmentId == null) {
        print('ОШИБКА: Не удалось найти ID файла');
        return false;
      }

      print('ID файла: $attachmentId');

      // Строим правильный URL
      final baseUrl = html.window.location.origin;
      final downloadUrl =
          '$baseUrl/api/allegro/$allegroAccountId/attachments/$attachmentId/proxy?download=true&filename=${Uri.encodeComponent(fileName)}';

      print('URL для скачивания: $downloadUrl');

      try {
        // Метод 1: Открываем в новой вкладке
        html.window.open(downloadUrl, '_blank');
        await Future.delayed(Duration(milliseconds: 500));
        print('Файл открыт в новой вкладке');
        return true;
      } catch (e) {
        print('Ошибка открытия в новой вкладке: $e');

        try {
          // Метод 2: Создаем ссылку для скачивания
          final link = html.document.createElement('a') as html.AnchorElement;
          link.href = downloadUrl;
          link.download = fileName;
          link.click();
          print('Скачивание через ссылку');
          return true;
        } catch (e2) {
          print('Все методы не сработали: $e2');
          return false;
        }
      }
    } else {
      // === МОБИЛЬНАЯ ВЕРСИЯ (без изменений) ===

      // Проверяем разрешения для Android
      if (Platform.isAndroid) {
        var status = await Permission.storage.status;
        if (!status.isGranted) {
          status = await Permission.storage.request();
          if (!status.isGranted) {
            print('ОШИБКА: Нет разрешений');
            return false;
          }
        }
      }

      // Определяем папку
      Directory saveDir;
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

      // Скачиваем
      final dio = Dio();
      dio.options.headers['Authorization'] = 'Bearer $authToken';
      dio.options.headers['Accept'] = '*/*';
      dio.options.connectTimeout = Duration(seconds: 30);
      dio.options.receiveTimeout = Duration(minutes: 5);

      await dio.download(attachmentUrl, filePath);

      // Проверяем
      final file = File(filePath);
      if (file.existsSync()) {
        print('Файл сохранен');
        try {
          await OpenFile.open(filePath);
        } catch (e) {
          print('Не удалось открыть: $e');
        }
        return true;
      }
      return false;
    }
  } catch (e) {
    print('ОШИБКА: $e');
    return false;
  }
}

// ГЛАВНАЯ ФУНКЦИЯ - ИСПРАВЛЕННОЕ ИЗВЛЕЧЕНИЕ ID
String? _getAttachmentId(String input) {
  if (input.isEmpty) return null;

  // Если в URL есть /message-attachments/
  if (input.contains('/message-attachments/')) {
    final parts = input.split('/message-attachments/');
    if (parts.length >= 2) {
      String id = parts[1].split('?')[0].split('/')[0];
      if (id.isNotEmpty) {
        print('ID извлечен из URL: $id');
        return id;
      }
    }
  }

  // Ищем UUID pattern
  final uuidRegex =
      RegExp(r'[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}');
  final match = uuidRegex.firstMatch(input);
  if (match != null) {
    print('UUID найден: ${match.group(0)}');
    return match.group(0);
  }

  // Возможно это уже ID
  if (!input.startsWith('http') && input.length > 10 && input.length < 100) {
    print('Используем как прямой ID: $input');
    return input.trim();
  }

  return null;
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
