import 'dart:convert';

import 'package:balancegame_flutter/model/catalogModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Statistics with ChangeNotifier {
  static const baseUrl = 'http://10.0.2.2:9090';
  late bool success;
  late List<dynamic> data;
  late CatalogListData catalogData;

  Future<void> getStatistics() async {
    final url = Uri.parse('$baseUrl/api/1.0/statistics');

    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      success = extractedData['success'];
      data = extractedData['data'];
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }

  setCatalogData(CatalogListData data) {
    catalogData = data;
    notifyListeners();
  }
}
