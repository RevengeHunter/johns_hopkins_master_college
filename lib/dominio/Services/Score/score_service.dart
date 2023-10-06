import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../Models/score_model.dart';
import '../../Utils/constant.dart';
import '../../Utils/sp_global.dart';

class ScoreService {
  final SPGlobal _prefs = SPGlobal();

  Future<List<ScoreModel>> getConsolidationScore(int idAcademicYear) async {
    Uri url = Uri.parse('$path/ConsolidateScore/$idAcademicYear');
    http.Response response = await http.get(
      url,
      headers: <String, String>{
        'Accept': 'text/plain',
        'Authorization': 'bearer ${_prefs.jwt}',
      },
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> myMap = jsonDecode(response.body);
      List myList = myMap["data"];
      List<ScoreModel> consolidationScoreList =
          myList.map((e) => ScoreModel.fromJson(e)).toList();
      return consolidationScoreList;
    }

    return [];
  }
}
