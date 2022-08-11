// To parse this JSON data, do
//
//     final registerEmailOtp = registerEmailOtpFromJson(jsonString);

import 'dart:convert';

RegisterEmailOtp registerEmailOtpFromJson(String str) => RegisterEmailOtp.fromJson(json.decode(str));

String registerEmailOtpToJson(RegisterEmailOtp data) => json.encode(data.toJson());

class RegisterEmailOtp {
    RegisterEmailOtp({
        this.code,
        this.status,
        this.data,
    });

    int ?code;
    String ?status;
    Data ?data;

    factory RegisterEmailOtp.fromJson(Map<String, dynamic> json) => RegisterEmailOtp(
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
        this.token,
    });

    String ?token;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "token": token,
    };
}
