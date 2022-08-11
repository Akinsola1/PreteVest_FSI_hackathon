// To parse this JSON data, do
//
//     final myLoanRequest = myLoanRequestFromJson(jsonString);

import 'dart:convert';

MyLoanRequest myLoanRequestFromJson(String str) => MyLoanRequest.fromJson(json.decode(str));

String myLoanRequestToJson(MyLoanRequest data) => json.encode(data.toJson());

class MyLoanRequest {
    MyLoanRequest({
        this.code,
        this.status,
        this.data,
    });

    int ?code;
    String? status;
    List<Datum>? data;

    factory MyLoanRequest.fromJson(Map<String, dynamic> json) => MyLoanRequest(
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
        this.owner,
    });

    int ?id;
    String ?amount;
    String ?title;
    String ?description;
    String ?pledged;
    int ?owner;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        amount: json["amount"],
        title: json["title"],
        description: json["description"],
        pledged: json["pledged"],
        owner: json["owner"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "amount": amount,
        "title": title,
        "description": description,
        "pledged": pledged,
        "owner": owner,
    };
}
