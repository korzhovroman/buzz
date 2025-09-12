import '../database.dart';

class MessageMetadataTable extends SupabaseTable<MessageMetadataRow> {
  @override
  String get tableName => 'message_metadata';

  @override
  MessageMetadataRow createRow(Map<String, dynamic> data) =>
      MessageMetadataRow(data);
}

class MessageMetadataRow extends SupabaseDataRow {
  MessageMetadataRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => MessageMetadataTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String get allegroMessageId => getField<String>('allegro_message_id')!;
  set allegroMessageId(String value) =>
      setField<String>('allegro_message_id', value);

  String get threadId => getField<String>('thread_id')!;
  set threadId(String value) => setField<String>('thread_id', value);

  int? get sentByUserId => getField<int>('sent_by_user_id');
  set sentByUserId(int? value) => setField<int>('sent_by_user_id', value);

  DateTime? get sentAt => getField<DateTime>('sent_at');
  set sentAt(DateTime? value) => setField<DateTime>('sent_at', value);
}
