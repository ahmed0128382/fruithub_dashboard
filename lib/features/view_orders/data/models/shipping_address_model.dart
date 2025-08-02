import 'package:fruithub_dashboard/features/view_orders/domain/entities/shipping_address_entity.dart';

class ShippingAddressModel {
  String? email;
  String? name;
  String? city;
  String? phoneNumber;
  String? address;
  String? addressDetails;

  ShippingAddressModel(
      {this.email,
      this.name,
      this.city,
      this.phoneNumber,
      this.address,
      this.addressDetails});

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'name': name,
      'city': city,
      'phoneNumber': phoneNumber,
      'address': address,
      'addressDetails': addressDetails,
    };
  }

  factory ShippingAddressModel.fromJson(Map<String, dynamic> json) {
    return ShippingAddressModel(
      email: json['email'],
      name: json['name'],
      city: json['city'],
      phoneNumber: json['phoneNumber'],
      address: json['address'],
      addressDetails: json['addressDetails'],
    );
  }

  toEntity() {
    return ShippingAddressEntity(
      email: email,
      name: name,
      city: city,
      phoneNumber: phoneNumber,
      address: address,
      addressDetails: addressDetails,
    );
  }

  @override
  String toString() {
    return '$city,$addressDetails,$address';
  }
}
