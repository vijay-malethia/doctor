import 'package:flutter/material.dart';
import 'package:opdsolutionui/ui/common/app_colors.dart';
import 'package:opdsolutionui/ui/common/ui_helpers.dart';
import 'package:opdsolutionui/ui/dialogs/add_item/add_item_dialog.form.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../common/widgets/input.dart';
import 'add_item_dialog_model.dart';

@FormView(fields: [
  FormTextField(name: 'add'),
])
class AddItemDialog extends StackedView<AddItemDialogModel>
    with $AddItemDialog {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const AddItemDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    AddItemDialogModel viewModel,
    Widget? child,
  ) {
    return Dialog(
      // insetPadding: const EdgeInsets.symmetric(horizontal: 200),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                      child: Input(
                    maxLines: 1,
                    controller: addController,
                    hintText: 'Add Here...',
                    textStyle: const TextStyle(color: Colors.black),
                  ))
                ],
              ),
            ),
            verticalSpaceMedium,
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: GestureDetector(
                      onTap: () {
                        completer.call(DialogResponse(confirmed: false));
                      },
                      child: Container(
                        height: 40,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: primaryColor),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Text(
                          'Cancel',
                          style: TextStyle(
                            color: primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: GestureDetector(
                      onTap: () {
                        completer.call(DialogResponse(
                            confirmed: true, data: addController.text));
                      },
                      child: Container(
                        height: 40,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: primaryColor,
                          border: Border.all(width: 0.5, color: primaryColor),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Text(
                          'Save',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  AddItemDialogModel viewModelBuilder(BuildContext context) =>
      AddItemDialogModel();

  @override
  void onDispose(AddItemDialogModel viewModel) {
    super.onDispose(viewModel);
    disposeForm();
  }
}
