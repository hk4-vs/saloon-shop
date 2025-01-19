class ShopsModel {
  int? id;
  String? shopName;
  String? shopState;
  String? shopCity;
  String? pincode;
  String? shopAddress;
  String? shopPhoto;

  ShopsModel({
    this.id,
    this.shopName,
    this.shopState,
    this.shopCity,
    this.pincode,
    this.shopAddress,
    this.shopPhoto,
  });

  ShopsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    shopName = json['shop_name'];
    shopState = json['shop_state'];
    shopCity = json['shop_city'];
    pincode = json['pincode'];
    shopAddress = json['shop_address'];
    shopPhoto = json['shop_photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['shop_name'] = this.shopName;
    data['shop_state'] = this.shopState;
    data['shop_city'] = this.shopCity;
    data['pincode'] = this.pincode;
    data['shop_address'] = this.shopAddress;
    data['shop_photo'] = this.shopPhoto;

    return data;
  }
}
