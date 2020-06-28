
import 'package:flutter/material.dart';
import 'package:loginwithlinkedin/linked_with_login/config/api_routes.dart';
import 'package:http/http.dart' as http;
import 'package:loginwithlinkedin/linked_with_login/data_model/auth_error_response.dart';
import 'package:loginwithlinkedin/linked_with_login/data_model/email_response.dart';
import 'package:loginwithlinkedin/linked_with_login/data_model/profile_error.dart';

///
/// Created By Guru (guru@smarttersstudio.com) on 28/06/20 12:54 PM
///

Future<LinkedInEmail> getEmailResponse({
    @required String accessToken
}) async{
    
    final response = await http.get(linkedInEmailUrl,headers: {
        'Authorization': 'Bearer $accessToken'
    });
    
    if(response.statusCode == 200)
        return linkedInEmailFromJson(response.body);
    else {
        final error = profileErrorFromJson(response.body);
        throw AuthorizationErrorResponse(
            errorDescription: error.message,
            status: error.status
        );
    }
    
}