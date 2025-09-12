import '../database.dart';

class AllegroAccountsTable extends SupabaseTable<AllegroAccountsRow> {
  @override
  String get tableName => 'allegro_accounts';

  @override
  AllegroAccountsRow createRow(Map<String, dynamic> data) =>
      AllegroAccountsRow(data);
}

class AllegroAccountsRow extends SupabaseDataRow {
  AllegroAccountsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AllegroAccountsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  int get ownerId => getField<int>('owner_id')!;
  set ownerId(int value) => setField<int>('owner_id', value);

  String get allegroUserId => getField<String>('allegro_user_id')!;
  set allegroUserId(String value) => setField<String>('allegro_user_id', value);

  String get allegroLogin => getField<String>('allegro_login')!;
  set allegroLogin(String value) => setField<String>('allegro_login', value);

  String get accessToken => getField<String>('access_token')!;
  set accessToken(String value) => setField<String>('access_token', value);

  String get refreshToken => getField<String>('refresh_token')!;
  set refreshToken(String value) => setField<String>('refresh_token', value);

  DateTime get expiresAt => getField<DateTime>('expires_at')!;
  set expiresAt(DateTime value) => setField<DateTime>('expires_at', value);

  bool? get autoReplyEnabled => getField<bool>('auto_reply_enabled');
  set autoReplyEnabled(bool? value) =>
      setField<bool>('auto_reply_enabled', value);

  String? get autoReplyText => getField<String>('auto_reply_text');
  set autoReplyText(String? value) =>
      setField<String>('auto_reply_text', value);
}
