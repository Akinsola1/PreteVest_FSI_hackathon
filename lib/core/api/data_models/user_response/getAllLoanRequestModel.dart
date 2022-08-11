// To parse this JSON data, do
//
//     final getAllLoanRequestModel = getAllLoanRequestModelFromJson(jsonString);

import 'dart:convert';

GetAllLoanRequestModel getAllLoanRequestModelFromJson(String str) => GetAllLoanRequestModel.fromJson(json.decode(str));

String getAllLoanRequestModelToJson(GetAllLoanRequestModel data) => json.encode(data.toJson());

class GetAllLoanRequestModel {
    GetAllLoanRequestModel({
        this.code,
        this.status,
        this.data,
    });

    int ?code;
    String? status;
    List<Datum> ?data;

    factory GetAllLoanRequestModel.fromJson(Map<String, dynamic> json) => GetAllLoanRequestModel(
        code: json["code"],
        status: json["status"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
        this.id,
        this.amount,
        this.title,
        this.description,
        this.pledged,
        this.remaining,
        this.completed,
        this.owner,
    });

    int ?id;
    String ? amount;
    String ? title;
    String ? description;
    String ? pledged;
    String ? remaining;
    bool ?completed;
    int ?owner;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        amount: json["amount"],
        title: json["title"],
        description: json["description"],
        pledged: json["pledged"],
        remaining: json["remaining"],
        completed: json["completed"],
        owner: json["owner"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "amount": amount,
        "title": title,
        "description": description,
        "pledged": pledged,
        "remaining": remaining,
        "completed": completed,
        "owner": owner,
    };
}
