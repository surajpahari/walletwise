import "package:walletwise/utils/charts/pie_chart.dart";

class ChartDataMaker {
  static List<PieData> extractList(
      List<dynamic> itemList, String nameKey, String valueKey) {
    List<PieData> resultList = [];

    for (dynamic item in itemList) {
      // Get the value of 'nameKey' property
      dynamic nameValue = item[nameKey];

      // Get the value of 'valueKey' property
      dynamic valueValue = item[valueKey];

      // Create a PieData object with the extracted properties and add it to the result list
      resultList.add(PieData(name: nameValue, value: valueValue.toDouble()));
    }

    return resultList;
  }
}
