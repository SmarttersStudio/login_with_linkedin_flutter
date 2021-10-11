import 'package:flutter/material.dart';
import 'package:flutter_linkedin/linked_with_login/helpers/linked_in_login_helper.dart';

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
            home: MyHomePage(title: 'Flutter Demo Home Page'),
        );
    }
}

class MyHomePage extends StatefulWidget {
    MyHomePage({Key? key, this.title=""}) : super(key: key);
    
    final String title;
    
    @override
    _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
    final String redirectUrl = 'https://app.carde.de';
    final String clientId = '78el5r2y1dwp4j';
    final String clientSecret = 'RnyXiCNz3cahNx1g';
    late LinkedInLogin _linkedInLogin ;
    
    @override
    void initState() {
        _linkedInLogin = LinkedInLogin(context,
            clientId: clientId,
            clientSecret: clientSecret,
            redirectUri: redirectUrl
        );
        super.initState();
    }
    @override
    Widget build(BuildContext context) {
        
        return Scaffold(
            appBar: AppBar(
                title: Text(widget.title),
            ),
            body: Container(
                width: MediaQuery.of(context).size.width,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children : [
                      RaisedButton(onPressed: (){
                          _linkedInLogin.loginForAccessToken(
                              destroySession: true
                          ) .then((accessToken) => print(accessToken) )
                              .catchError((error){
                              print(error.errorDescription);
                          });
                      },child: Text('Get AccessToken'),),
                      RaisedButton(onPressed: (){
                          _linkedInLogin.getProfile(
                              destroySession: true
                          ) .then((profile) => print(profile.toJson().toString()) )
                              .catchError((error){
                              print(error.errorDescription);
                          });
                      },child: Text('Get Profile'),),
                      RaisedButton(onPressed: (){
                          _linkedInLogin.getEmail(
                              destroySession: true
                          ) .then((email) => print(email.toJson().toString()) )
                              .catchError((error){
                              
                              print(error.errorDescription);
                          });
                      },child: Text('Get Email'),),
                  ]
              ),
            ),// This trailing comma makes auto-formatting nicer for build methods.
        );
    }
}
