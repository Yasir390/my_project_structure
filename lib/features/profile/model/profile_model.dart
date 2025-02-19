// ignore_for_file: prefer_collection_literals, unnecessary_new, unnecessary_this

class ProfileModel {
  int? userId;
  String? name;
  String? email;
  String? avatar;
  String? gender;
  String? dateOfBirth;
  int? age;
  String? position;
  String? club;
  String? preferredFoot;
  String? favouriteClub;
  String? favouritePlayer;
  String? createdAt;

  ProfileModel(
      {this.userId,
      this.name,
      this.email,
      this.avatar,
      this.gender,
      this.dateOfBirth,
      this.age,
      this.position,
      this.club,
      this.preferredFoot,
      this.favouriteClub,
      this.favouritePlayer,
      this.createdAt});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    name = json['name'];
    email = json['email'];
    avatar = json['avatar'];
    gender = json['gender'];
    dateOfBirth = json['date_of_birth'];
    age = json['age'];
    position = json['position'];
    club = json['club'];
    preferredFoot = json['preferred_foot'];
    favouriteClub = json['favourite_club'];
    favouritePlayer = json['favourite_player'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['avatar'] = this.avatar;
    data['gender'] = this.gender;
    data['date_of_birth'] = this.dateOfBirth;
    data['age'] = this.age;
    data['position'] = this.position;
    data['club'] = this.club;
    data['preferred_foot'] = this.preferredFoot;
    data['favourite_club'] = this.favouriteClub;
    data['favourite_player'] = this.favouritePlayer;
    data['created_at'] = this.createdAt;
    return data;
  }
}
