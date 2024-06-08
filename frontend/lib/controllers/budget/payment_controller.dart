import "dart:convert";
import "package:get/get.dart";
import "package:walletwise/api/fetcher.dart";
import "package:walletwise/api/urls/app_urls.dart";
import "package:walletwise/data/payment_data.dart";
import "package:walletwise/models/payment.dart";

class PaymentController {
  static Future<void> fetchPayment() async {
    try {
      var response = await FetchAPI(ApiUrls.fetchUpcomingPayment,
              HttpMethod.get) // Ensure the correct HTTP method is used.
          .fetchAuthorizedAPI();
      if (response.statusCode == 200) {
        print(response);
        final List<dynamic> jsonResponse =
            jsonDecode(response.body); // Ensure response is a list
        print(response.body);
        var savings = jsonResponse
            .map((item) => Payment.fromJson(item))
            .toList(); // Map JSON to Saving objects
        PaymentData.paymentlist.assignAll(savings);
        print("Success: Savings fetched and updated.");
      } else {
        throw Exception('Failed to fetch savings: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching savings: $e');
      throw Exception('Failed to fetch savings: $e');
    }
  }
}
