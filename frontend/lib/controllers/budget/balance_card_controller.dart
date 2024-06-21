import 'dart:convert';
import 'package:walletwise/api/fetcher.dart';
import 'package:walletwise/api/urls/app_urls.dart';
import 'package:walletwise/controllers/modeloperation.dart';
import 'package:walletwise/data/balance_card.dart';

class BalanceCardController {
  static void fetch() {
    ModelOperation().add(
      body: {},
      url: ApiUrls.fetchBalance,
      method: HttpMethod.get,
      successAction: (response) {
        final data = jsonDecode(response);
        BalanceCardData.balance.value = data['total_amount'];
      },
    );
  }
}
