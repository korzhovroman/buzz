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

import 'package:supabase_flutter/supabase_flutter.dart';

Future<String?> authCreateAccountWithPolishErrors(
  String email,
  String password,
  String confirmPassword,
) async {
  if (password != confirmPassword) {
    return 'Hasła nie są takie same.';
  }

  final supabase = Supabase.instance.client;
  try {
    await supabase.auth.signUp(
      email: email,
      password: password,
    );
    // Успех! Возвращаем null (нет ошибки)
    return null;
  } on AuthException catch (e) {
    // Неудача, возвращаем переведенную ошибку
    if (e.message.contains('User already registered')) {
      // <-- ИСПРАВЛЕНО
      return 'Ten adres e-mail jest już zajęty przez inne konto.';
    }
    if (e.message
        .contains('Password should contain at least one character of each')) {
      return 'Hasło musi zawierać wielkie i małe litery, cyfry oraz znaki specjalne.';
    }
    if (e.message.contains('password is weak')) {
      return 'Hasło jest zbyt słabe. Użyj silniejszego hasła.';
    }
    return e.message;
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
