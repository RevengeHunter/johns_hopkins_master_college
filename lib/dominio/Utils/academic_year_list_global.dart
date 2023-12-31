import '../Models/academic_year_model.dart';
import '../Services/Academic/academic_year_service.dart';
import 'sp_global.dart';

class AcademicYearListGlobal {
  static final AcademicYearListGlobal _instance = AcademicYearListGlobal._();

  AcademicYearListGlobal._();

  factory AcademicYearListGlobal() {
    return _instance;
  }

  final SPGlobal _sharp = SPGlobal();

  final AcademicYearService _academicYearService = AcademicYearService();
  List<AcademicYearModel> _academicYearList = [];

  List<AcademicYearModel> get getAcademicYearList => _academicYearList;

  createAcademicYearList() async {
    _academicYearList =
        await _academicYearService.getAcademicYearList(_sharp.documentNumber);
  }

  clearAcademicYearList() {
    _academicYearList.clear();
  }
}
