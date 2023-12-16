import "package:walletwise/data/repositories/response_repository.dart";

class MessageService {
  final WwResponse wwResponse;

  MessageService({required this.wwResponse});

  Future<String> fetchMessage(String url) async {
    try {
      final response = await wwResponse.fetch(url);
      return response['message'] as String;
    } catch (e) {
      // Handle errors, e.g., log or throw a custom exception.
      print('Error fetching message: $e');
      rethrow;
    }
  }
}
