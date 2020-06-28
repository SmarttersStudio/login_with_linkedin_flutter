import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_linkedin/config/api_routes.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_linkedin/data_model/auth_error_response.dart';

///
/// Created By Guru (guru@smarttersstudio.com) on 27/06/20 3:39 PM
///

String getAccessTokenUrl({
  @required String clientId,
  @required String clientSecret,
  @required String redirectUri,
  @required String code,
  String grantType = 'authorization_code',
}) {
  return '$linkedInAccessTokenUrl?'
      'client_id=$clientId&'
      'client_secret=$clientSecret&'
      'grant_type=$grantType&'
      'code=$code&'
      'redirect_uri=$redirectUri';
}

Future<String> getAccessToken({
  @required String clientId,
  @required String clientSecret,
  @required String redirectUri,
  @required String code,
  String grantType = 'code',
}) async {
  final response = await http.get(getAccessTokenUrl(
      clientId: clientId,
      clientSecret: clientSecret,
      redirectUri: redirectUri,
      code: code));

  if (response.statusCode == 200)
    return (json.decode(response.body))['access_token'];
  else
    throw new AuthorizationErrorResponse(
        error: LinkedInAuthErrorType.other,
        errorDescription: json.decode(response.body)['error_description']);
}
