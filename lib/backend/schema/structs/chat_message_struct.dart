// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class ChatMessageStruct extends FFFirebaseStruct {
  ChatMessageStruct({
    String? id,
    String? status,
    String? type,
    String? createdAt,
    String? autor,
    String? text,
    String? attachmentsURL,
    String? attachmentsNAME,
    bool? isInterlocutorlogin,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _status = status,
        _type = type,
        _createdAt = createdAt,
        _autor = autor,
        _text = text,
        _attachmentsURL = attachmentsURL,
        _attachmentsNAME = attachmentsNAME,
        _isInterlocutorlogin = isInterlocutorlogin,
        super(firestoreUtilData);

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  set status(String? val) => _status = val;

  bool hasStatus() => _status != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  set type(String? val) => _type = val;

  bool hasType() => _type != null;

  // "createdAt" field.
  String? _createdAt;
  String get createdAt => _createdAt ?? '';
  set createdAt(String? val) => _createdAt = val;

  bool hasCreatedAt() => _createdAt != null;

  // "autor" field.
  String? _autor;
  String get autor => _autor ?? '';
  set autor(String? val) => _autor = val;

  bool hasAutor() => _autor != null;

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  set text(String? val) => _text = val;

  bool hasText() => _text != null;

  // "attachmentsURL" field.
  String? _attachmentsURL;
  String get attachmentsURL => _attachmentsURL ?? '';
  set attachmentsURL(String? val) => _attachmentsURL = val;

  bool hasAttachmentsURL() => _attachmentsURL != null;

  // "attachmentsNAME" field.
  String? _attachmentsNAME;
  String get attachmentsNAME => _attachmentsNAME ?? '';
  set attachmentsNAME(String? val) => _attachmentsNAME = val;

  bool hasAttachmentsNAME() => _attachmentsNAME != null;

  // "isInterlocutorlogin" field.
  bool? _isInterlocutorlogin;
  bool get isInterlocutorlogin => _isInterlocutorlogin ?? false;
  set isInterlocutorlogin(bool? val) => _isInterlocutorlogin = val;

  bool hasIsInterlocutorlogin() => _isInterlocutorlogin != null;

  static ChatMessageStruct fromMap(Map<String, dynamic> data) =>
      ChatMessageStruct(
        id: data['id'] as String?,
        status: data['status'] as String?,
        type: data['type'] as String?,
        createdAt: data['createdAt'] as String?,
        autor: data['autor'] as String?,
        text: data['text'] as String?,
        attachmentsURL: data['attachmentsURL'] as String?,
        attachmentsNAME: data['attachmentsNAME'] as String?,
        isInterlocutorlogin: data['isInterlocutorlogin'] as bool?,
      );

  static ChatMessageStruct? maybeFromMap(dynamic data) => data is Map
      ? ChatMessageStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'status': _status,
        'type': _type,
        'createdAt': _createdAt,
        'autor': _autor,
        'text': _text,
        'attachmentsURL': _attachmentsURL,
        'attachmentsNAME': _attachmentsNAME,
        'isInterlocutorlogin': _isInterlocutorlogin,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'status': serializeParam(
          _status,
          ParamType.String,
        ),
        'type': serializeParam(
          _type,
          ParamType.String,
        ),
        'createdAt': serializeParam(
          _createdAt,
          ParamType.String,
        ),
        'autor': serializeParam(
          _autor,
          ParamType.String,
        ),
        'text': serializeParam(
          _text,
          ParamType.String,
        ),
        'attachmentsURL': serializeParam(
          _attachmentsURL,
          ParamType.String,
        ),
        'attachmentsNAME': serializeParam(
          _attachmentsNAME,
          ParamType.String,
        ),
        'isInterlocutorlogin': serializeParam(
          _isInterlocutorlogin,
          ParamType.bool,
        ),
      }.withoutNulls;

  static ChatMessageStruct fromSerializableMap(Map<String, dynamic> data) =>
      ChatMessageStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        status: deserializeParam(
          data['status'],
          ParamType.String,
          false,
        ),
        type: deserializeParam(
          data['type'],
          ParamType.String,
          false,
        ),
        createdAt: deserializeParam(
          data['createdAt'],
          ParamType.String,
          false,
        ),
        autor: deserializeParam(
          data['autor'],
          ParamType.String,
          false,
        ),
        text: deserializeParam(
          data['text'],
          ParamType.String,
          false,
        ),
        attachmentsURL: deserializeParam(
          data['attachmentsURL'],
          ParamType.String,
          false,
        ),
        attachmentsNAME: deserializeParam(
          data['attachmentsNAME'],
          ParamType.String,
          false,
        ),
        isInterlocutorlogin: deserializeParam(
          data['isInterlocutorlogin'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'ChatMessageStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ChatMessageStruct &&
        id == other.id &&
        status == other.status &&
        type == other.type &&
        createdAt == other.createdAt &&
        autor == other.autor &&
        text == other.text &&
        attachmentsURL == other.attachmentsURL &&
        attachmentsNAME == other.attachmentsNAME &&
        isInterlocutorlogin == other.isInterlocutorlogin;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        status,
        type,
        createdAt,
        autor,
        text,
        attachmentsURL,
        attachmentsNAME,
        isInterlocutorlogin
      ]);
}

ChatMessageStruct createChatMessageStruct({
  String? id,
  String? status,
  String? type,
  String? createdAt,
  String? autor,
  String? text,
  String? attachmentsURL,
  String? attachmentsNAME,
  bool? isInterlocutorlogin,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ChatMessageStruct(
      id: id,
      status: status,
      type: type,
      createdAt: createdAt,
      autor: autor,
      text: text,
      attachmentsURL: attachmentsURL,
      attachmentsNAME: attachmentsNAME,
      isInterlocutorlogin: isInterlocutorlogin,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ChatMessageStruct? updateChatMessageStruct(
  ChatMessageStruct? chatMessage, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    chatMessage
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addChatMessageStructData(
  Map<String, dynamic> firestoreData,
  ChatMessageStruct? chatMessage,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (chatMessage == null) {
    return;
  }
  if (chatMessage.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && chatMessage.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final chatMessageData =
      getChatMessageFirestoreData(chatMessage, forFieldValue);
  final nestedData =
      chatMessageData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = chatMessage.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getChatMessageFirestoreData(
  ChatMessageStruct? chatMessage, [
  bool forFieldValue = false,
]) {
  if (chatMessage == null) {
    return {};
  }
  final firestoreData = mapToFirestore(chatMessage.toMap());

  // Add any Firestore field values
  chatMessage.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getChatMessageListFirestoreData(
  List<ChatMessageStruct>? chatMessages,
) =>
    chatMessages?.map((e) => getChatMessageFirestoreData(e, true)).toList() ??
    [];
