class ApiEndPoints {
  static const String baseUrl = "http://localhost:5000/";
  static final _AuthEndPoints authEndpoints = _AuthEndPoints();
  static final _DriverEndPoints merchantEndpoints = _DriverEndPoints();
}

class _AuthEndPoints {
  final String signUp = "auth/signUp/driver";
  final String login = "auth/login";
  final String logout = "auth/logout";
}

class _DriverEndPoints {
  final String getProfile = "drivers/profile";
}
