// To parse this JSON data, do
//
//     final userResponse = userResponseFromJson(jsonString);

import 'dart:convert';

UserResponse userResponseFromJson(String str) =>
    UserResponse.fromJson(json.decode(str));

String userResponseToJson(UserResponse data) => json.encode(data.toJson());

class UserResponse {
  UserResponse({
    this.code,
    this.status,
    this.data,
  });

  int? code;
  String? status;
  Data? data;

  factory UserResponse.fromJson(Map<String, dynamic> json) => UserResponse(
        code: json["code"],
        status: json["status"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "data": data!.toJson(),
      };
}

class Data {
  Data({
    this.firstname,
    this.lastname,
    this.email,
    this.phone,
    this.image,
    this.balance,
    this.infoCompleted,
    this.kycVerified,
    this.imageUploaded,
    this.totalInvested,
    this.totalBorrowed,
  });

  String? firstname;
  String? lastname;
  String? email;
  String? phone;
  dynamic? image;
  String? balance;
  bool? infoCompleted;
  bool? kycVerified;
  bool? imageUploaded;
  String? totalInvested;
  String? totalBorrowed;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        firstname: json["firstname"],
        lastname: json["lastname"],
        email: json["email"],
        phone: json["phone"],
        image: json["image"],
        balance: json["balance"],
        infoCompleted: json["info_completed"],
        kycVerified: json["kyc_verified"],
        imageUploaded: json["image_uploaded"],
        totalInvested: json["total_invested"],
        totalBorrowed: json["total_borrowed"],
      );

  Map<String, dynamic> toJson() => {
        "firstname": firstname,
        "lastname": lastname,
        "email": email,
        "phone": phone,
        "image": image,
        "balance": balance,
        "info_completed": infoCompleted,
        "kyc_verified": kycVerified,
        "image_uploaded": imageUploaded,
        "total_invested": totalInvested,
        "total_borrowed": totalBorrowed,
      };
}
