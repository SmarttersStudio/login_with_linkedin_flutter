import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_linkedin/linkedloginflutter.dart';
import 'profile_dialog.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter LinkedIn login'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String accessToken, email, firstName, lastName, avatar;

  final String redirectUrl = 'https://app.carde.de';
  final String clientId = '78el5r2y1dwp4j';
  final String clientSecret = 'RnyXiCNz3cahNx1g';

  @override
  void initState() {
    super.initState();
    LinkedInLogin.initialize(context,
        clientId: clientId,
        clientSecret: clientSecret,
        redirectUri: redirectUrl);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Spacer(),
        ProfileInfo(
            avatar: avatar,
            accessToken: accessToken,
            email: email,
            firstName: firstName,
            lastName: lastName),
        Spacer(),
        RaisedButton(
          onPressed: () {
            LinkedInLogin.loginForAccessToken(
                destroySession: false,
                appBar: AppBar(
                  title: Text('Demo Login Page'),
                )).then((token) {
              setState(() {
                accessToken = token;
              });
            }).catchError((error) {
              print(error.errorDescription);
            });
          },
          child: Text('Get AccessToken'),
        ),
        RaisedButton(
          onPressed: () {
            LinkedInLogin.getProfile(
                destroySession: false,
                forceLogin: false,
                appBar: AppBar(
                  title: Text('Demo Login Page'),
                )).then((profile) {
              setState(() {
                firstName = profile.firstName.localized.enUs;
                lastName = profile.lastName.localized.enUs;
                avatar = profile.profilePicture.profilePictureDisplayImage
                    .elements.first.identifiers.first.identifier;
              });
            }).catchError((error) {
              print(error.errorDescription);
            });
          },
          child: Text('Get Profile'),
        ),
        RaisedButton(
          onPressed: () {
            LinkedInLogin.getEmail(
                destroySession: false,
                forceLogin: false,
                appBar: AppBar(
                  title: Text('Demo Login Page'),
                )).then((value) {
              setState(() {
                email = value.elements.first.elementHandle.emailAddress;
              });
            }).catchError((error) {
              print(error.errorDescription);
            });
          },
          child: Text('Get Email'),
        ),
        Spacer(),
      ]),
    );
  }
}
