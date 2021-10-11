///
/// Created By Guru (guru@smarttersstudio.com) on 28/06/20 12:59 PM
///
// To parse this JSON data, do
//
//     final profileError = profileErrorFromJson(jsonString);

import 'dart:convert';

ProfileError profileErrorFromJson(String str) => ProfileError.fromJson(json.decode(str));

String profileErrorToJson(ProfileError data) => json.encode(data.toJson());

class ProfileError {
    ProfileError({
        this.serviceErrorCode,
        this.message,
        this.status,
    });
    
    int? serviceErrorCode;
    String? message;
    int? status;
    
    factory ProfileError.fromJson(Map<String, dynamic> json) => ProfileError(
        serviceErrorCode: json["serviceErrorCode"],
        message: json["message"],
        status: json["status"],
    );
    
    Map<String, dynamic> toJson() => {
        "serviceErrorCode": serviceErrorCode,
        "message": message,
        "status": status,
    };
}
