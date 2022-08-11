// To parse this JSON data, do
//
//     final apiResponse = apiResponseFromMap(jsonString);

import 'dart:convert';

class ApiResponse {
  ApiResponse({
    this.code,
     this.status,
     this.data,
  });


  int ? code;
  String ? status;
  covariant dynamic data;

  factory ApiResponse.fromJson(String str) => ApiResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ApiResponse.fromMap(Map<String, dynamic> json) => ApiResponse(
    code: json["code"],
    status: json["status"],
    data: json["data"],
  );

  Map<String, dynamic> toMap() => {
    "responseCode": code,
    "shortDescription": status,
    "data": data,
  };
}
