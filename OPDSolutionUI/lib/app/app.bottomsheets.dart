// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedBottomsheetGenerator
// **************************************************************************

import 'package:stacked_services/stacked_services.dart';

import 'app.locator.dart';
import '../ui/bottom_sheets/add_diagnosis/add_diagnosis_sheet.dart';
import '../ui/bottom_sheets/add_medicine/add_medicine_sheet.dart';
import '../ui/bottom_sheets/add_report/add_report_sheet.dart';
import '../ui/bottom_sheets/image_picker/image_picker_sheet.dart';
import '../ui/bottom_sheets/select_item/select_item_sheet.dart';

enum BottomSheetType {
  selectItem,
  addDiagnosis,
  addReport,
  addMedicine,
  imagePicker,
}

void setupBottomSheetUi() {
  final bottomsheetService = locator<BottomSheetService>();

  final Map<BottomSheetType, SheetBuilder> builders = {
    BottomSheetType.selectItem: (context, request, completer) =>
        SelectItemSheet(request: request, completer: completer),
    BottomSheetType.addDiagnosis: (context, request, completer) =>
        AddDiagnosisSheet(request: request, completer: completer),
    BottomSheetType.addReport: (context, request, completer) =>
        AddReportSheet(request: request, completer: completer),
    BottomSheetType.addMedicine: (context, request, completer) =>
        AddMedicineSheet(request: request, completer: completer),
    BottomSheetType.imagePicker: (context, request, completer) =>
        ImagePickerSheet(request: request, completer: completer),
  };

  bottomsheetService.setCustomSheetBuilders(builders);
}
