class ApiManager {
  String? _apiToken; // Private variable to hold the API token

  String? get apiToken => _apiToken; // Getter to access the token

  // Method to set the API token upon successful login
  void setApiToken(String token) {
    _apiToken = token;
  }

  // Method to remove the API token on logout
  void removeApiToken() {
    _apiToken = null;
  }
}
