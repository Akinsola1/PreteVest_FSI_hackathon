// To parse this JSON data, do
//
//     final myBankModel = myBankModelFromJson(jsonString);

import 'dart:convert';

List<MyBankModel> myBankModelFromJson(String str) => List<MyBankModel>.from(json.decode(str).map((x) => MyBankModel.fromJson(x)));

String myBankModelToJson(List<MyBankModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MyBankModel {
    MyBankModel({
        this.id,
        this.bankName,
        this.bankCode,
        this.accNum,
        this.accName,
        this.owner,
    });

    int ?id;
    String? bankName;
    String? bankCode;
    String? accNum;
    String? accName;
    int? owner;

    factory MyBankModel.fromJson(Map<String, dynamic> json) => MyBankModel(
        id: json["id"],
        bankName: json["bank_name"],
        bankCode: json["bank_code"],
        accNum: json["acc_num"],
        accName: json["acc_name"],
        owner: json["owner"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "bank_name": bankName,
        "bank_code": bankCode,
        "acc_num": accNum,
        "acc_name": accName,
        "owner": owner,
    };
}
