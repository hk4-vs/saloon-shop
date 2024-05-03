class UserRegistrationModel {
  String? email;
  String? password;
  String? name;
  String? verification_id;
  String? otp;

  UserRegistrationModel(
      {this.email,
      this.password,
      this.name,
      this.verification_id = "0",
      this.otp = "0"});

  UserRegistrationModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
    name = json['name'];
    verification_id = json['verification_id'];
    otp = json['otp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['password'] = this.password;
    data['name'] = this.name;
    data['verification_id'] = this.verification_id;
    data['otp'] = this.otp;
    return data;
  }
}
