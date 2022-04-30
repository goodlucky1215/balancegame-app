import 'package:balancegame_flutter/widgets/statistics_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'package:balancegame_flutter/providers/Statistics.dart';

class StatisticsScreen extends StatefulWidget {
  static const routeName = '/statistics';

  @override
  State<StatisticsScreen> createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen> {
  var _isLoading = false;

  @override
  initState() {
    setState(() {
      _isLoading = true;
    });

    Provider.of<Statistics>(context, listen: false).getStatistics().then((_) {
      setState(() {
        _isLoading = false;
      });
    });
    super.initState();
  }

  Future<String> getQuiz(String textPath) async {
    return await rootBundle.loadString(textPath);
  }

  @override
  Widget build(BuildContext context) {
    final statisticsData = Provider.of<Statistics>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('통계'),
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : FutureBuilder(
              future: getQuiz('assets/' +
                  statisticsData.catalogData.catalogId.toString() +
                  '.txt'),
              builder: (BuildContext context,
                  AsyncSnapshot<dynamic> catalogQuestion) {
                if (catalogQuestion.hasData == false) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                final catalogQuestionList = catalogQuestion.data.toString();
                final catalogQuestionLine = catalogQuestionList.split('\n');
                List<List<String>> catalogQuestionLineSplit = [];
                for (var row in catalogQuestionLine) {
                  catalogQuestionLineSplit.add(row.split('/'));
                }

                var aIndex = -1;
                var bIndex = -1;
                var currIdx = 0;
                for (var d in statisticsData.data) {
                  if (d['catalog']['catalogId'] ==
                      statisticsData.catalogData.catalogId) {
                    if (d['choice'] == 1) {
                      aIndex = currIdx;
                    } else {
                      bIndex = currIdx;
                    }
                  }
                  currIdx++;
                }
                return aIndex != -1 && bIndex != -1
                    ? SingleChildScrollView(
                        child: Column(
                          children: [
                            StatisticsItemWidget(
                              catalogQuestionLine[0],
                              statisticsData.data[aIndex]['result1'],
                              statisticsData.data[bIndex]['result1'],
                            ),
                            StatisticsItemWidget(
                              catalogQuestionLine[1],
                              statisticsData.data[aIndex]['result2'],
                              statisticsData.data[bIndex]['result2'],
                            ),
                            StatisticsItemWidget(
                              catalogQuestionLine[2],
                              statisticsData.data[aIndex]['result3'],
                              statisticsData.data[bIndex]['result3'],
                            ),
                            StatisticsItemWidget(
                              catalogQuestionLine[3],
                              statisticsData.data[aIndex]['result4'],
                              statisticsData.data[bIndex]['result4'],
                            ),
                            StatisticsItemWidget(
                              catalogQuestionLine[4],
                              statisticsData.data[aIndex]['result5'],
                              statisticsData.data[bIndex]['result5'],
                            ),
                            StatisticsItemWidget(
                              catalogQuestionLine[5],
                              statisticsData.data[aIndex]['result6'],
                              statisticsData.data[bIndex]['result6'],
                            ),
                            StatisticsItemWidget(
                              catalogQuestionLine[6],
                              statisticsData.data[aIndex]['result7'],
                              statisticsData.data[bIndex]['result7'],
                            ),
                            StatisticsItemWidget(
                              catalogQuestionLine[7],
                              statisticsData.data[aIndex]['result8'],
                              statisticsData.data[bIndex]['result8'],
                            ),
                            StatisticsItemWidget(
                              catalogQuestionLine[8],
                              statisticsData.data[aIndex]['result9'],
                              statisticsData.data[bIndex]['result9'],
                            ),
                            StatisticsItemWidget(
                              catalogQuestionLine[9],
                              statisticsData.data[aIndex]['result10'],
                              statisticsData.data[bIndex]['result10'],
                            ),
                          ],
                        ),
                      )
                    : const Center(
                        child: Text("통계를 가져오지 못했습니다."),
                      );
              },
            ),
    );
  }
}
