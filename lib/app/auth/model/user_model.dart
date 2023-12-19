import 'package:e_store_app/app/auth/services/user_key.dart';

class UserModel {
  int? id;
  String? firsname;
  String? lastname;
  String? gender;
  String? email;
  String? password;
  String? username;
  String? city;
  String? phone;
  String? createAt;

  UserModel({
    required this.id,
    required this.firsname,
    required this.lastname,
    required this.gender,
    required this.email,
    required this.password,
    required this.username,
    required this.city,
    required this.phone,
    required this.createAt,
  });
  UserModel.fromJson(Map<String, dynamic> json)
      : id = json[UserKey.id],
        firsname = json[UserKey.firsname],
        lastname = json[UserKey.lastname],
        gender = json[UserKey.gender],
        email = json[UserKey.email],
        password = json[UserKey.password],
        username = json[UserKey.username],
        city = json[UserKey.city],
        phone = json[UserKey.phone],
        createAt = json[UserKey.createAt];
  Map<String, dynamic> toJson() => {
        UserKey.id: id,
        UserKey.firsname: firsname,
        UserKey.lastname: lastname,
        UserKey.gender: gender,
        UserKey.email: email,
        UserKey.password: password,
        UserKey.username: username,
        UserKey.city: city,
        UserKey.phone: phone,
        UserKey.createAt: createAt,
      };
}
