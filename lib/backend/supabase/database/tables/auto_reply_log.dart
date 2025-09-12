import '../database.dart';

class AutoReplyLogTable extends SupabaseTable<AutoReplyLogRow> {
  @override
  String get tableName => 'auto_reply_log';

  @override
  AutoReplyLogRow createRow(Map<String, dynamic> data) => AutoReplyLogRow(data);
}

class AutoReplyLogRow extends SupabaseDataRow {
  AutoReplyLogRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AutoReplyLogTable();

  String get conversationId => getField<String>('conversation_id')!;
  set conversationId(String value) =>
      setField<String>('conversation_id', value);

  int get allegroAccountId => getField<int>('allegro_account_id')!;
  set allegroAccountId(int value) => setField<int>('allegro_account_id', value);

  DateTime? get replyTime => getField<DateTime>('reply_time');
  set replyTime(DateTime? value) => setField<DateTime>('reply_time', value);
}
