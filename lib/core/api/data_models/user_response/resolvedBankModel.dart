// To parse this JSON data, do
//
//     final resolveBankModel = resolveBankModelFromJson(jsonString);

import 'dart:convert';

ResolveBankModel resolveBankModelFromJson(String str) =>
    ResolveBankModel.fromJson(json.decode(str));

String resolveBankModelToJson(ResolveBankModel data) =>
    json.encode(data.toJson());

class ResolveBankModel {
  ResolveBankModel({
    this.status,
    this.message,
    this.data,
  });

  String? status;
  String? message;
  Data? data;

  factory ResolveBankModel.fromJson(Map<String, dynamic> json) =>
      ResolveBankModel(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data!.toJson(),
      };
}

class Data {
  Data({
    this.accountNumber,
    this.accountName,
  });

  String? accountNumber;
  String? accountName;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        accountNumber: json["account_number"],
        accountName: json["account_name"],
      );

  Map<String, dynamic> toJson() => {
        "account_number": accountNumber,
        "account_name": accountName,
      };
}
