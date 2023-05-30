class ApiEndPoints {
  static String domain = "10.6.186.210";
  static String baseUrl = 'http://$domain:5000/';
  // static String baseUrl = 'https://2675-149-113-6-220.ngrok-free.app/';
  static final _AuthEndPoints authEndpoints = _AuthEndPoints();
  static final _DriverEndPoints driverEndpoints = _DriverEndPoints();
  static final _TransactionEndPoints transactionEndPoints =
      _TransactionEndPoints();

  // set domain
  static void setDomain(String domain) {
    ApiEndPoints.domain = domain;
  }
}

class _AuthEndPoints {
  final String signUp = "auth/signUp/driver";
  final String login = "auth/login";
  final String logout = "auth/logout";
  final String uploadImage = "auth/profile/upload-profile-picture";
  final String getProfileImage = "auth/profile/fetch-profile-picture";
  final String verifyAuth = "auth/verify";
}

class _DriverEndPoints {
  final String getProfile = "drivers/profile";
}

class _TransactionEndPoints {
  String acceptOrder(String transactionId) {
    return "transactions/$transactionId/accept";
  }

  String updateTransactionStatus(String transactionId) {
    return "transactions/$transactionId/status";
  }
}
