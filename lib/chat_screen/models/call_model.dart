// To parse this JSON data, do
//
//     final calls = callsFromJson(jsonString);

import 'dart:convert';

Calls callsFromJson(String str) => Calls.fromJson(json.decode(str));

String callsToJson(Calls data) => json.encode(data.toJson());

class Calls {
    Calls({
        this.name,
        this.isCall,
        this.isVideoCall,
        this.time,
        this.image,
    });

    String? name;
    bool? isCall;
    bool? isVideoCall;
    String? time;
    String? image;

    factory Calls.fromJson(Map<String, dynamic> json) => Calls(
        name: json["name"],
        isCall: json["isCall"],
        isVideoCall: json["isVideoCall"],
        time: json["time"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "isCall": isCall,
        "isVideoCall": isVideoCall,
        "time": time,
        "image": image,
    };
}
