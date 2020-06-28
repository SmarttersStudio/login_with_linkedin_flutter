library flutter_linkedin;

import 'package:flutter/material.dart';
import 'package:flutter_linkedin/data_model/auth_error_response.dart';
import 'package:flutter_linkedin/data_model/auth_success_response.dart';
import 'package:flutter_linkedin/data_model/email_response.dart';
import 'package:flutter_linkedin/data_model/profile_response.dart';
import 'package:flutter_linkedin/helpers/access_token_helper.dart';
import 'package:flutter_linkedin/helpers/email_helper.dart';
import 'package:flutter_linkedin/helpers/profile_helper.dart';
import 'package:flutter_linkedin/widgets/linked_in_web_view.dart';

///
/// Created By Guru (guru@smarttersstudio.com) on 27/06/20 3:47 PM
///
class LinkedInLogin {
  static final LinkedInLogin _inst = LinkedInLogin._();

//  LinkedInLogin._internal();
  LinkedInLogin._();
  static void initialize(BuildContext context,
      {@required String clientId,
      @required String clientSecret,
      @required String redirectUri,
      String accessToken}) {
    _inst.context = context;
    _inst.clientId = clientId;
    _inst.clientSecret = clientSecret;
    _inst.redirectUri = redirectUri;
    _inst.accessToken = accessToken;
  }

  /// Client id from LinkedIn to do something that I don't know.
  String clientId;

  /// Secret of your LinkedIn project that will be used by public users
  String clientSecret;

  /// If your authentication is success, then you will be redirected to a web page.
  /// But as we are Smarrters' we will pop out before you enter the web page.
  String redirectUri;

  /// Context is used for showDialog where we will show you a WebView
  BuildContext context;

  /// If you are more Smart than us and you have already an access token,
  /// then you can provide to authenticate or validate.
  /// Some dumbAss may not know that access token has a expiry
  String accessToken;

  static Future<String> loginForAccessToken(
      {PreferredSizeWidget appBar, bool destroySession = true}) {
    _checkInst();
    return _inst._loginForAccessToken(
        appBar: appBar, destroySession: destroySession);
  }

  static void _checkInst() {
    if (_inst == null)
      throw AuthorizationErrorResponse(
          errorDescription: 'You must call the initialize() first');
  }

  Future<String> _loginForAccessToken(
      {PreferredSizeWidget appBar, bool destroySession = true}) async {
    final authorizationData = await showDialog(
        context: context,
        child: LinkedInWebView(
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
              code: authorizationData.code)
          .catchError((error) {
        if (error is AuthorizationErrorResponse)
          throw error;
        else
          throw AuthorizationErrorResponse(errorDescription: error.toString());
      });
      return accessToken;
    } else {
      throw (authorizationData as AuthorizationErrorResponse);
    }
  }

  static Future<LinkedInProfile> getProfile(
      {PreferredSizeWidget appBar,
      bool destroySession = true,
      bool forceLogin = false}) async {
    _checkInst();
    return _inst._getProfile(
        destroySession: destroySession, forceLogin: forceLogin);
  }

  Future<LinkedInProfile> _getProfile(
      {PreferredSizeWidget appBar,
      bool destroySession = true,
      bool forceLogin = false}) async {
    if (accessToken == null || forceLogin)
      await loginForAccessToken(destroySession: destroySession, appBar: appBar);
    return await getProfileResponse(accessToken: accessToken)
        .catchError((error) {
      if (error is AuthorizationErrorResponse)
        throw error;
      else
        throw AuthorizationErrorResponse(errorDescription: error.toString());
    });
  }

  static Future<LinkedInEmail> getEmail(
      {PreferredSizeWidget appBar,
      bool destroySession = true,
      bool forceLogin = false}) {
    _checkInst();
    return _inst._getEmail(
        destroySession: destroySession, forceLogin: forceLogin);
  }

  Future<LinkedInEmail> _getEmail(
      {PreferredSizeWidget appBar,
      bool destroySession = true,
      bool forceLogin = false}) async {
    if (accessToken == null || forceLogin)
      await loginForAccessToken(destroySession: destroySession, appBar: appBar);
    return await getEmailResponse(accessToken: accessToken).catchError((error) {
      if (error is AuthorizationErrorResponse)
        throw error;
      else
        throw AuthorizationErrorResponse(errorDescription: error.toString());
    });
  }
}
