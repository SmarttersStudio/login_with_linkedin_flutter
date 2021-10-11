import 'dart:async';
import 'dart:io';

///
/// Created By Guru (guru@smarttersstudio.com) on 27/06/20 3:46 PM
///
import 'package:flutter/material.dart';
import 'package:flutter_linkedin/data_model/auth_error_response.dart';
import 'package:flutter_linkedin/data_model/auth_success_response.dart';
import 'package:flutter_linkedin/helpers/authorization_helper.dart';
import 'package:webview_flutter/webview_flutter.dart';

class LinkedInWebView extends StatefulWidget {
  final String clientId, clientSecret, redirectUri;
  final bool destroySession;
  final PreferredSizeWidget? appBar;

  LinkedInWebView(
      {required this.clientId,
      required this.clientSecret,
      required this.redirectUri,
      this.destroySession = true,
      this.appBar});

  @override
  _LinkedInWebViewState createState() => _LinkedInWebViewState();
}

class _LinkedInWebViewState extends State<LinkedInWebView> {
  late WebViewController _webViewController;

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  void dispose() {
    if (widget.destroySession) _webViewController.clearCache();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
//    print(widget.destroySession);
    return Scaffold(
      appBar: widget.appBar,
      body: WebView(
        initialUrl: getAuthorizationUrl(
          clientId: widget.clientId,
          clientSecret: widget.clientSecret,
          redirectUri: widget.redirectUri,
        ),
        navigationDelegate: (NavigationRequest request) {
          if (request.url.startsWith(widget.redirectUri)) {
            Uri uri = Uri.parse(request.url);
            if (uri.queryParameters.containsKey('code')) {
              Navigator.pop(context,
                  AuthorizationSuccessResponse.fromJson(uri.queryParameters));
            } else if (uri.queryParameters.containsKey('error')) {
              Navigator.pop(context,
                  AuthorizationErrorResponse.fromJson(uri.queryParameters));
            } else {
              Navigator.pop(context);
            }
          }
          return NavigationDecision.navigate;
        },
        onWebViewCreated: (controller) {
          this._webViewController = controller;
        },
        // clearCookies: widget.destroySession,
        // scrollBar: true,
        // hidden: true,
      ),
    );
  }
}
