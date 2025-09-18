// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:supabase_flutter/supabase_flutter.dart';

Future<String> authLoginWithPolishErrors(
  String email,
  String password,
) async {
  final supabase = Supabase.instance.client;
  try {
    await supabase.auth.signInWithPassword(
      email: email,
      password: password,
    );
    // В случае успеха, возвращаем пустою строку
    return '';
  } on AuthException catch (e) {
    // В случае ошибки, возвращаем переведенное сообщение
    if (e.message.contains('Invalid login credentials')) {
      return 'Nieprawidłowy e-mail lub hasło.';
    }
    return e.message; // Оригинальная ошибка
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
