import "dart:convert";
import "package:flutter/material.dart";
import "package:walletwise/api/fetcher.dart";
import 'package:http/http.dart' as http;
import "package:walletwise/api/urls/app_urls.dart";

class ModelOperation {
  Future<http.Response?> add(
      {required body,
      required Url url,
      HttpMethod? method,
      Function? successAction,
      Function? errorAction}) async {
    if (body != null) {
      try {
        http.Response? response =
            await FetchAPI(url, method ?? HttpMethod.post, body: body)
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
    String? listKey,
    Function? successAction,
  }) async {
    try {
      print(apiUrl.value);
      var response = await FetchAPI(
              apiUrl, HttpMethod.get) // Ensure the correct HTTP method is used.
          .fetchAuthorizedAPI();

      if (response.statusCode == 200) {
        print(response.body);
        //tryL to convert it into the list
        try {
          List<dynamic> jsonResponse = [];
          if (listKey != null) {
            jsonResponse = jsonDecode(response.body)[listKey];
            print(jsonDecode(response.body)[listKey]);
          } else {
            jsonResponse = jsonDecode(response.body);
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
      print(response?.body);
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
