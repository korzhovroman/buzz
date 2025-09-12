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

String? getFileName(FFUploadedFile uploadedFile) {
  {
    return uploadedFile?.name ?? '';
  }
}

int getFileSize(FFUploadedFile uploadedFile) {
  return uploadedFile?.bytes?.length ?? 0;
}

dynamic getFirstMessage(List<dynamic> messagesList) {
  {
    // Returns the last item from the list, which is the first message chronologically.
    if (messagesList == null || messagesList.isEmpty) {
      return null;
    }
    return messagesList.last;
  }
}

String? getThreadContextType(List<dynamic>? messagesList) {
  {
    if (messagesList == null || messagesList.isEmpty) {
      return "NONE";
    }
    var firstMessage = messagesList.last;
    if (firstMessage['offer'] != null) {
      return "OFFER";
    }
    if (firstMessage['relatesTo'] != null &&
        firstMessage['relatesTo']['order'] != null) {
      return "ORDER";
    }
    return "NONE";
  }
}

bool isOfferChat(List<dynamic> messagesList) {
  {
    if (messagesList == null || messagesList.isEmpty) {
      return false;
    }
    // Берем самое первое сообщение (последний элемент в списке)
    var firstMessage = messagesList.last;
    // Проверяем, есть ли в нем информация об оферте ВНУТРИ relatesTo
    if (firstMessage['relatesTo'] != null &&
        firstMessage['relatesTo']['offer'] != null) {
      return true;
    }
    return false;
  }
}

bool isOrderChat(List<dynamic> messagesList) {
  {
    if (messagesList == null || messagesList.isEmpty) {
      return false;
    }
    // Берем самое первое сообщение
    var firstMessage = messagesList.last;
    // Проверяем, есть ли в нем информация о заказе
    if (firstMessage['relatesTo'] != null &&
        firstMessage['relatesTo']['order'] != null) {
      return true;
    }
    return false;
  }
}
