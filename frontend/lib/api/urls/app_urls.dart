//all the url needed for the apiCall
class Url {
  String value;
  Url(this.value);
}

class ApiUrls {
  ApiUrls._();
  static String baseUrl = "http://192.168.1.68:8000";
  static Url testUrl = Url('/api/test');
  static Url test2Url = Url('/api/test2');
  //urls related to atuthentication authentication
  static Url loginUrl = Url('/api/auth/login');
  static Url signupUrl = Url('/api/auth/register');
  static Url logoutUrl = Url('/api/auth/logout');
  static Url changePasswordUrl = Url('api/test');

  //urls related to the income
  static Url addIncome = Url('/api/income/add');

  //urls realted to the assets
  static Url addAssets = Url('/api/assets');

  //urls related to the debts
  static Url addDebt = Url('/api/saving/add');

  //urls related to the bank
  static Url addBankAcc = Url('/api/bank-balances');

  static Url fetchBankAcc = Url('/api/all-accounts');

  //urls related to the stocks
  static Url searchStocks = Url("/api/search_stock");
  static Url randomStocks = Url("/api/random_stock");

  //urls realted to the saving goals
  static Url fetchSavingGoal = Url("/api/savings/fetch");
  static Url addSaving = Url('/api/saving/add');
  static Url editSaving = Url("/api/saving/edit");

  //urls realted to the payments;
  static Url fetchUpcomingPayment = Url("/api/expenses/upcoming");

  //urls for the balanceCard
  static Url fetchBalance = Url("/api/total-balance"); //get

  //urls for the expenses
  static Url addExpense = Url("/api/expenses");
}
