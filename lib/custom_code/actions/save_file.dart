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

import 'dart:typed_data';
import 'package:file_saver/file_saver.dart';

Future saveFile(
  List<int> fileBytes,
  String fileName,
  String mimeType,
) async {
  print('File bytes length: ${fileBytes.length}');

  if (fileBytes.isEmpty) {
    print('Error: File bytes are empty!');
    return;
  }

  try {
    // Конвертируем List<int> в Uint8List для FileSaver
    Uint8List bytes = Uint8List.fromList(fileBytes);

    String extension = fileName.split('.').last;

    await FileSaver.instance.saveFile(
      name: fileName.replaceAll('.$extension', ''),
      bytes: bytes, // Используем конвертированные данные
      ext: extension,
      mimeType: MimeType.values.firstWhere(
        (e) => e.type == mimeType,
        orElse: () => MimeType.other,
      ),
    );

    print('File saved successfully!');
  } catch (e) {
    print('Error saving file: $e');
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
