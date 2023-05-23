import 'package:latlong2/latlong.dart';

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

class Transaction {
  late Map<String, Route> routes;
  // late double distance;
  // late double duration;
  late Address merchantAddress;
  late Address customerAddress;
  late List<Order> orderList;
  late String paymentMethod;
  late double totalPrice;
  late String customerName;

  Transaction({
    required this.routes,
    // required this.distance,
    // required this.duration,
    required this.merchantAddress,
    required this.customerAddress,
    required this.orderList,
    required this.paymentMethod,
    required this.totalPrice,
    required this.customerName,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) {
    var routes = json['routes'];

    var driverToMerchant = routes['driverToMerchant'];
    var merchantToCustomer = routes['merchantToCustomer'];

    routes = {
      'driverToMerchant': Route.fromJson(driverToMerchant),
      'merchantToCustomer': Route.fromJson(merchantToCustomer),
    };

    return Transaction(
      routes: routes,
      merchantAddress: Address.fromJson(json['merchantAddress']),
      customerAddress: Address.fromJson(json['customerAddress']),
      orderList: Order.fromJsonList(json['orderList']),
      paymentMethod: json['paymentMethod'],
      totalPrice: json['totalPrice']?.toDouble() ?? 0.0,
      customerName: json['customerName'],
    );
  }

  @override
  String toString() {
    return 'Transaction{routes: $routes, merchantAddress: $merchantAddress, customerAddress: $customerAddress, orderList: $orderList, paymentMethod: $paymentMethod, totalPrice: $totalPrice, customerName: $customerName}';
  }
}

class Route {
  late List<LatLng> coordinates;
  late double distance;
  late double duration;

  Route({
    required this.coordinates,
    required this.distance,
    required this.duration,
  });

  factory Route.fromJson(Map<String, dynamic> json) {
    var coordinates = coordinatesFromJsonList(json['coordinates']);

    return Route(
      coordinates: coordinates,
      distance: json['distance']?.toDouble() ?? 0.0,
      duration: json['duration']?.toDouble() ?? 0.0,
    );
  }

  static List<LatLng> coordinatesFromJsonList(List<dynamic> jsonList) {
    var routes = jsonList.map((e) {
      return LatLng(e[1], e[0]);
    }).toList();
    return routes;
  }

  @override
  String toString() {
    return 'Route{coordinates: $coordinates, distance: $distance, duration: $duration}';
  }
}

class Order {
  final String id;
  final int quantity;
  final String cartId;
  final String menuId;
  final Menu menu;

  Order({
    required this.id,
    required this.quantity,
    required this.cartId,
    required this.menuId,
    required this.menu,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'],
      quantity: json['quantity'],
      cartId: json['cartId'],
      menuId: json['menuId'],
      menu: Menu.fromJson(json['menu']),
    );
  }

  static fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((e) => Order.fromJson(e)).toList();
  }

  @override
  toString() {
    return 'Order(id: $id, quantity: $quantity, cartId: $cartId, menuId: $menuId, menu: $menu)';
  }
}

class Menu {
  final String id;
  final String name;
  final double price;
  final String? description;
  final String? imageId;
  final String? imageUrl;
  final String merchantId;
  late final bool inStock;
  // Restriction?

  Menu({
    required this.id,
    required this.name,
    required this.price,
    this.description,
    this.imageId,
    this.imageUrl,
    required this.merchantId,
    required this.inStock,
  });

  factory Menu.fromJson(Map<String, dynamic> json) {
    return Menu(
      id: json['id'],
      name: json['name'],
      price: json['price']?.toDouble() ?? 0.0,
      description: json['description'],
      imageId: json['imageId'],
      imageUrl: json['imageUrl'],
      merchantId: json['merchantId'],
      inStock: json['inStock'] ?? false,
    );
  }

  static fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((e) => Menu.fromJson(e)).toList();
  }

  @override
  toString() {
    return 'Menu(id: $id, name: $name, price: $price, description: $description, imageId: $imageId, imageUrl: $imageUrl, merchantId: $merchantId)';
  }
}
