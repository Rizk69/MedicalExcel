import 'dart:io';

class RegisterModel {
  String? email;
  File? image;
  String? address;
  String? jobAs_id = '2';
  String? goverment_id = '2';
  String? city = '2';
  String? password;
  String? fName;
  String? lName;
  String? phone;
  String? socialId;
  String? loginMedium;
  String? referCode;

  RegisterModel(
      {this.email,
      this.password,
      this.fName,
      this.lName,
      this.socialId,
      this.loginMedium,
      this.referCode,
      this.address,
      this.image});

  // RegisterModel.fromJson(Map<String, dynamic> json) {
  //   email = json['email'];
  //   password = json['password'];
  //   fName = json['f_name'];
  //   // lName = json['l_name'];
  //   jobAs_id = json['jobAs_id'];
  //   image = json['image'] ;
  //   goverment_id = json['goverment_id'];
  //   city = json['city'];
  //   phone = json['phone'];
  //   // socialId = json['social_id'];
  //   // loginMedium = json['login_medium'];
  //   // referCode = json['referral_code'];
  // }
  RegisterModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
    fName = json['f_name'];
    jobAs_id = json['jobAs_id'];
    // Check if the 'image' field is a String (URL) or a File
    if (json['image'] is String) {
      // If it's a String, assume it's a URL
      // You can handle this case based on your app's requirements
      // For now, I'm setting it to null, but you might want to handle it differently
      image = null;
    } else {
      // If it's not a String, assume it's a File
      image = File(json['image']);
    }
    goverment_id = json['goverment_id'];
    city = json['city'];
    phone = json['phone'];
    // socialId = json['social_id'];
    // loginMedium = json['login_medium'];
    // referCode = json['referral_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['jobAs_id'] = jobAs_id;
    data['goverment_id'] = goverment_id;
    data['image'] = image;
    data['city'] = city;
    data['password'] = password;
    data['f_name'] = fName;
    // data['l_name'] = lName;
    data['phone'] = phone;
    // data['social_id'] = socialId;
    // data['login_medium'] = loginMedium;
    // data['referral_code'] = referCode;
    return data;
  }
}
