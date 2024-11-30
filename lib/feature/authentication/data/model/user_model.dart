import 'package:blog_app/feature/authentication/domain/entity/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.uid,
    required super.fullName,
    required super.email,
  });
  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      uid: map['id'] ?? '',
      fullName: map['name'] ?? '',
      email: map['email'] ?? '',
    );
  }
}
