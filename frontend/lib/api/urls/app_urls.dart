//all the url needed for the apiCall
class Url {
  String value;
  Url(this.value);
}

class ApiUrls {
  ApiUrls._();
  static String baseUrl = "http://192.168.1.75:8000/api";
  static Url testUrl = Url('/api/test');
  static Url test2Url = Url('/api/test2');
  //urls related to atuthentication authentication
  static Url loginUrl = Url('/api/auth/login');
  static Url signupUrl = Url('/api/auth/register');
  static Url logoutUrl = Url('/api/auth/logout');
  static Url changePasswordUrl = Url('api/test');

  //urls related to the income
  static Url addIncome = Url('/api/income/add');
}
