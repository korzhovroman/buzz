import '../database.dart';

class EmployeePermissionsTable extends SupabaseTable<EmployeePermissionsRow> {
  @override
  String get tableName => 'employee_permissions';

  @override
  EmployeePermissionsRow createRow(Map<String, dynamic> data) =>
      EmployeePermissionsRow(data);
}

class EmployeePermissionsRow extends SupabaseDataRow {
  EmployeePermissionsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => EmployeePermissionsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  int get memberId => getField<int>('member_id')!;
  set memberId(int value) => setField<int>('member_id', value);

  int get allegroAccountId => getField<int>('allegro_account_id')!;
  set allegroAccountId(int value) => setField<int>('allegro_account_id', value);
}
