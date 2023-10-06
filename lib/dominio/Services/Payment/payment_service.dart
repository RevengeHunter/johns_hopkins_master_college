import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../Models/payment_model.dart';
import '../../Utils/constant.dart';
import '../../Utils/sp_global.dart';

class PaymentService {
  final SPGlobal _prefs = SPGlobal();

  Future<List<PaymentModel>> getPayment(
      int idAcademicYear, int idPerson) async {
    Uri url = Uri.parse('$path/PaymentAcademicYear/$idAcademicYear/$idPerson');
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
      List<PaymentModel> paymentList =
          myList.map((e) => PaymentModel.fromJson(e)).toList();
      return paymentList;
    }

    return [];
  }
}
