import 'package:flutter/material.dart';

class StatisticsItemWidget extends StatelessWidget {
  final String questionName;
  final int selection1;
  final int selection2;

  const StatisticsItemWidget(
      this.questionName, this.selection1, this.selection2);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 100,
      child: Container(
        child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 24,
              horizontal: 12,
            ),
            child: Row(
              children: [
                Text(questionName),
                Text('선택1: ${selection1 / (selection1 + selection2) * 100}%'),
                Text('선택2: ${selection2 / (selection1 + selection2) * 100}%'),
              ],
            )),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(2),
              topRight: Radius.circular(2),
              bottomLeft: Radius.circular(2),
              bottomRight: Radius.circular(2)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 4,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
      ),
    );
  }
}
