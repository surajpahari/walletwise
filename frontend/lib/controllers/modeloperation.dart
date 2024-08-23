import "dart:convert";
import "package:flutter/material.dart";
import "package:walletwise/api/fetcher.dart";
import 'package:http/http.dart' as http;
import "package:walletwise/api/urls/app_urls.dart";
import "package:walletwise/constants/app_constant.dart";

class ModelOperation {
  Future<http.Response?> add(
      {required body,
      required Url url,
      HttpMethod? method,
      Function? successAction,
      String baseUrl = AppConstant.baseUrl,
      Function? errorAction}) async {
    if (body != null) {
      try {
        http.Response? response = await FetchAPI(url, method ?? HttpMethod.post,
                baseUrl: baseUrl, body: body)
            .fetchAuthorizedAPI();
        if (response?.statusCode == 200) {
          if (successAction != null) {
            successAction(response?.body);
          }
        } else {
          debugPrint(response?.body);
          if (errorAction != null) {
            errorAction();
          }
        }
      } catch (e) {
        if (errorAction != null) {
          errorAction();
        }
        return null;
      }
    }
  }

  //for fetching the model and storing it the targetList
  static Future<List<T>> fetchFunction<T>(
    Url apiUrl,
    T Function(Map<String, dynamic>) fromJson, {
    List<T>? targetList,
    String baseUrl = AppConstant.baseUrl,
    String? listKey,
    Function? successAction,
  }) async {
    try {
      print(apiUrl.value);
      var response = await FetchAPI(apiUrl, HttpMethod.get,
              baseUrl: baseUrl) // Ensure the correct HTTP method is used.
          .fetchAuthorizedAPI();

      if (response.statusCode == 200) {
        print(response.body);
        //tryL to convert it into the list
        try {
          List<dynamic> jsonResponse = [];

          if (listKey != null) {
            var decodedBody = jsonDecode(response.body);
            if (decodedBody.containsKey(listKey)) {
              jsonResponse = decodedBody[listKey];
              print(jsonResponse);
            } else {
              throw Exception('Key "$listKey" does not exist in the response.');
            }
          } else {
            jsonResponse = jsonDecode(response.body);
          }
          //checking if the response is empty
          if (jsonResponse.isEmpty) {
            targetList?.clear();
            return [];
          }

          List<T> modelList =
              jsonResponse.map((item) => fromJson(item)).toList();

          // If targetList is provided, update it with the fetched data
          if (targetList != null) {
            targetList.clear();
            targetList.addAll(modelList);
            print(targetList);
          }
        } catch (e) {
          print(response);
          print(e);
          throw Exception(e);
        }
        //call the sucess Action then
        if (response?.statusCode == 200) {
          if (successAction != null) {
            successAction(response?.body);
          }
        }
        print('Success: Data fetched and updated.');
        //return modelList; // Return the fetched list
        return [];
      } else {
        throw Exception('Failed to fetch data: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching data');
      throw Exception('Failed to fetch data: $e');
    }
  }

  //for fetching the items with id

  static Future<bool> fetch(Url apiUrl,
      {Function? successAction,
      Function? errorAction,
      String baseUrl = AppConstant.baseUrl}) async {
    try {
      final response = await FetchAPI(apiUrl, HttpMethod.get, baseUrl: baseUrl)
          .fetchAuthorizedAPI();
      print(response?.statusCode);
      if (response?.statusCode == 200) {
        if (successAction != null) {
          successAction(response);
        }
        return true;
      } else {
        debugPrint(response?.body);
        if (errorAction != null) {
          errorAction();
        }
        return false;
      }
    } catch (e) {
      debugPrint('Error: $e');
      if (errorAction != null) {
        errorAction();
      }
      return false;
    }
  }

  static Future<bool> fetchWithId(Url apiUrl,
      {String? id, Function? successAction, Function? errorAction}) async {
    if (id == null) {
      return false;
    }

    try {
      final response =
          await FetchAPI(apiUrl, HttpMethod.get, body: {'id': id.toString()})
              .fetchAuthorizedAPI();
      print(response?.statusCode);
      if (response?.statusCode == 200) {
        if (successAction != null) {
          successAction(response?.body);
        }
        return true;
      } else {
        debugPrint(response?.body);
        if (errorAction != null) {
          errorAction();
        }
        return false;
      }
    } catch (e) {
      debugPrint('Error: $e');
      if (errorAction != null) {
        errorAction();
      }
      return false;
    }
  }
}
