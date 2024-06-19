import "package:get/get.dart";
import "package:walletwise/data/graph_data.dart";
import "package:walletwise/models/assets.dart";

class AssetDebtData {
  static RxString hell = "hell".obs;
  static void addAsset(Assets asset) {
    assetsData.add(asset);
    pieDataList.add(PieData(name: asset.name, value: asset.amount));
  }

  static RxList<Assets> assetsData = <Assets>[].obs;
  static RxList<PieData> pieDataList = [
    PieData(value: 5000000, name: "Realstate"),
    PieData(value: 80000, name: "Developer setup"),
    PieData(value: 30000, name: "Wego")
  ].obs;

  static RxList<Assets> debtData = <Assets>[].obs;
  static RxList<PieData> debtPieChartData = [
    PieData(value: 4000, name: "Sushant"),
    PieData(name: "gym", value: 450),
    PieData(name: "college", value: 80000)
  ].obs;
}
