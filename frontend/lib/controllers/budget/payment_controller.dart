import "package:walletwise/api/fetcher.dart";
import "package:walletwise/api/urls/app_urls.dart";
import "package:walletwise/controllers/modeloperation.dart";
import "package:walletwise/data/payment_data.dart";
import "package:walletwise/models/payment.dart";

class PaymentController {
  static Future<void> fetchPayment() async {
    try {
      ModelOperation.fetchFunction(
          ApiUrls.fetchUpcomingPayment, (json) => Payment.fromJson(json),
          targetList: PaymentData.paymentlist, listKey: "expenses");
    } catch (e) {
      print('Error: $e');
    }
  }

  static Future<void> fetchPaymentt() async {
    try {
      var response = await FetchAPI(ApiUrls.fetchUpcomingPayment,
              HttpMethod.post) // Ensure the correct HTTP method is used.
          .fetchAuthorizedAPI();
      if (response.statusCode == 200) {
        print("${response.body} ");
        // Parse the JSON string
        //Map<String, dynamic> jsonResponse = jsonDecode(responseBody);
        // Access the expenses array
        //List<dynamic> expenses = jsonResponse['expenses'];
        //final List<dynamic> jsonResponse =
        //    jsonDecode(response.body); // Ensure response is a list
        //print(response.body.expense);
        //var savings = jsonResponse
        //    .map((item) => Payment.fromJson(item))
        //    .toList(); // Map JSON to Saving objects
        //PaymentData.paymentlist.assignAll(savings);
        //print("Success: Savings fetched and updated.");
      } else {
        throw Exception('Failed to fetch savings: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching savings: $e');
      throw Exception('Failed to fetch savings: $e');
    }
  }
}
