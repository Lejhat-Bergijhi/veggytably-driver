class AuthenticationResponse {
  late Data data;

  AuthenticationResponse({required this.data});

  AuthenticationResponse.fromJson(Map<String, dynamic> json) {
    data = Data.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['data'] = this.data.toJson();
    return data;
  }
}

class Data {
  late User user;
  late String accessToken;
  late String refreshToken;

  Data(
      {required this.user,
      required this.accessToken,
      required this.refreshToken});

  Data.fromJson(Map<String, dynamic> json) {
    user = User.fromJson(json['user']);
    accessToken = json['accessToken'];
    refreshToken = json['refreshToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user'] = user.toJson();
    data['accessToken'] = accessToken;
    data['refreshToken'] = refreshToken;
    return data;
  }
}

class User {
  late String id;
  late String username;
  late String email;
  late String phone;

  User(
      {required this.id,
      required this.username,
      required this.email,
      required this.phone});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    email = json['email'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['username'] = username;
    data['email'] = email;
    data['phone'] = phone;
    return data;
  }
}
