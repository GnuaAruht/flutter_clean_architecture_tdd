import '../../domain/entities/user.dart';

class UserModel extends User {
  const UserModel(
      {required String id, required String name, required String avatar})
      : super(id: id, name: name, avatar: avatar);

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        id: json['id'], name: json['name'], avatar: json['avatar']);
  }

  Map<String, dynamic> toJson() {
    return {"id": id, "name": name, "avatar": avatar};
  }
}
