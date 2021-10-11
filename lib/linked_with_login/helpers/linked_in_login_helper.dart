import 'package:flutter/material.dart';
import 'package:flutter_linkedin/linked_with_login/data_model/auth_error_response.dart';
import 'package:flutter_linkedin/linked_with_login/data_model/auth_success_response.dart';
import 'package:flutter_linkedin/linked_with_login/data_model/email_response.dart';
import 'package:flutter_linkedin/linked_with_login/data_model/profile_response.dart';
import 'package:flutter_linkedin/linked_with_login/helpers/access_token_helper.dart';
import 'package:flutter_linkedin/linked_with_login/helpers/email_helper.dart';
import 'package:flutter_linkedin/linked_with_login/helpers/profile_helper.dart';
import 'package:flutter_linkedin/linked_with_login/widgets/linked_in_web_view.dart';

///
/// Created By Guru (guru@smarttersstudio.com) on 27/06/20 3:47 PM
///
class LinkedInLogin {
  final String clientId, clientSecret, redirectUri;
  final BuildContext context;
  String? accessToken;

  LinkedInLogin(this.context,
      {required this.clientId,
      required this.clientSecret,
      required this.redirectUri,
      this.accessToken});
  Future<String> loginForAccessToken(
      {PreferredSizeWidget? appBar, bool destroySession = true}) async {
    final authorizationData = await showDialog(
        context: context,
        builder: (context) => LinkedInWebView(
              clientId: clientId,
              clientSecret: clientSecret,
              redirectUri: redirectUri,
              destroySession: destroySession,
            )).catchError((error) {
      if (error is AuthorizationErrorResponse)
        throw error;
      else
        throw AuthorizationErrorResponse(errorDescription: error.toString());
    });
    if (authorizationData == null)
      throw AuthorizationErrorResponse(errorDescription: 'unknown error');
    if (authorizationData is AuthorizationSuccessResponse) {
      accessToken = await getAccessToken(
              clientId: clientId,
              clientSecret: clientSecret,
              redirectUri: redirectUri,
              code: authorizationData.code!)
          .catchError((error) {
        if (error is AuthorizationErrorResponse)
          throw error;
        else
          throw AuthorizationErrorResponse(errorDescription: error.toString());
      });
      return accessToken!;
    } else {
      throw (authorizationData as AuthorizationErrorResponse);
    }
  }

  Future<LinkedInProfile> getProfile(
      {PreferredSizeWidget? appBar,
      bool destroySession = true,
      bool forceLogin = false}) async {
    if (accessToken == null || forceLogin)
      await loginForAccessToken(destroySession: destroySession, appBar: appBar);
    return await getProfileResponse(accessToken: accessToken!)
        .catchError((error) {
      if (error is AuthorizationErrorResponse)
        throw error;
      else
        throw AuthorizationErrorResponse(errorDescription: error.toString());
    });
  }

  Future<LinkedInEmail> getEmail(
      {PreferredSizeWidget? appBar,
      bool destroySession = true,
      bool forceLogin = false}) async {
    if (accessToken == null || forceLogin)
      await loginForAccessToken(destroySession: destroySession, appBar: appBar);
    return await getEmailResponse(accessToken: accessToken!)
        .catchError((error) {
      if (error is AuthorizationErrorResponse)
        throw error;
      else
        throw AuthorizationErrorResponse(errorDescription: error.toString());
    });
  }
}
