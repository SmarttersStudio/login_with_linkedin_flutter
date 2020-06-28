## example

- A Flutter Package to login and get Profile Details from linkedIn.

## Getting Started

- Create an Application from [https://www.linkedin.com/developers/](https://www.linkedin.com/developers/ "https://www.linkedin.com/developers/").
- Get the clientId and clientSecret.
- Register a redirectUrl ( It can be any valid url )

####Initialize LinkedInLogin class

```dart
  final String redirectUrl = 'https://smarttersstudio.com';
  final String clientId = '78el5r2y1dwp4j ';
  final String clientSecret = 'RnyXiCNz3cahNx1g ';
  
  @override
  void initState() {
    LinkedInLogin.initialize(context,
      clientId: clientId,
      clientSecret: clientSecret,
      redirectUri: redirectUrl
    );
    super.initState();
  }
```

####Get The Token From LinkedIn

```dart
	LinkedInLogin.loginForAccessToken(
                destroySession: true,
				forceLogin : true ,
                appBar: AppBar(
                  title: Text('Demo Login Page'),
                )
         ) .then((accessToken) => print(accessToken) )
           .catchError((error){
                print(error.errorDescription);
	});
```

###Get Your Profile
```dart
	LinkedInLogin.getProfile(
                destroySession: true,
                forceLogin: true,
                appBar: AppBar(
                  	title: Text('Demo Login Page'),
                )
         	) .then((profile) => print(profile.toJson().toString()) )
              .catchError((error){
                	print(error.errorDescription);
	});
```

###Get Your Email
```dart
	LinkedInLogin.getEmail(
                destroySession: true,
                forceLogin: true,
                appBar: AppBar(
                  	title: Text('Demo Login Page'),
                )
         	) .then((email) => print(email.toJson().toString()) )
              .catchError((error){
                	print(error.errorDescription);
	});
```
###Additional Information

[Get The Full API Documentation from here](http://api.smarttersstudio.com/flutter_linkedin/ "Get The Full API Documentation from here")
