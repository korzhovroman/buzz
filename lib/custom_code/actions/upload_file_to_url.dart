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

import 'dart:io';
import 'package:http/http.dart' as http;

Future<void> uploadFileToUrl(
  String uploadUrl,
  String authToken,
  FFUploadedFile fileToUpload,
) async {
  // Проверяем, что байты файла не пустые
  if (fileToUpload.bytes == null) {
    print('File bytes are null, cannot upload.');
    return;
  }

  try {
    final uri = Uri.parse(uploadUrl);
    final response = await http.put(
      uri,
      headers: {
        // Allegro не требует 'Authorization' для этого запроса
        'Content-Type': 'application/octet-stream',
      },
      body: fileToUpload.bytes,
    );

    // Проверяем статус ответа
    if (response.statusCode >= 200 && response.statusCode < 300) {
      print('File uploaded successfully. Status code: ${response.statusCode}');
    } else {
      print('Failed to upload file. Status code: ${response.statusCode}');
      print('Response body: ${response.body}');
    }
  } catch (e) {
    print('An error occurred while uploading the file: $e');
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
