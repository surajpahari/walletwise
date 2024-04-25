import "dart:convert";
import "package:walletwise/api/fetcher.dart";
import "package:walletwise/api/urls/app_urls.dart";
import "package:walletwise/models/income.dart";

class IncomeContorller {
  static Future<dynamic> addIncome(Income income) async {
    String incomeJson = jsonEncode(income.toJson());
    var response = await FetchAPI(ApiUrls.addIncome, HttpMethod.post,
        body: {'income': incomeJson}).fetchAuthorizedAPI();
    if (response.statusCode == 200) {
      print(response.body);
      print("Adding Income");
    } else {
      throw Exception('Failed to load budgets');
    }
  }
}
