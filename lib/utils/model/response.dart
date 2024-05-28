class ResponseWithAccessToken {
  final String message;
  final int statusCode;
  String? detail;
  String? accessToken;

  ResponseWithAccessToken({
    required this.message,
    required this.statusCode,
    this.accessToken = null,
    this.detail = null,
  });

  factory ResponseWithAccessToken.fromJson(Map<String, dynamic> json) {
    if (json["status_code"] as int == 200) {
      return ResponseWithAccessToken(
          message: json["message"] as String,
          statusCode: json["status_code"] as int,
          accessToken: json["token"] as String);
    } else {
      return ResponseWithAccessToken(
          message: json["message"] as String,
          statusCode: json["status_code"] as int,
          detail: json["detail"] as String);
    }
  }
}

class GeneralResponse {
  final String message;
  final int statusCode;
  String? detail;

  GeneralResponse({
    required this.message,
    required this.statusCode,
    this.detail = null,
  });

  factory GeneralResponse.fromJson(Map<String, dynamic> json) {
    return GeneralResponse(
        message: json["message"] as String,
        statusCode: json["status_code"] as int,
        detail: json["message"] as String);
  }
}

class UnivResponse {
  final String message;
  final int statusCode;
  List<UniversityOnlyName>? univList;
  String? detail;

  UnivResponse(
      {required this.message,
      required this.statusCode,
      this.univList,
      this.detail = null});

  factory UnivResponse.fromJson(Map<String, dynamic> json) {
    var univListJson = json['univ_list'] as List<dynamic>?;
    List<UniversityOnlyName>? univList =
        univListJson?.map((item) => UniversityOnlyName.fromJson(item)).toList();
    return UnivResponse(
      message: json["message"] as String,
      statusCode: json["status_code"] as int,
      univList: univList,
      detail: json['detail'] != null ? json['detail'] as String : null,
    );
  }
}

class UniversityOnlyName {
  final String uUuid;
  final String univName;

  UniversityOnlyName({required this.uUuid, required this.univName});

  factory UniversityOnlyName.fromJson(Map<String, dynamic> json) {
    return UniversityOnlyName(
        uUuid: json["u_uuid"], univName: json["univ_name"]);
  }
}
