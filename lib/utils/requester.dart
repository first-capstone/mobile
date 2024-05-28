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
