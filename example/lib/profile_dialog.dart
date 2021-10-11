import 'package:flutter/material.dart';

///
/// Created by Sunil Kumar on 29-06-2020 09:10 AM.
///
class ProfileInfo extends StatelessWidget {
  final String avatar;
  final String email, accessToken;
  final String firstName, lastName;
  const ProfileInfo(
      {this.accessToken,
      this.avatar,
      this.email,
      this.firstName,
      this.lastName});

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Center(
        child: CircleAvatar(
          radius: 54,
          backgroundImage: NetworkImage(
            avatar ?? 'https://image.flaticon.com/icons/png/512/124/124011.png',
          ),
        ),
      ),
      children: [
        if (firstName != null && lastName != null)
          Center(
            child: Text('$firstName $lastName',
                style: Theme.of(context).textTheme.headline6),
          ),
        if (email != null)
          Center(
              child:
                  Text('$email', style: Theme.of(context).textTheme.subtitle1)),
        if (accessToken != null)
          Center(
              child: Text('$accessToken',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  style: Theme.of(context).textTheme.caption)),
      ],
    );
  }
}
