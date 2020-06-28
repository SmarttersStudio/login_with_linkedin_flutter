///
/// Created By Guru (guru@smarttersstudio.com) on 28/06/20 12:45 PM
///
// To parse this JSON data, do
//
//     final linkedInProfile = linkedInProfileFromJson(jsonString);

import 'dart:convert';

LinkedInProfile linkedInProfileFromJson(String str) => LinkedInProfile.fromJson(json.decode(str));

String linkedInProfileToJson(LinkedInProfile data) => json.encode(data.toJson());

class LinkedInProfile {
    LinkedInProfile({
        this.firstName,
        this.lastName,
        this.profilePicture,
        this.id,
    });
    
    StName firstName;
    StName lastName;
    ProfilePicture profilePicture;
    String id;
    
    factory LinkedInProfile.fromJson(Map<String, dynamic> json) => LinkedInProfile(
        firstName: StName.fromJson(json["firstName"]),
        lastName: StName.fromJson(json["lastName"]),
        profilePicture: ProfilePicture.fromJson(json["profilePicture"]),
        id: json["id"],
    );
    
    Map<String, dynamic> toJson() => {
        "firstName": firstName.toJson(),
        "lastName": lastName.toJson(),
        "profilePicture": profilePicture.toJson(),
        "id": id,
    };
}

class StName {
    StName({
        this.localized,
        this.preferredLocale,
    });
    
    Localized localized;
    PreferredLocale preferredLocale;
    
    factory StName.fromJson(Map<String, dynamic> json) => StName(
        localized: Localized.fromJson(json["localized"]),
        preferredLocale: PreferredLocale.fromJson(json["preferredLocale"]),
    );
    
    Map<String, dynamic> toJson() => {
        "localized": localized.toJson(),
        "preferredLocale": preferredLocale.toJson(),
    };
}

class Localized {
    Localized({
        this.enUs,
    });
    
    String enUs;
    
    factory Localized.fromJson(Map<String, dynamic> json) => Localized(
        enUs: json["en_US"],
    );
    
    Map<String, dynamic> toJson() => {
        "en_US": enUs,
    };
}

class PreferredLocale {
    PreferredLocale({
        this.country,
        this.language,
    });
    
    String country;
    String language;
    
    factory PreferredLocale.fromJson(Map<String, dynamic> json) => PreferredLocale(
        country: json["country"],
        language: json["language"],
    );
    
    Map<String, dynamic> toJson() => {
        "country": country,
        "language": language,
    };
}

class ProfilePicture {
    ProfilePicture({
        this.displayImage,
        this.profilePictureDisplayImage,
    });
    
    String displayImage;
    DisplayImage profilePictureDisplayImage;
    
    factory ProfilePicture.fromJson(Map<String, dynamic> json) => ProfilePicture(
        displayImage: json["displayImage"],
        profilePictureDisplayImage: DisplayImage.fromJson(json["displayImage~"]),
    );
    
    Map<String, dynamic> toJson() => {
        "displayImage": displayImage,
        "displayImage~": profilePictureDisplayImage.toJson(),
    };
}

class DisplayImage {
    DisplayImage({
        this.paging,
        this.elements,
    });
    
    Paging paging;
    List<Element> elements;
    
    factory DisplayImage.fromJson(Map<String, dynamic> json) => DisplayImage(
        paging: Paging.fromJson(json["paging"]),
        elements: List<Element>.from(json["elements"].map((x) => Element.fromJson(x))),
    );
    
    Map<String, dynamic> toJson() => {
        "paging": paging.toJson(),
        "elements": List<dynamic>.from(elements.map((x) => x.toJson())),
    };
}

class Element {
    Element({
        this.artifact,
        this.authorizationMethod,
        this.data,
        this.identifiers,
    });
    
    String artifact;
    String authorizationMethod;
    Data data;
    List<Identifier> identifiers;
    
    factory Element.fromJson(Map<String, dynamic> json) => Element(
        artifact: json["artifact"],
        authorizationMethod: json["authorizationMethod"],
        data: Data.fromJson(json["data"]),
        identifiers: List<Identifier>.from(json["identifiers"].map((x) => Identifier.fromJson(x))),
    );
    
    Map<String, dynamic> toJson() => {
        "artifact": artifact,
        "authorizationMethod": authorizationMethod,
        "data": data.toJson(),
        "identifiers": List<dynamic>.from(identifiers.map((x) => x.toJson())),
    };
}

class Data {
    Data({
        this.comLinkedinDigitalmediaMediaartifactStillImage,
    });
    
    ComLinkedInDigitalMediaMediaArtifactStillImage comLinkedinDigitalmediaMediaartifactStillImage;
    
    factory Data.fromJson(Map<String, dynamic> json) => Data(
        comLinkedinDigitalmediaMediaartifactStillImage: ComLinkedInDigitalMediaMediaArtifactStillImage.fromJson(json["com.linkedin.digitalmedia.mediaartifact.StillImage"]),
    );
    
    Map<String, dynamic> toJson() => {
        "com.linkedin.digitalmedia.mediaartifact.StillImage": comLinkedinDigitalmediaMediaartifactStillImage.toJson(),
    };
}

class ComLinkedInDigitalMediaMediaArtifactStillImage {
    ComLinkedInDigitalMediaMediaArtifactStillImage({
        this.mediaType,
        this.rawCodecSpec,
        this.displaySize,
        this.storageSize,
        this.storageAspectRatio,
        this.displayAspectRatio,
    });
    
    String mediaType;
    RawCodecSpec rawCodecSpec;
    DisplaySize displaySize;
    StorageSize storageSize;
    AspectRatio storageAspectRatio;
    AspectRatio displayAspectRatio;
    
    factory ComLinkedInDigitalMediaMediaArtifactStillImage.fromJson(Map<String, dynamic> json) => ComLinkedInDigitalMediaMediaArtifactStillImage(
        mediaType: json["mediaType"],
        rawCodecSpec: RawCodecSpec.fromJson(json["rawCodecSpec"]),
        displaySize: DisplaySize.fromJson(json["displaySize"]),
        storageSize: StorageSize.fromJson(json["storageSize"]),
        storageAspectRatio: AspectRatio.fromJson(json["storageAspectRatio"]),
        displayAspectRatio: AspectRatio.fromJson(json["displayAspectRatio"]),
    );
    
    Map<String, dynamic> toJson() => {
        "mediaType": mediaType,
        "rawCodecSpec": rawCodecSpec.toJson(),
        "displaySize": displaySize.toJson(),
        "storageSize": storageSize.toJson(),
        "storageAspectRatio": storageAspectRatio.toJson(),
        "displayAspectRatio": displayAspectRatio.toJson(),
    };
}

class AspectRatio {
    AspectRatio({
        this.widthAspect,
        this.heightAspect,
        this.formatted,
    });
    
    double widthAspect;
    double heightAspect;
    String formatted;
    
    factory AspectRatio.fromJson(Map<String, dynamic> json) => AspectRatio(
        widthAspect: double.parse(json["widthAspect"].toString()),
        heightAspect: double.parse(json["heightAspect"].toString()),
        formatted: json["formatted"],
    );
    
    Map<String, dynamic> toJson() => {
        "widthAspect": widthAspect,
        "heightAspect": heightAspect,
        "formatted": formatted,
    };
}

class DisplaySize {
    DisplaySize({
        this.width,
        this.uom,
        this.height,
    });
    
    double width;
    String uom;
    double height;
    
    factory DisplaySize.fromJson(Map<String, dynamic> json) => DisplaySize(
        width: double.parse(json["width"].toString()),
        height: double.parse(json["height"].toString()),
        uom: json["uom"],
    );
    
    Map<String, dynamic> toJson() => {
        "width": width,
        "uom": uom,
        "height": height,
    };
}

class RawCodecSpec {
    RawCodecSpec({
        this.name,
        this.type,
    });
    
    String name;
    String type;
    
    factory RawCodecSpec.fromJson(Map<String, dynamic> json) => RawCodecSpec(
        name: json["name"],
        type: json["type"],
    );
    
    Map<String, dynamic> toJson() => {
        "name": name,
        "type": type,
    };
}

class StorageSize {
    StorageSize({
        this.width,
        this.height,
    });
    
    double width;
    double height;
    
    factory StorageSize.fromJson(Map<String, dynamic> json) => StorageSize(
        width: double.parse(json["width"].toString()),
        height: double.parse(json["height"].toString()),
    );
    
    Map<String, dynamic> toJson() => {
        "width": width,
        "height": height,
    };
}

class Identifier {
    Identifier({
        this.identifier,
        this.index,
        this.mediaType,
        this.file,
        this.identifierType,
        this.identifierExpiresInSeconds,
    });
    
    String identifier;
    int index;
    String mediaType;
    String file;
    String identifierType;
    int identifierExpiresInSeconds;
    
    factory Identifier.fromJson(Map<String, dynamic> json) => Identifier(
        identifier: json["identifier"],
        index: json["index"],
        mediaType: json["mediaType"],
        file: json["file"],
        identifierType: json["identifierType"],
        identifierExpiresInSeconds: json["identifierExpiresInSeconds"],
    );
    
    Map<String, dynamic> toJson() => {
        "identifier": identifier,
        "index": index,
        "mediaType": mediaType,
        "file": file,
        "identifierType": identifierType,
        "identifierExpiresInSeconds": identifierExpiresInSeconds,
    };
}

class Paging {
    Paging({
        this.count,
        this.start,
        this.links,
    });
    
    int count;
    int start;
    List<dynamic> links;
    
    factory Paging.fromJson(Map<String, dynamic> json) => Paging(
        count: json["count"],
        start: json["start"],
        links: List<dynamic>.from(json["links"].map((x) => x)),
    );
    
    Map<String, dynamic> toJson() => {
        "count": count,
        "start": start,
        "links": List<dynamic>.from(links.map((x) => x)),
    };
}
