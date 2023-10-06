import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../Models/bimester_model.dart';
import '../../Utils/constant.dart';
import '../../Utils/sp_global.dart';

class BimesterService {
  final SPGlobal _prefs = SPGlobal();

  Future<List<BimesterModel>> getAllBimesters(int idAcademicYear) async {
    Uri url = Uri.parse('$path/Bimester?AcademicYearId=$idAcademicYear');
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
      List<BimesterModel> bimesterList =
          myList.map((e) => BimesterModel.fromJson(e)).toList();
      return bimesterList;
    }

    return [];
  }
}
