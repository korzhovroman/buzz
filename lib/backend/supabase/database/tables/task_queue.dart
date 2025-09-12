import '../database.dart';

class TaskQueueTable extends SupabaseTable<TaskQueueRow> {
  @override
  String get tableName => 'task_queue';

  @override
  TaskQueueRow createRow(Map<String, dynamic> data) => TaskQueueRow(data);
}

class TaskQueueRow extends SupabaseDataRow {
  TaskQueueRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => TaskQueueTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  int get allegroAccountId => getField<int>('allegro_account_id')!;
  set allegroAccountId(int value) => setField<int>('allegro_account_id', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get processedAt => getField<DateTime>('processed_at');
  set processedAt(DateTime? value) => setField<DateTime>('processed_at', value);
}
