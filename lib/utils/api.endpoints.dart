class ApiEndPoints {
  static const String domain = "192.168.40.5";
  static const String baseUrl = 'http://$domain:5000/';
  static final _AuthEndPoints authEndpoints = _AuthEndPoints();
  static final _DriverEndPoints driverEndpoints = _DriverEndPoints();
}

class _AuthEndPoints {
  final String signUp = "auth/signUp/driver";
  final String login = "auth/login";
  final String logout = "auth/logout";
  final String uploadImage = "auth/profile/upload-profile-picture";
}

class _DriverEndPoints {
  final String getProfile = "drivers/profile";
  final String getProfileImage = "drivers/fetch-profile-image";
}
