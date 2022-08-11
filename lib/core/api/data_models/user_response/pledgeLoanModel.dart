// To parse this JSON data, do
//
//     final myPledgedModel = myPledgedModelFromJson(jsonString);

import 'dart:convert';

MyPledgedModel myPledgedModelFromJson(String str) => MyPledgedModel.fromJson(json.decode(str));

String myPledgedModelToJson(MyPledgedModel data) => json.encode(data.toJson());

class MyPledgedModel {
    MyPledgedModel({
        this.code,
        this.status,
        this.data,
    });

    int ?code;
    String ?status;
    List<Datum> ?data;

    factory MyPledgedModel.fromJson(Map<String, dynamic> json) => MyPledgedModel(
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
        this.amount,
        this.request,
    });

    String ?amount;
    Request ?request;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        amount: json["amount"],
        request: Request.fromJson(json["request"]),
    );

    Map<String, dynamic> toJson() => {
        "amount": amount,
        "request": request!.toJson(),
    };
}

class Request {
    Request({
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

    factory Request.fromJson(Map<String, dynamic> json) => Request(
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
