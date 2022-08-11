// To parse this JSON data, do
//
//     final getAllBankModel = getAllBankModelFromJson(jsonString);

import 'dart:convert';

List<GetAllBankModel> getAllBankModelFromJson(String str) => List<GetAllBankModel>.from(json.decode(str).map((x) => GetAllBankModel.fromJson(x)));

String getAllBankModelToJson(List<GetAllBankModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetAllBankModel {
    GetAllBankModel({
        this.id,
        this.code,
        this.name,
    });

    int ?id;
    String? code;
    String ?name;

    factory GetAllBankModel.fromJson(Map<String, dynamic> json) => GetAllBankModel(
        id: json["id"],
        code: json["code"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "code": code,
        "name": name,
    };
}
