///
/// Created By Guru (guru@smarttersstudio.com) on 27/06/20 4:30 PM
///
import 'dart:convert';

AuthorizationErrorResponse authorizationErrorResponseFromJson(String str) => AuthorizationErrorResponse.fromJson(json.decode(str));

String authorizationErrorResponseToJson(AuthorizationErrorResponse data) => json.encode(data.toJson());

class AuthorizationErrorResponse {
    AuthorizationErrorResponse({
        this.error = LinkedInAuthErrorType.other,
        this.errorDescription,
        this.status = 400
    });

    LinkedInAuthErrorType error;
    String errorDescription;
    int status ;
    
    factory AuthorizationErrorResponse.fromJson(Map<String, dynamic> json) => AuthorizationErrorResponse(
        error: errorToAuthType(json["error"]),
        errorDescription: json["error_description"],
    );
    
    Map<String, dynamic> toJson() => {
        "error": authTypeToError(error),
        "error_description": errorDescription,
    };
    static LinkedInAuthErrorType errorToAuthType(error){
        switch(error){
            case 'user_cancelled_login' :
                return LinkedInAuthErrorType.userCancelledLogin;
            case 'user_cancelled_authorize':
                return LinkedInAuthErrorType.userCancelledAuthorize;
            default:
                return LinkedInAuthErrorType.other;
        }
    }

    static String authTypeToError(error){
        switch(error){
            case LinkedInAuthErrorType.userCancelledLogin :
                return 'user_cancelled_login';
            case LinkedInAuthErrorType.userCancelledAuthorize:
                return 'user_cancelled_authorize';
            default:
                return 'Other';
        }
    }
}

enum LinkedInAuthErrorType {
    userCancelledLogin , userCancelledAuthorize , other
}