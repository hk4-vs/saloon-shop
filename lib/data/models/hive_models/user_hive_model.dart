import 'package:hive/hive.dart';
part 'user_hive_model.g.dart';

@HiveType(typeId: 0)
class HiveUser {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String email;

  @HiveField(3)
  final String? emailVerifiedAt;

  HiveUser({
    required this.id,
    required this.name,
    required this.email,
    this.emailVerifiedAt,
  });

  factory HiveUser.fromJson(Map<String, dynamic> json) {
    return HiveUser(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      emailVerifiedAt: json['email_verified_at'],
    );
  }
}

@HiveType(typeId: 1)
class HiveLoginResponse {
  @HiveField(0)
  final String message;

  @HiveField(1)
  final HiveUser user;

  @HiveField(2)
  final String userType;

  @HiveField(3)
  final String accessToken;

  @HiveField(4)
  final bool status;

  HiveLoginResponse({
    required this.message,
    required this.user,
    required this.userType,
    required this.accessToken,
    required this.status,
  });

  factory HiveLoginResponse.fromJson(Map<String, dynamic> json) {
    return HiveLoginResponse(
      message: json['message'],
      user: HiveUser.fromJson(json['user']),
      userType: json['user_type'],
      accessToken: json['access_token'],
      status: json['status'],
    );
  }
}
