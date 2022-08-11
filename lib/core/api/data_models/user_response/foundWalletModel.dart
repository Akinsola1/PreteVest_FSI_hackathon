// To parse this JSON data, do
//
//     final foundWalletResponse = foundWalletResponseFromJson(jsonString);

import 'dart:convert';

FoundWalletResponse foundWalletResponseFromJson(String str) => FoundWalletResponse.fromJson(json.decode(str));

String foundWalletResponseToJson(FoundWalletResponse data) => json.encode(data.toJson());

class FoundWalletResponse {
    FoundWalletResponse({
        this.code,
        this.status,
        this.data,
    });

    int ?code;
    String ?status;
    FoundWalletResponseData ?data;

    factory FoundWalletResponse.fromJson(Map<String, dynamic> json) => FoundWalletResponse(
        code: json["code"],
        status: json["status"],
        data: FoundWalletResponseData.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "data": data!.toJson(),
    };
}

class FoundWalletResponseData {
    FoundWalletResponseData({
        this.status,
        this.message,
        this.data,
    });

    String? status;
    String ?message;
    DataData? data;

    factory FoundWalletResponseData.fromJson(Map<String, dynamic> json) => FoundWalletResponseData(
        status: json["status"],
        message: json["message"],
        data: DataData.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data!.toJson(),
    };
}

class DataData {
    DataData({
        required this.link,
    });

    String link;

    factory DataData.fromJson(Map<String, dynamic> json) => DataData(
        link: json["link"],
    );

    Map<String, dynamic> toJson() => {
        "link": link,
    };
}
