// ignore_for_file: prefer_collection_literals, unnecessary_new, unnecessary_this

class LoginResponseModel {
  String? token;
  String? tokenType;
  int? expiresIn;
  int? id;
  String? name;
  String? email;
  String? avater;
  String? dateOfBirth;
  String? gender;
  String? club;
  String? position;
  String? preferredFoot;
  String? favouriteClub;
  String? favouritePlayer;
  String? createdAt;
  String? updatedAt;

  LoginResponseModel(
      {this.token,
      this.tokenType,
      this.expiresIn,
      this.id,
      this.name,
      this.email,
      this.avater,
      this.dateOfBirth,
      this.gender,
      this.club,
      this.position,
      this.preferredFoot,
      this.favouriteClub,
      this.favouritePlayer,
      this.createdAt,
      this.updatedAt});

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    tokenType = json['token_type'];
    expiresIn = json['expires_in'];
    id = json['id'];
    name = json['name'];
    email = json['email'];
    avater = json['avater'];
    dateOfBirth = json['date_of_birth'];
    gender = json['gender'];
    club = json['club'];
    position = json['position'];
    preferredFoot = json['preferred_foot'];
    favouriteClub = json['favourite_club'];
    favouritePlayer = json['favourite_player'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['token_type'] = this.tokenType;
    data['expires_in'] = this.expiresIn;
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['avater'] = this.avater;
    data['date_of_birth'] = this.dateOfBirth;
    data['gender'] = this.gender;
    data['club'] = this.club;
    data['position'] = this.position;
    data['preferred_foot'] = this.preferredFoot;
    data['favourite_club'] = this.favouriteClub;
    data['favourite_player'] = this.favouritePlayer;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
