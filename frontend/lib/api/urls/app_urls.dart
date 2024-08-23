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

  //urls realted to the assets
  static Url addAssets = Url('/api/assets');
  static Url fetchAssets = Url('/api/assets/fetch');

  //urls related to the debts
  static Url addDebt = Url('/api/debts');
  static Url fetchDebt = Url('/api/debts/fetch');

  //urls related to the bank
  static Url addBankAcc = Url('/api/bank-balances');
  static Url fetchBankAcc = Url('/api/all-accounts');

  //urls related to the stocks
  static Url searchStocks = Url("/api/search_stock");
  static Url randomStocks = Url("/api/random_stock");
  static Url addStocks = Url("/api/stocks");
  static Url fetchBoughtStocks = Url("/api/stocks");
  //static Url fetchBoughtStocks = Url("/api/stocks/bought-stocks");

  //urls realted to the saving goals
  static Url fetchSavingGoal = Url("/api/savings/fetch");
  static Url addSaving = Url("/api/savings");
  static Url editSaving = Url("/api/saving/");

  //urls realted to the payments;
  static Url fetchUpcomingPayment = Url("/api/upcoming");

  //urls for the balanceCard
  static Url fetchBalance = Url("/api/get-balance-info"); //get

  //urls for the balanceChart
  static Url fetchBalanceHistory = Url("/api/get-balance-card");

  //urls for the expenses
  static Url addExpense = Url("/api/expenses");
  static Url fetchExpenseCategories = Url("/api/all-expense-categories");
  static Url Function(String) fetchExpense =
      (duration) => Url("/api/expenses/fetch?duration=$duration");

  static Url Function(dynamic, String) fetchExpenseItem =
      (id, duration) => Url("/api/expense-categories/$id?duration=$duration");
  //urls for the transaction
  static Url Function(String) getTransactionRecord =
      (duration) => Url("/api/get-transaction-record");
  static Url Function(
      String, String, String, String, String) getTransactionRecords = (
    from,
    to,
    type,
    bank,
    search,
  ) =>
      Url("/api/transactions/fetch?from=$from&to=$to&type=$type&bank=$bank&search=$search");

  //urls related to the income
  static Url addIncome = Url('/api/incomes');
  static Url fetchIncomeCategories = Url("/api/all-expense-categories");
  static Url fetchUserIncomeCategories = Url("/api/expenses-category");
  static Url Function(dynamic, String) fetchIncomeItem =
      (id, duration) => Url("/api/income-categories/$id?duration=$duration");
  static Url Function(String) fetchIncome =
      (duration) => Url("/api/incomes/fetch?duration=$duration");

  //static Url Function(dynamic) fetchItems =
  //    (id) => Url("/api/get-expense-items?id=$id");
  //
  //get the last 30 days data from python
  static Url getlast30 = Url("");
  static Url getStockDetail = Url("");

  //python url
  static String pythonBaseUrl = "http://127.0.0.1:5000/";
  static Url Function(dynamic, String) getStockInsights =
      (id, symbol) => Url("/get-stock-insights?id=$id&name=$symbol");
  static Url Function(dynamic, String) getStockChart =
      (id, symbol) => Url("/get-stock-chart?id=$id&name=$symbol");
  static Url Function(dynamic, String) getCurrentStockData =
      (id, symbol) => Url("/get-current-data?id=$id&name=$symbol");
  static Url Function(dynamic, String) getForecastData =
      (id, symbol) => Url("/get-forecast-data?id=$id&name=$symbol");
  static Url Function(dynamic, String) getLSTMChart =
      (id, symbol) => Url("/get-stock-lstm?id=$id&name=$symbol");
}
