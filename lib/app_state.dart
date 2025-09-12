import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    secureStorage = FlutterSecureStorage();
    await _safeInitAsync(() async {
      _authToken = await secureStorage.getString('ff_authToken') ?? _authToken;
    });
    await _safeInitAsync(() async {
      _subscriptionStatus =
          await secureStorage.getString('ff_subscriptionStatus') ??
              _subscriptionStatus;
    });
    await _safeInitAsync(() async {
      _usedAccounts =
          await secureStorage.getInt('ff_usedAccounts') ?? _usedAccounts;
    });
    await _safeInitAsync(() async {
      _accountLimit =
          await secureStorage.getInt('ff_accountLimit') ?? _accountLimit;
    });
    await _safeInitAsync(() async {
      if (await secureStorage.read(key: 'ff_allegroAccounts') != null) {
        try {
          _allegroAccounts = jsonDecode(
              await secureStorage.getString('ff_allegroAccounts') ?? '');
        } catch (e) {
          print("Can't decode persisted json. Error: $e.");
        }
      }
    });
    await _safeInitAsync(() async {
      _teamMembers =
          (await secureStorage.getStringList('ff_teamMembers'))?.map((x) {
                try {
                  return jsonDecode(x);
                } catch (e) {
                  print("Can't decode persisted json. Error: $e.");
                  return {};
                }
              }).toList() ??
              _teamMembers;
    });
    await _safeInitAsync(() async {
      _name = await secureStorage.getString('ff_name') ?? _name;
    });
    await _safeInitAsync(() async {
      _namefirmy = await secureStorage.getString('ff_namefirmy') ?? _namefirmy;
    });
    await _safeInitAsync(() async {
      _adresfirmy =
          await secureStorage.getString('ff_adresfirmy') ?? _adresfirmy;
    });
    await _safeInitAsync(() async {
      _nip = await secureStorage.getString('ff_nip') ?? _nip;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  String _authToken = '';
  String get authToken => _authToken;
  set authToken(String value) {
    _authToken = value;
    secureStorage.setString('ff_authToken', value);
  }

  void deleteAuthToken() {
    secureStorage.delete(key: 'ff_authToken');
  }

  String _fcmtoken = '';
  String get fcmtoken => _fcmtoken;
  set fcmtoken(String value) {
    _fcmtoken = value;
  }

  String _subscriptionStatus = '';
  String get subscriptionStatus => _subscriptionStatus;
  set subscriptionStatus(String value) {
    _subscriptionStatus = value;
    secureStorage.setString('ff_subscriptionStatus', value);
  }

  void deleteSubscriptionStatus() {
    secureStorage.delete(key: 'ff_subscriptionStatus');
  }

  int _usedAccounts = 0;
  int get usedAccounts => _usedAccounts;
  set usedAccounts(int value) {
    _usedAccounts = value;
    secureStorage.setInt('ff_usedAccounts', value);
  }

  void deleteUsedAccounts() {
    secureStorage.delete(key: 'ff_usedAccounts');
  }

  int _accountLimit = 0;
  int get accountLimit => _accountLimit;
  set accountLimit(int value) {
    _accountLimit = value;
    secureStorage.setInt('ff_accountLimit', value);
  }

  void deleteAccountLimit() {
    secureStorage.delete(key: 'ff_accountLimit');
  }

  dynamic _allegroAccounts;
  dynamic get allegroAccounts => _allegroAccounts;
  set allegroAccounts(dynamic value) {
    _allegroAccounts = value;
    secureStorage.setString('ff_allegroAccounts', jsonEncode(value));
  }

  void deleteAllegroAccounts() {
    secureStorage.delete(key: 'ff_allegroAccounts');
  }

  String _subscriptionEndsAt = '';
  String get subscriptionEndsAt => _subscriptionEndsAt;
  set subscriptionEndsAt(String value) {
    _subscriptionEndsAt = value;
  }

  List<dynamic> _teamMembers = [];
  List<dynamic> get teamMembers => _teamMembers;
  set teamMembers(List<dynamic> value) {
    _teamMembers = value;
    secureStorage.setStringList(
        'ff_teamMembers', value.map((x) => jsonEncode(x)).toList());
  }

  void deleteTeamMembers() {
    secureStorage.delete(key: 'ff_teamMembers');
  }

  void addToTeamMembers(dynamic value) {
    teamMembers.add(value);
    secureStorage.setStringList(
        'ff_teamMembers', _teamMembers.map((x) => jsonEncode(x)).toList());
  }

  void removeFromTeamMembers(dynamic value) {
    teamMembers.remove(value);
    secureStorage.setStringList(
        'ff_teamMembers', _teamMembers.map((x) => jsonEncode(x)).toList());
  }

  void removeAtIndexFromTeamMembers(int index) {
    teamMembers.removeAt(index);
    secureStorage.setStringList(
        'ff_teamMembers', _teamMembers.map((x) => jsonEncode(x)).toList());
  }

  void updateTeamMembersAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    teamMembers[index] = updateFn(_teamMembers[index]);
    secureStorage.setStringList(
        'ff_teamMembers', _teamMembers.map((x) => jsonEncode(x)).toList());
  }

  void insertAtIndexInTeamMembers(int index, dynamic value) {
    teamMembers.insert(index, value);
    secureStorage.setStringList(
        'ff_teamMembers', _teamMembers.map((x) => jsonEncode(x)).toList());
  }

  bool _isOwner = false;
  bool get isOwner => _isOwner;
  set isOwner(bool value) {
    _isOwner = value;
  }

  String _name = '';
  String get name => _name;
  set name(String value) {
    _name = value;
    secureStorage.setString('ff_name', value);
  }

  void deleteName() {
    secureStorage.delete(key: 'ff_name');
  }

  String _namefirmy = '';
  String get namefirmy => _namefirmy;
  set namefirmy(String value) {
    _namefirmy = value;
    secureStorage.setString('ff_namefirmy', value);
  }

  void deleteNamefirmy() {
    secureStorage.delete(key: 'ff_namefirmy');
  }

  String _adresfirmy = '';
  String get adresfirmy => _adresfirmy;
  set adresfirmy(String value) {
    _adresfirmy = value;
    secureStorage.setString('ff_adresfirmy', value);
  }

  void deleteAdresfirmy() {
    secureStorage.delete(key: 'ff_adresfirmy');
  }

  String _nip = '';
  String get nip => _nip;
  set nip(String value) {
    _nip = value;
    secureStorage.setString('ff_nip', value);
  }

  void deleteNip() {
    secureStorage.delete(key: 'ff_nip');
  }

  String _telefon = '';
  String get telefon => _telefon;
  set telefon(String value) {
    _telefon = value;
  }

  bool _issubscriptionactive = false;
  bool get issubscriptionactive => _issubscriptionactive;
  set issubscriptionactive(bool value) {
    _issubscriptionactive = value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: ListToCsvConverter().convert([value]));
}
