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

import 'dart:html' as html;
import 'dart:convert';

Future<void> triggerBrowserDownload(
  String? base64Data,
  String? fileName,
  String? contentType,
) async {
  if (base64Data == null || fileName == null || contentType == null) {
    return;
  }
  final anchor =
      html.AnchorElement(href: 'data:$contentType;base64,$base64Data')
        ..setAttribute('download', fileName)
        ..style.display = 'none';

  if (html.document.body != null) {
    html.document.body!.children.add(anchor);
    anchor.click();
    html.document.body!.children.remove(anchor);
  } else {
    print('Ошибка: документ или тело документа недоступны');
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
