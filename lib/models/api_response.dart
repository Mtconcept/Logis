import 'dart:convert';

class ResponseVerifyEmail {
  ResponseVerifyEmail({
    this.data,
    this.responseCode,
    this.message,
  });

  Data data;
  int responseCode;
  String message;

  factory ResponseVerifyEmail.fromJson(Map<String, dynamic> json) =>
      ResponseVerifyEmail(
        data: Data.fromJson(jsonDecode(json["data"])),
        responseCode: json["responseCode"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "responseCode": responseCode,
        "message": message,
      };
}

class Data {
  Data({
    this.trackingId,
  });

  String trackingId;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        trackingId: json["trackingId"],
      );

  Map<String, dynamic> toJson() => {
        "trackingId": trackingId,
      };
}
