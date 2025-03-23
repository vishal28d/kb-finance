class Customer {
  String? firstName;
  String? email;
  String? mobile;
  int? id;
  var imagedata;
  Customer({this.firstName, this.email, this.mobile, this.id, this.imagedata});

  Map<String, dynamic> toJson() => {'firstName': firstName, 'email': email, 'mobile': mobile, 'id': id, 'imagedata': imagedata};

  Customer.fromJson(Map<String, dynamic> json) {
    try {
      firstName = json['firstName'] != null ? json['firstName'] : null;
      email = json['email'] != null ? json['email'] : null;
      mobile = json['mobile'] != null ? json['mobile'] : null;
      id = json['id'] != null ? json['id'] : null;
      imagedata = json['imagedata'] != null ? json['imagedata'] : null;
    } catch (e) {
      print("Exception - CustomerModel.dart - Customer.fromJson():" + e.toString());
    }
  }
}
