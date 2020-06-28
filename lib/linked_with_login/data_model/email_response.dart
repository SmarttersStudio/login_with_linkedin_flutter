///
/// Created By Guru (guru@smarttersstudio.com) on 28/06/20 1:17 PM
///
// To parse this JSON data, do
//
//     final linkedInEmail = linkedInEmailFromJson(jsonString);

import 'dart:convert';

LinkedInEmail linkedInEmailFromJson(String str) => LinkedInEmail.fromJson(json.decode(str));

String linkedInEmailToJson(LinkedInEmail data) => json.encode(data.toJson());

class LinkedInEmail {
    LinkedInEmail({
        this.elements,
    });
    
    List<Element> elements;
    
    factory LinkedInEmail.fromJson(Map<String, dynamic> json) => LinkedInEmail(
        elements: List<Element>.from(json["elements"].map((x) => Element.fromJson(x))),
    );
    
    Map<String, dynamic> toJson() => {
        "elements": List<dynamic>.from(elements.map((x) => x.toJson())),
    };
}

class Element {
    Element({
        this.elementHandle,
        this.handle,
    });
    
    Handle elementHandle;
    String handle;
    
    factory Element.fromJson(Map<String, dynamic> json) => Element(
        elementHandle: Handle.fromJson(json["handle~"]),
        handle: json["handle"],
    );
    
    Map<String, dynamic> toJson() => {
        "handle~": elementHandle.toJson(),
        "handle": handle,
    };
}

class Handle {
    Handle({
        this.emailAddress,
    });
    
    String emailAddress;
    
    factory Handle.fromJson(Map<String, dynamic> json) => Handle(
        emailAddress: json["emailAddress"],
    );
    
    Map<String, dynamic> toJson() => {
        "emailAddress": emailAddress,
    };
}
