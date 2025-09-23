import 'dart:convert';
import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start AllegroConnect API Group Code

class AllegroConnectAPIGroup {
  static String getBaseUrl() => 'https://web-production-d213c.up.railway.app';
  static Map<String, String> headers = {};
  static GetSubscriptionCall getSubscriptionCall = GetSubscriptionCall();
  static GetAllegroAccountsCall getAllegroAccountsCall =
      GetAllegroAccountsCall();
  static UpdateUserProfileCall updateUserProfileCall = UpdateUserProfileCall();
  static GetProfileDataCall getProfileDataCall = GetProfileDataCall();
  static DeleteAllegroAccountCall deleteAllegroAccountCall =
      DeleteAllegroAccountCall();
  static GetAllegroAuthUrlCall getAllegroAuthUrlCall = GetAllegroAuthUrlCall();
  static GetOwnerCall getOwnerCall = GetOwnerCall();
  static DeleteAccountCall deleteAccountCall = DeleteAccountCall();
}

class GetSubscriptionCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    final baseUrl = AllegroConnectAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'getSubscription',
      apiUrl: '${baseUrl}/api/auth/me/subscription',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetAllegroAccountsCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    final baseUrl = AllegroConnectAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'getAllegroAccounts',
      apiUrl: '${baseUrl}/api/allegro/accounts',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${token}',
        'Content-Type': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateUserProfileCall {
  Future<ApiCallResponse> call({
    String? companyName = '',
    String? nip = '',
    String? address = '',
    String? phoneNumber = '',
    String? token = '',
    String? name = '',
  }) async {
    final baseUrl = AllegroConnectAPIGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "name": "${escapeStringForJson(name)}",  
  "company_name": "${escapeStringForJson(companyName)}",
  "nip": "${escapeStringForJson(nip)}",
  "address": "${escapeStringForJson(address)}",
  "phone_number": "${escapeStringForJson(phoneNumber)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'updateUserProfile',
      apiUrl: '${baseUrl}/api/me',
      callType: ApiCallType.PATCH,
      headers: {
        'Authorization': 'Bearer ${token}',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetProfileDataCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    final baseUrl = AllegroConnectAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'getProfileData',
      apiUrl: '${baseUrl}/api/me/profile-data',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${token}',
        'Content-Type': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DeleteAllegroAccountCall {
  Future<ApiCallResponse> call({
    int? accountId,
    String? token = '',
  }) async {
    final baseUrl = AllegroConnectAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'deleteAllegroAccount',
      apiUrl: '${baseUrl}/api/allegro/accounts/${accountId}',
      callType: ApiCallType.DELETE,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetAllegroAuthUrlCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    final baseUrl = AllegroConnectAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'getAllegroAuthUrl',
      apiUrl: '${baseUrl}/api/allegro/auth/url',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetOwnerCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    final baseUrl = AllegroConnectAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'getOwner',
      apiUrl: '${baseUrl}/api/me',
      callType: ApiCallType.GET,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DeleteAccountCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    final baseUrl = AllegroConnectAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'deleteAccount',
      apiUrl: '${baseUrl}/api/me',
      callType: ApiCallType.DELETE,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End AllegroConnect API Group Code

/// Start TeamConnectApi Group Code

class TeamConnectApiGroup {
  static String getBaseUrl({
    String? token = '',
  }) =>
      'https://web-production-d213c.up.railway.app/api';
  static Map<String, String> headers = {
    'Authorization': 'Bearer [token]',
  };
  static GetTeamMembersCall getTeamMembersCall = GetTeamMembersCall();
  static DeleteTeamMemberCall deleteTeamMemberCall = DeleteTeamMemberCall();
  static InviteTeamMemberCall inviteTeamMemberCall = InviteTeamMemberCall();
  static GetEmployeePermissionsCall getEmployeePermissionsCall =
      GetEmployeePermissionsCall();
  static RevokePermissionCall revokePermissionCall = RevokePermissionCall();
  static GrantPermissionCall grantPermissionCall = GrantPermissionCall();
}

class GetTeamMembersCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    final baseUrl = TeamConnectApiGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'getTeamMembers',
      apiUrl: '${baseUrl}/teams/members',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${token}',
        'Content-Type': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DeleteTeamMemberCall {
  Future<ApiCallResponse> call({
    int? memberId,
    String? token = '',
  }) async {
    final baseUrl = TeamConnectApiGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'deleteTeamMember',
      apiUrl: '${baseUrl}/teams/members/${memberId}',
      callType: ApiCallType.DELETE,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class InviteTeamMemberCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? name = '',
    String? token = '',
  }) async {
    final baseUrl = TeamConnectApiGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
  "email": "${escapeStringForJson(email)}",
  "name": "${escapeStringForJson(name)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'inviteTeamMember',
      apiUrl: '${baseUrl}/teams/invite',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetEmployeePermissionsCall {
  Future<ApiCallResponse> call({
    int? memberId,
    String? token = '',
  }) async {
    final baseUrl = TeamConnectApiGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'getEmployeePermissions',
      apiUrl: '${baseUrl}/teams/members/${memberId}/permissions',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class RevokePermissionCall {
  Future<ApiCallResponse> call({
    int? memberId,
    int? allegroAccountId,
    String? token = '',
  }) async {
    final baseUrl = TeamConnectApiGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'revokePermission',
      apiUrl:
          '${baseUrl}/teams/members/${memberId}/permissions/${allegroAccountId}',
      callType: ApiCallType.DELETE,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GrantPermissionCall {
  Future<ApiCallResponse> call({
    int? memberId,
    int? allegroAccountId,
    String? token = '',
  }) async {
    final baseUrl = TeamConnectApiGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
  "member_id": ${memberId},
  "allegro_account_id": ${allegroAccountId}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'grantPermission',
      apiUrl: '${baseUrl}/teams/permissions',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End TeamConnectApi Group Code

/// Start Paiment Group Code

class PaimentGroup {
  static String getBaseUrl({
    String? authToken = '',
  }) =>
      'https://web-production-d213c.up.railway.app/api';
  static Map<String, String> headers = {
    'Authorization': 'Bearer [authToken]',
    'Content-Type': 'application/json',
  };
  static CreateCheckoutSessionCall createCheckoutSessionCall =
      CreateCheckoutSessionCall();
  static CreateCustomerPortalCall createCustomerPortalCall =
      CreateCustomerPortalCall();
}

class CreateCheckoutSessionCall {
  Future<ApiCallResponse> call({
    String? planId = '',
    String? userId = '',
    String? authToken = '',
  }) async {
    final baseUrl = PaimentGroup.getBaseUrl(
      authToken: authToken,
    );

    final ffApiRequestBody = '''
{
  "plan_id": "${escapeStringForJson(planId)}",
  "user_id": "${escapeStringForJson(userId)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'createCheckoutSession',
      apiUrl: '${baseUrl}/payments/create-checkout-session',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${authToken}',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic checkoutUrl(dynamic response) => getJsonField(
        response,
        r'''$.data.checkoutUrl''',
      );
}

class CreateCustomerPortalCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
  }) async {
    final baseUrl = PaimentGroup.getBaseUrl(
      authToken: authToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'createCustomerPortal',
      apiUrl: '${baseUrl}/payments/create-portal-session',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${authToken}',
        'Content-Type': 'application/json',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Paiment Group Code

/// Start conversations Group Code

class ConversationsGroup {
  static String getBaseUrl({
    String? authToken = '',
  }) =>
      'https://web-production-d213c.up.railway.app/api';
  static Map<String, String> headers = {
    'Authorization': 'Bearer [authToken]',
    'Content-Type': 'application/json',
  };
  static GetSummaryCall getSummaryCall = GetSummaryCall();
  static GetAccountThreadsCall getAccountThreadsCall = GetAccountThreadsCall();
  static GetThreadMessagesCall getThreadMessagesCall = GetThreadMessagesCall();
  static PostMessageCall postMessageCall = PostMessageCall();
  static DeclareAttachmentCall declareAttachmentCall = DeclareAttachmentCall();
  static GetOrderDetailsCall getOrderDetailsCall = GetOrderDetailsCall();
  static GetOfferDetailsCall getOfferDetailsCall = GetOfferDetailsCall();
  static UploadFileToAllegroCall uploadFileToAllegroCall =
      UploadFileToAllegroCall();
}

class GetSummaryCall {
  Future<ApiCallResponse> call({
    String? authToken = '',
  }) async {
    final baseUrl = ConversationsGroup.getBaseUrl(
      authToken: authToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'getSummary',
      apiUrl: '${baseUrl}/allegro/summary',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${authToken}',
        'Content-Type': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetAccountThreadsCall {
  Future<ApiCallResponse> call({
    int? limit = 20,
    int? offset = 0,
    int? accountId,
    String? authToken = '',
  }) async {
    final baseUrl = ConversationsGroup.getBaseUrl(
      authToken: authToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'getAccountThreads',
      apiUrl: '${baseUrl}/allegro/${accountId}/threads',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${authToken}',
        'Content-Type': 'application/json',
      },
      params: {
        'offset': offset,
        'limit': limit,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetThreadMessagesCall {
  Future<ApiCallResponse> call({
    int? accountId,
    String? threadId = '',
    String? authToken = '',
  }) async {
    final baseUrl = ConversationsGroup.getBaseUrl(
      authToken: authToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'getThreadMessages',
      apiUrl: '${baseUrl}/allegro/${accountId}/threads/${threadId}/messages',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${authToken}',
        'Content-Type': 'application/json',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? messageList(dynamic response) => getJsonField(
        response,
        r'''$.data.messages''',
        true,
      ) as List?;
}

class PostMessageCall {
  Future<ApiCallResponse> call({
    int? accountId,
    String? threadId = '',
    String? messageText = '',
    String? attachmentId = '',
    String? authToken = '',
  }) async {
    final baseUrl = ConversationsGroup.getBaseUrl(
      authToken: authToken,
    );

    final ffApiRequestBody = '''
{
  "text": "${escapeStringForJson(messageText)}",
  "attachment_id": "${escapeStringForJson(attachmentId)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'postMessage',
      apiUrl: '${baseUrl}/allegro/${accountId}/threads/${threadId}/messages',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${authToken}',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DeclareAttachmentCall {
  Future<ApiCallResponse> call({
    int? accountId,
    String? fileName = '',
    int? fileSize,
    String? authToken = '',
  }) async {
    final baseUrl = ConversationsGroup.getBaseUrl(
      authToken: authToken,
    );

    final ffApiRequestBody = '''
{
  "filename": "${escapeStringForJson(fileName)}",
  "size": "${fileSize}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'declareAttachment',
      apiUrl: '${baseUrl}/allegro/${accountId}/attachments/declare',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${authToken}',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetOrderDetailsCall {
  Future<ApiCallResponse> call({
    String? orderId = '',
    String? allegroAccountId = '',
    String? authToken = '',
  }) async {
    final baseUrl = ConversationsGroup.getBaseUrl(
      authToken: authToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'getOrderDetails',
      apiUrl: '${baseUrl}/allegro/orders/${orderId}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${authToken}',
        'Content-Type': 'application/json',
      },
      params: {
        'allegro_account_id': allegroAccountId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetOfferDetailsCall {
  Future<ApiCallResponse> call({
    String? offerId = '',
    String? allegroAccountId = '',
    String? authToken = '',
  }) async {
    final baseUrl = ConversationsGroup.getBaseUrl(
      authToken: authToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'getOfferDetails',
      apiUrl: '${baseUrl}/allegro/offers/${offerId}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${authToken}',
        'Content-Type': 'application/json',
      },
      params: {
        'allegro_account_id': allegroAccountId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class UploadFileToAllegroCall {
  Future<ApiCallResponse> call({
    String? allegroAccountId = '',
    FFUploadedFile? file,
    String? authToken = '',
  }) async {
    final baseUrl = ConversationsGroup.getBaseUrl(
      authToken: authToken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'uploadFileToAllegro',
      apiUrl: '${baseUrl}/allegro/${allegroAccountId}/attachments/upload',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${authToken}',
        'Content-Type': 'application/json',
      },
      params: {
        'file': file,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End conversations Group Code

class UserSyncCallCall {
  static Future<ApiCallResponse> call({
    String? authToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'UserSyncCall',
      apiUrl: 'https://web-production-d213c.up.railway.app/api/auth/sync-user',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static dynamic accessToken(dynamic response) => getJsonField(
        response,
        r'''$.data.access_token''',
      );
}

class RegisterFCMTokenCall {
  static Future<ApiCallResponse> call({
    String? authToken = '',
    String? fcmToken = '',
  }) async {
    final ffApiRequestBody = '''
{
  "token": "${escapeStringForJson(fcmToken)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'registerFCMToken',
      apiUrl:
          'https://web-production-d213c.up.railway.app/api/auth/register-fcm-token',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${authToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
