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
  static RxList<PieData> pieDataList = <PieData>[].obs;

  static RxList<Assets> debtData = <Assets>[].obs;
  static RxList<PieData> debtPieChartData = <PieData>[].obs;
}
