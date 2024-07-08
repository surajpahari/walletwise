import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:get/get.dart';
import 'package:walletwise/constants/app_colors.dart';
import 'package:walletwise/data/graph_data.dart';
import 'package:walletwise/utils/gaps/Xgap.dart';

class MyPieChart extends StatelessWidget {
  final RxList<PieData> data;
  MyPieChart(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Obx(
                  () {
                    double otherValue = 0.0;
                    List<PieChartSectionData> sections = [];
                    for (int i = 0; i < data.length; i++) {
                      if (i < 3) {
                        sections.add(PieChartSectionData(
                          showTitle: false,
                          titleStyle: const TextStyle(color: Colors.white),
                          value: data[i].value,
                          title: data[i].name,
                          color: getColor(i),
                          radius: 20,
                        ));
                      } else {
                        otherValue += data[i].value;
                      }
                    }

                    if (otherValue > 0) {
                      sections.add(PieChartSectionData(
                        showTitle: false,
                        titleStyle: const TextStyle(color: Colors.white),
                        value: otherValue,
                        title: 'Other',
                        color: getColor(3),
                        radius: 20,
                      ));
                    }

                    return data.isNotEmpty
                        ? PieChart(
                            PieChartData(
                              sectionsSpace: 4,
                              borderData: FlBorderData(show: false),
                              centerSpaceRadius: 50,
                              sections: sections,
                            ),
                            swapAnimationDuration:
                                const Duration(milliseconds: 150), // Optional
                            swapAnimationCurve: Curves.linear,
                          )
                        : const Text("Data not found");
                  },
                ),
                Obx(() => Text(
                      data
                          .fold(0.0, (sum, item) => sum + item.value)
                          .toString(),
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    )),
              ],
            ),
          ),
          Obx(() {
            double otherValue = 0.0;
            List<PieIndicator> indicators = [];
            for (int i = 0; i < 3 && i < data.length; i++) {
              indicators.add(PieIndicator(
                color: getColor(i),
                isSquare: false,
                text: data[i].name,
                textColor: AppColors.white,
              ));
            }
            for (int i = 3; i < data.length; i++) {
              otherValue += data[i].value;
            }
            if (otherValue > 0) {
              indicators.add(PieIndicator(
                color: getColor(3),
                isSquare: false,
                text: 'Others',
                textColor: AppColors.white,
              ));
            }
            return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: indicators);
          }),
        ],
      ),
    );
  }

  Color getColor(int index) {
    return AppColors.pieChartColors[index % AppColors.pieChartColors.length];
  }
}

class PieIndicator extends StatelessWidget {
  const PieIndicator({
    super.key,
    required this.color,
    required this.text,
    required this.isSquare,
    this.size = 16,
    this.textColor,
  });

  final Color color;
  final String text;
  final bool isSquare;
  final double size;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: isSquare ? BoxShape.rectangle : BoxShape.circle,
            color: color,
          ),
        ),
        const SizedBox(
          width: 4,
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: textColor ?? Colors.black,
            overflow: TextOverflow.fade,
          ),
        ),
      ],
    );
  }
}
