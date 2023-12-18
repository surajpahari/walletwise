//all the url needed for the apiCall
class Url {
  String value;
  Url(this.value);
}

class ApiUrls {
  ApiUrls._();
  static String baseUrl = "https://localhost:8000/api";
  static Url testUrl = Url('/api/test');
//for the tekt
}
