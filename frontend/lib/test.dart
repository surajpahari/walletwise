import 'package:flutter/material.dart';
import 'package:walletwise/api/fetcher.dart';
import 'package:walletwise/api/urls/app_urls.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  void initState() {
    super.initState();
    FetchAPI(ApiUrls.testUrl, HttpMethod.post).fetchAuthorizedAPI();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
