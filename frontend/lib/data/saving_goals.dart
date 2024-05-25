import "package:get/get.dart";
import "package:walletwise/models/saving.dart";

class SavingGoalData {
  static RxList<Saving> savinglist = <Saving>[
    Saving(
        title: "Macbook", amount: 1000, note: "need to save", date: "Oct-12"),
    Saving(
        title: "Macbook", amount: 1000, note: "need to save", date: "Oct-12"),
  ].obs;
}
