///
/// Created By Guru (guru@smarttersstudio.com) on 27/06/20 3:46 PM
///
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_linkedin/linked_with_login/data_model/auth_error_response.dart';
import 'package:flutter_linkedin/linked_with_login/data_model/auth_success_response.dart';
import 'package:flutter_linkedin/linked_with_login/helpers/authorization_helper.dart';
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
  late WebViewController _controller;
  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  void dispose() {
    super.dispose();
    if (widget.destroySession) _controller.clearCache();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.appBar,
      body: WebView(
          onWebViewCreated: (WebViewController webViewController) {
            _controller = webViewController;
          },
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
          initialUrl: getAuthorizationUrl(
            clientId: widget.clientId,
            clientSecret: widget.clientSecret,
            redirectUri: widget.redirectUri,
          )),
    );
  }
}
