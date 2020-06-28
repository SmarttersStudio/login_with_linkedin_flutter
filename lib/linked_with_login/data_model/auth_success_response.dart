///
/// Created By Guru (guru@smarttersstudio.com) on 27/06/20 4:25 PM
///

import 'dart:convert';

AuthorizationSuccessResponse authorizationSuccessResponseFromJson(String str) => AuthorizationSuccessResponse.fromJson(json.decode(str));

String authorizationSuccessResponseToJson(AuthorizationSuccessResponse data) => json.encode(data.toJson());

class AuthorizationSuccessResponse {
    AuthorizationSuccessResponse({
        this.code,
        this.state,
    });
    
    String code;
    String state;
    
    factory AuthorizationSuccessResponse.fromJson(Map<String, dynamic> json) => AuthorizationSuccessResponse(
        code: json["code"],
        state: json["state"],
    );
    
    Map<String, dynamic> toJson() => {
        "code": code,
        "state": state,
    };
}