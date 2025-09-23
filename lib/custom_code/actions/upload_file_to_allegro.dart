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

// Custom Action: uploadFileToAllegro
// Inputs:
// - attachmentId (String)
// - authToken (String)
// - fileToUpload (FFUploadedFile)
// Return Type: bool

Future<bool> uploadFileToAllegro(
  String attachmentId,
  String authToken,
  FFUploadedFile fileToUpload,
) async {
  print('=== DEBUG START ===');
  print('attachmentId: "$attachmentId"');
  print('authToken length: ${authToken.length}');

  try {
    // Podstawowe sprawdzenia
    if (attachmentId.isEmpty) {
      print('ERROR: attachmentId is empty');
      return false;
    }

    if (fileToUpload.bytes == null || fileToUpload.bytes!.isEmpty) {
      print('ERROR: file is null or empty');
      return false;
    }

    final fileSize = fileToUpload.bytes!.length;
    final fileName = fileToUpload.name ?? 'file';

    print('fileName: "$fileName", size: $fileSize bytes');

    // Content-Type
    String contentType = 'application/octet-stream';
    final extension = fileName.toLowerCase();

    if (extension.endsWith('.png'))
      contentType = 'image/png';
    else if (extension.endsWith('.jpg') || extension.endsWith('.jpeg'))
      contentType = 'image/jpeg';
    else if (extension.endsWith('.pdf'))
      contentType = 'application/pdf';
    else if (extension.endsWith('.txt')) contentType = 'text/plain';

    print('Content-Type: $contentType');

    // HTTP PUT request
    final uri = Uri.parse(
        'https://api.allegro.pl/messaging/message-attachments/$attachmentId');
    print('URL: ${uri.toString()}');

    final response = await http
        .put(
          uri,
          headers: {
            'Authorization': 'Bearer $authToken',
            'Content-Type': contentType,
            'Content-Length': fileSize.toString(),
          },
          body: fileToUpload.bytes,
        )
        .timeout(Duration(seconds: 60));

    print('Response status: ${response.statusCode}');

    if (response.statusCode == 204) {
      print('SUCCESS: File uploaded');
      return true;
    } else {
      print('ERROR: Upload failed with status ${response.statusCode}');
      if (response.body.isNotEmpty) {
        print('Response body: ${response.body}');
      }
      return false;
    }
  } catch (e) {
    print('EXCEPTION: $e');
    return false;
  } finally {
    print('=== DEBUG END ===');
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
