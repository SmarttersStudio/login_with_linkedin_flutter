
import 'package:flutter/material.dart';
import 'package:flutter_linkedin/linked_with_login/config/api_routes.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_linkedin/linked_with_login/data_model/auth_error_response.dart';
import 'package:flutter_linkedin/linked_with_login/data_model/profile_error.dart';
import 'package:flutter_linkedin/linked_with_login/data_model/profile_response.dart';

///
/// Created By Guru (guru@smarttersstudio.com) on 28/06/20 12:54 PM
///


Future<LinkedInProfile> getProfileResponse({
    required String accessToken
}) async{
    
    final response = await http.get(Uri.parse(linkedInProfileUrl),headers: {
        'Authorization': 'Bearer $accessToken'
    });
    
    if(response.statusCode == 200)
        return linkedInProfileFromJson(response.body);
    else {
        final error =  profileErrorFromJson(response.body);
        throw AuthorizationErrorResponse(
            errorDescription: error.message,
            status: error.status
        );
    }
    
}