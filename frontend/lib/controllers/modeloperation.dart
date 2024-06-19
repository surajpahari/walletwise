import "dart:convert";
import "package:walletwise/api/fetcher.dart";
import 'package:http/http.dart' as http;
import "package:walletwise/api/urls/app_urls.dart";

class ModelOperation {
  Future<http.Response?> add(
      {required body,
      required Url url,
      Function? successAction,
      Function? errorrAction}) async {
    if (body != null) {
      try {
        http.Response? response =
            await FetchAPI(ApiUrls.addSaving, HttpMethod.post, body: body)
                .fetchAuthorizedAPI();
        if (response?.statusCode == 200) {
          if (successAction != null) {
            successAction(response?.body);
          }
        } else {
          if (errorrAction != null) {
            errorrAction();
          }
        }
      } catch (e) {
        return null;
      }
    }
  }

  static Future<List<T>> fetchFunction<T>(
    Url apiUrl,
    T Function(Map<String, dynamic>) fromJson, {
    List<T>? targetList, // Optional RxList parameter to store fetched data
  }) async {
    try {
      var response = await FetchAPI(
              apiUrl, HttpMethod.get) // Ensure the correct HTTP method is used.
          .fetchAuthorizedAPI();

      if (response.statusCode == 200) {
        final List<dynamic> jsonResponse = jsonDecode(response.body);
        List<T> modelList = jsonResponse.map((item) => fromJson(item)).toList();

        // If targetList is provided, update it with the fetched data
        if (targetList != null) {
          targetList.clear();
          targetList.addAll(modelList);
        }

        print('Success: Data fetched and updated.');
        return modelList; // Return the fetched list
      } else {
        throw Exception('Failed to fetch data: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching data: $e');
      throw Exception('Failed to fetch data: $e');
    }
  }
}
