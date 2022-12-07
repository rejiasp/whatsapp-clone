// To parse this JSON data, do
//
//     final userDetails = userDetailsFromJson(jsonString);

import 'dart:convert';

UserDetails userDetailsFromJson(String str) => UserDetails.fromJson(json.decode(str));

String userDetailsToJson(UserDetails data) => json.encode(data.toJson());

class UserDetails {
    UserDetails({
        this.image,
        this.name,
        this.message,
        this.updatedAt,
        this.isGroup,
    });

    String? image;
    String? name;
    String? message;
    String? updatedAt;
    bool? isGroup;

    factory UserDetails.fromJson(Map<String, dynamic> json) => UserDetails(
        image: json["image"],
        name: json["name"],
        message: json["message"],
        updatedAt: json["updatedAt"],
    );

    Map<String, dynamic> toJson() => {
        "image": image,
        "name": name,
        "message": message,
        "updatedAt": updatedAt,
    };
}
