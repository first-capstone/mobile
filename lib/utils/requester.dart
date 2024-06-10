import 'dart:convert';

import 'package:http/http.dart' as http;
import 'model/response.dart';

const String host = "https://union.webs.vc";

Future<ResponseWithAccessToken> login(String ID, String password) async {
  Map data = {"username": ID, "password": password};

  http.Response response =
      await http.post(Uri.parse("$host/account/login"), body: data);
  String responseBody = utf8.decoder.convert(response.bodyBytes);
  return ResponseWithAccessToken.fromJson(json.decode(responseBody));
}

Future<GeneralResponse> register(String ID, String password, String nickname,
    String email, String phone, String uUuid, String sID) async {
  Map data = {
    "user_id": ID,
    "password": password,
    "nickname": nickname,
    "email": email,
    "phone": phone,
    "u_uuid": uUuid,
    "s_id": sID
  };

  http.Response response = await http.put(Uri.parse("$host/account/register"),
      body: json.encode(data));

  String responseBody = utf8.decoder.convert(response.bodyBytes);
  return GeneralResponse.fromJson(json.decode(responseBody));
}

Future<UnivCertResponse> checkEmail(String email, String univName) async {
  Map data = {
    "key": "8ba5de93-9d7c-44f3-9e85-ff94b934a60f",
    "email": email,
    "univName": univName,
    "univ_check": true.toString() // Convert boolean to string
  };

  http.Response response = await http.post(
    Uri.parse("https://univcert.com/api/v1/certify"),
    headers: {"Content-Type": "application/json"}, // Set content-type header
    body: json.encode(data), // Serialize data to JSON string
  );

  String responseBody = utf8.decoder.convert(response.bodyBytes);
  return UnivCertResponse.fromJson(json.decode(responseBody));
}

Future<UnivCertResponse> verifyCode(
    String email, String univName, int code) async {
  Map data = {
    "key": "8ba5de93-9d7c-44f3-9e85-ff94b934a60f",
    "email": email,
    "univName": univName,
    "code": code
  };

  http.Response response = await http.post(
      Uri.parse("https://univcert.com/api/v1/certifycode"),
      headers: {"Content-Type": "application/json"}, // Set content-type header
      body: json.encode(data));

  String responseBody = utf8.decoder.convert(response.bodyBytes);
  return UnivCertResponse.fromJson(json.decode(responseBody));
}

Future<GeneralResponse> checkDuplicate(String path, String data) async {
  http.Response response =
      await http.post(Uri.parse("$host/account/duplicate/$path?data=$data"));
  String responseBody = utf8.decoder.convert(response.bodyBytes);
  return GeneralResponse.fromJson(json.decode(responseBody));
}

Future<UnivResponse> getUnivNameList() async {
  http.Response response = await http.get(Uri.parse("$host/univ/"));
  String responseBody = utf8.decoder.convert(response.bodyBytes);
  return UnivResponse.fromJson(json.decode(responseBody));
}
