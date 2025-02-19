// ignore_for_file: unnecessary_new, prefer_collection_literals, unnecessary_this

class SignUpResponseModel {
  String? accessToken;
  String? tokenType;
  int? expiresIn;

  SignUpResponseModel({this.accessToken, this.tokenType, this.expiresIn});

  SignUpResponseModel.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    tokenType = json['token_type'];
    expiresIn = json['expires_in'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['access_token'] = this.accessToken;
    data['token_type'] = this.tokenType;
    data['expires_in'] = this.expiresIn;
    return data;
  }
}
