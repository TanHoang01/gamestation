class UserModel {
  String? uid;
  String? email;
  String? phonenumber;
  String? fullname;
  String? address;

  UserModel({this.uid, this.email, this.phonenumber, this.fullname, this.address});

  // receiving data from server
  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      phonenumber: map['phonenumber'],
      fullname: map['fullname'],
      address: map['address'],
    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'phonenumber': phonenumber,
      'fullname': fullname,
      'address': address,
    };
  }
}