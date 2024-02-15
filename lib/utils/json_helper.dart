import 'dart:convert';

import 'package:db_miner/screen/home/model/home_model.dart';
import 'package:flutter/services.dart';

class JsonHelper {
  Future<List<HomeModel>> jsonToModel() async {
    var json = await rootBundle.loadString('assets/json/quotes.json');
    List quotes = jsonDecode(json);
    List<HomeModel> quotesList =
        quotes.map((e) => HomeModel.mapToModel(e)).toList();
    return quotesList;
  }
}
