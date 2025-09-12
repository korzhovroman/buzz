import '../database.dart';

class UsersTable extends SupabaseTable<UsersRow> {
  @override
  String get tableName => 'users';

  @override
  UsersRow createRow(Map<String, dynamic> data) => UsersRow(data);
}

class UsersRow extends SupabaseDataRow {
  UsersRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UsersTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String get email => getField<String>('email')!;
  set email(String value) => setField<String>('email', value);

  String get hashedPassword => getField<String>('hashed_password')!;
  set hashedPassword(String value) =>
      setField<String>('hashed_password', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get supabaseUserId => getField<String>('supabase_user_id');
  set supabaseUserId(String? value) =>
      setField<String>('supabase_user_id', value);

  String get subscriptionStatus => getField<String>('subscription_status')!;
  set subscriptionStatus(String value) =>
      setField<String>('subscription_status', value);

  DateTime? get subscriptionEndsAt =>
      getField<DateTime>('subscription_ends_at');
  set subscriptionEndsAt(DateTime? value) =>
      setField<DateTime>('subscription_ends_at', value);

  String? get fcmToken => getField<String>('fcm_token');
  set fcmToken(String? value) => setField<String>('fcm_token', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get companyName => getField<String>('company_name');
  set companyName(String? value) => setField<String>('company_name', value);

  String? get nip => getField<String>('nip');
  set nip(String? value) => setField<String>('nip', value);

  String? get address => getField<String>('address');
  set address(String? value) => setField<String>('address', value);

  String? get phoneNumber => getField<String>('phone_number');
  set phoneNumber(String? value) => setField<String>('phone_number', value);
}
