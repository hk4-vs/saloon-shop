class UserRegistrationModel {
  String? email;
  String? password;
  String? name;
  String? verificationID;
  String? otp;

  UserRegistrationModel(
      {this.email,
      this.password,
      this.name,
      this.verificationID = "0",
      this.otp = "0"});

  UserRegistrationModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
    name = json['name'];
    verificationID = json['verification_id'];
    otp = json['otp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['password'] = password;
    data['name'] = name;
    data['verification_id'] = verificationID;
    data['otp'] = otp;
    return data;
  }
}
