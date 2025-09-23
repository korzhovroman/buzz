import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/supabase/supabase.dart';
import '/auth/supabase_auth/auth_util.dart';

String formatDateString(String? dateString) {
  if (dateString == null || dateString.isEmpty) {
    return 'Brak';
  }
  try {
    final DateTime parsedDate = DateTime.parse(dateString);
    final DateFormat formatter = DateFormat('dd MMMM yyyy', 'pl_PL');
    return formatter.format(parsedDate);
  } catch (e) {
    return 'Błędna data';
  }
}

List<dynamic> filterOwnerFromList(List<dynamic> memberList) {
  {
    if (memberList == null) {
      return []; // Возвращаем пустой список, если на вход пришел null
    }

    // Создаем новый список для отфильтрованных результатов
    List<dynamic> filteredList = [];

    for (var member in memberList) {
      // Проверяем, что роль участника - не 'owner'
      if (member['role'] != 'owner') {
        filteredList.add(member);
      }
    }

    return filteredList;
  }
}

List<dynamic>? jsonToListAllegro(dynamic inputData) {
  if (inputData == null) {
    return [];
  }

  // Проверяем, является ли входное значение уже списком. Если да, возвращаем его.
  if (inputData is List) {
    return inputData;
  }

  // На всякий случай, если придет что-то неожиданное, возвращаем пустой список.
  return [];
}

bool? isMyMessage(String? authorRole) {
  bool isMyMessage(String? authorRole) {
    // Эта функция вернет true, если роль - SELLER
    // и false в любом другом случае.
    if (authorRole == 'SELLER') {
      return true;
    } else {
      return false;
    }
  }
}

bool? hasPermission(
  int? accountId,
  List<int>? permissionIds,
) {
  {
    // Проверяем, что входные данные не пустые, и ищем совпадение
    if (accountId == null || permissionIds == null) {
      return false;
    }
    return permissionIds.contains(accountId);
  }
}

bool? isIdInList(
  List<int>? idList,
  int? currentId,
) {
  {
    // Safety checks
    if (idList == null || currentId == null) {
      return false;
    }
    return idList.contains(currentId);
  }
}

bool? isPermissionListEmpty(dynamic apiResponse) {
  if (apiResponse == null || apiResponse['data'] == null) {
    return true;
  }
  // Проверяем, что 'data' является списком и что он пуст
  if (apiResponse['data'] is List) {
    return (apiResponse['data'] as List).isEmpty;
  }
  // Если 'data' не список, считаем его пустым на всякий случай
  return true;
}

String getFileName(FFUploadedFile uploadedFile) {
  {
    return uploadedFile?.name ?? '';
  }
}

int getFileSize(FFUploadedFile uploadedFile) {
  return uploadedFile?.bytes?.length ?? 0;
}

dynamic findMessageWithContext(List<dynamic> messagesList) {
  {
    // Если список пустой, сразу выходим.
    if (messagesList == null || messagesList.isEmpty) {
      return null;
    }

    // Идем по списку В ОБРАТНОМ ПОРЯДКЕ (от самых свежих к старым).
    for (final item in messagesList) {
      // Проверяем, что каждый элемент - это карта (объект JSON).
      if (item is Map<String, dynamic>) {
        // Проверяем, есть ли в нем ключ 'relatesTo'.
        if (item.containsKey('relatesTo') &&
            item['relatesTo'] is Map<String, dynamic>) {
          final relatesTo = item['relatesTo'] as Map<String, dynamic>;

          // Проверяем, есть ли внутри 'relatesTo' ключ 'offer' и он не пустой.
          if (relatesTo.containsKey('offer') && relatesTo['offer'] != null) {
            // Нашли самое свежее! Возвращаем это сообщение.
            return item;
          }

          // Проверяем, есть ли внутри 'relatesTo' ключ 'order' и он не пустой.
          if (relatesTo.containsKey('order') && relatesTo['order'] != null) {
            // Нашли самое свежее! Возвращаем это сообщение.
            return item;
          }
        }
      }
    }

    // Если ничего не нашли, возвращаем null.
    return null;
  }
}

dynamic getFirstMessageFromList(List<dynamic> messagesList) {
  {
    // Returns the last item from the list, which is the first message chronologically.
    if (messagesList == null || messagesList.isEmpty) {
      return null;
    }
    return messagesList.last;
  }
}

String? buildOfferUrl(
  String? marketplaceId,
  String? offerId,
) {
  {
    String domain = "allegro.pl"; // Домен по умолчанию
    String path = "oferta"; // Путь по умолчанию

    if (marketplaceId == "allegro-cz") {
      domain = "allegro.cz";
      path = "nabidka";
    } else if (marketplaceId == "allegro-sk") {
      domain = "allegro.sk";
      path = "ponuka";
    } else if (marketplaceId == "allegro-hu") {
      // 👇 ДОБАВЛЕНО ДЛЯ ВЕНГРИИ
      domain = "allegro.hu";
      path = "ajanlat";
    }
    // Можно добавить другие рынки по аналогии

    return "https://$domain/$path/$offerId";
  }
}

String translateStatusToPolish(String? status) {
  if (status == null || status.isEmpty) {
    return 'Nieznany';
  }

  // Словарь для перевода статусов
  final statusTranslations = {
    'NEW': 'Nowe',
    'PROCESSING': 'W realizacji',
    'READY_FOR_SHIPMENT': 'Gotowe do wysyłki',
    'READY_FOR_PICKUP': 'Gotowe do odbioru',
    'SENT': 'Wysłane',
    'PICKED_UP': 'Odebrane',
    'CANCELLED': 'Anulowane',
    'SUSPENDED': 'Wstrzymane',
    'RETURNED': 'Zwrócone',
    // Дополнительный статус, который тоже встречается
    'READY_FOR_PROCESSING': 'Do realizacji'
  };

  // Возвращаем перевод или оригинальный статус, если перевода нет
  return statusTranslations[status] ?? status;
}

List<dynamic> parseMessages(dynamic apiResponseBody) {
  {
    // Входные данные - это уже готовый JSON-объект.
    // Нам не нужно его парсить, нужно просто получить доступ к полям.
    try {
      if (apiResponseBody == null) {
        return [];
      }

      // Напрямую получаем доступ к ключам, как в обычном объекте.
      final messages = apiResponseBody['data']['messages'];

      if (messages is List) {
        return messages;
      }

      return [];
    } catch (e) {
      print('Error accessing messages from JSON object: $e');
      return [];
    }
  }
}

String? formatDateStringAnswer(String dateString) {
  if (dateString == null || dateString.isEmpty) {
    return 'Brak';
  }
  try {
    // Простое удаление timezone info
    String localDateString =
        dateString.replaceAll(RegExp(r'[+\-]\d{2}:\d{2}$'), '');
    final DateTime parsedDate = DateTime.parse(localDateString);
    final DateFormat formatter = DateFormat('dd.MM.yyyy HH:mm', 'pl_PL');
    return formatter.format(parsedDate);
  } catch (e) {
    return 'Błędna data';
  }
}
