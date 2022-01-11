import 'package:balacegame_flutter/widgets/statistics_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'package:balacegame_flutter/providers/Statistics.dart';

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
                final catalogQuestionList = catalogQuestion.data.toString();
                final catalogQuestionLine = catalogQuestionList.split('\n');
                List<List<String>> catalogQuestionLineSplit = [];
                for (var row in catalogQuestionLine) {
                  catalogQuestionLineSplit.add(row.split('/'));
                }
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      StatisticsItemWidget(
                        catalogQuestionLine[0],
                        statisticsData.data[0]['result1'],
                        statisticsData.data[1]['result1'],
                      ),
                      StatisticsItemWidget(
                        catalogQuestionLine[1],
                        statisticsData.data[0]['result2'],
                        statisticsData.data[1]['result2'],
                      ),
                      StatisticsItemWidget(
                        catalogQuestionLine[2],
                        statisticsData.data[0]['result3'],
                        statisticsData.data[1]['result3'],
                      ),
                      StatisticsItemWidget(
                        catalogQuestionLine[3],
                        statisticsData.data[0]['result4'],
                        statisticsData.data[1]['result4'],
                      ),
                      StatisticsItemWidget(
                        catalogQuestionLine[4],
                        statisticsData.data[0]['result5'],
                        statisticsData.data[1]['result5'],
                      ),
                      StatisticsItemWidget(
                        catalogQuestionLine[5],
                        statisticsData.data[0]['result6'],
                        statisticsData.data[1]['result6'],
                      ),
                      StatisticsItemWidget(
                        catalogQuestionLine[6],
                        statisticsData.data[0]['result7'],
                        statisticsData.data[1]['result7'],
                      ),
                      StatisticsItemWidget(
                        catalogQuestionLine[7],
                        statisticsData.data[0]['result8'],
                        statisticsData.data[1]['result8'],
                      ),
                      StatisticsItemWidget(
                        catalogQuestionLine[8],
                        statisticsData.data[0]['result9'],
                        statisticsData.data[1]['result9'],
                      ),
                      StatisticsItemWidget(
                        catalogQuestionLine[9],
                        statisticsData.data[0]['result10'],
                        statisticsData.data[1]['result10'],
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
