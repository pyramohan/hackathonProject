class AddressModel {
  final int id;
  final String name;
  final String email;
  final int mobileNumber;
  final String address;
  final String city;
  final String country;
  final String state;
  final String pincode;
  final String userid;

  AddressModel(
      {this.id,
      this.name,
      this.email,
      this.mobileNumber,
      this.address,
      this.city,
      this.country,
      this.state,
      this.pincode,
      this.userid});

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return new AddressModel(
      id: json["id"],
      name: json["name"],
      email: json["email"],
      mobileNumber: json["mobileNumber"],
      address: json["address"],
      city: json["city"],
      country: json["country"],
      state: json["state"],
      pincode: json["pincode"],
      userid: json["user_id"],
    );
  }
}
