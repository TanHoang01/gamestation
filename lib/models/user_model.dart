class UserModel {
  String? uid;
  String? email;
  String? phonenumber;
  String? fullname;
  String? address;
  List<String>? favoritelist;
  String? messageId;

  UserModel({this.uid, this.email, this.phonenumber, this.fullname, this.address, this.favoritelist, this.messageId});

  // receiving data from server
  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      phonenumber: map['phonenumber'],
      fullname: map['fullname'],
      address: map['address'],
      favoritelist: map['favoritelist'],
      messageId: map['messageId'],
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
      'favoritelist': favoritelist,
      'messageId': messageId,
    };
  }
}