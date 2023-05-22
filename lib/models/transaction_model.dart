class Handshake {
  late String transactionId;
  late Address merchantAddress;
  late Address customerAddress;

  Handshake({
    required this.transactionId,
    required this.merchantAddress,
    required this.customerAddress,
  });

  Handshake.fromJson(Map<String, dynamic> json) {
    transactionId = json['transactionId'];
    merchantAddress = (json['merchantAddress'] != null
        ? Address.fromJson(json['merchantAddress'])
        : null)!;
    customerAddress = (json['customerAddress'] != null
        ? Address.fromJson(json['customerAddress'])
        : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['transactionId'] = transactionId;
    data['merchantAddress'] = merchantAddress.toJson();
    data['customerAddress'] = customerAddress.toJson();
    return data;
  }

  @override
  String toString() {
    return 'Handshake{\ntransactionId: $transactionId,\nmerchantAddress: $merchantAddress,\ncustomerAddress: $customerAddress,\n}';
  }
}

class Address {
  late String id;
  late String address;
  late String? postalCode;
  late String? city;
  late String? province;
  late double latitude;
  late double longitude;

  Address({
    required this.id,
    required this.address,
    this.postalCode,
    this.city,
    this.province,
    required this.latitude,
    required this.longitude,
  });

  Address.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    address = json['address'];
    postalCode = json['postalCode'];
    city = json['city'];
    province = json['province'];
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['address'] = address;
    data['postalCode'] = postalCode;
    data['city'] = city;
    data['province'] = province;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    return data;
  }

  @override
  String toString() {
    return 'Address{id: $id, address: $address, latitude: $latitude, longitude: $longitude}';
  }
}
