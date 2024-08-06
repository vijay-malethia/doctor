// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedDialogGenerator
// **************************************************************************

import 'package:stacked_services/stacked_services.dart';

import 'app.locator.dart';
import '../ui/dialogs/add_new/add_new_dialog.dart';
import '../ui/dialogs/confirm/confirm_dialog.dart';

enum DialogType {
  addNew,
  confirm,
}

void setupDialogUi() {
  final dialogService = locator<DialogService>();

  final Map<DialogType, DialogBuilder> builders = {
    DialogType.addNew: (context, request, completer) =>
        AddNewDialog(request: request, completer: completer),
    DialogType.confirm: (context, request, completer) =>
        ConfirmDialog(request: request, completer: completer),
  };

  dialogService.registerCustomDialogBuilders(builders);
}
