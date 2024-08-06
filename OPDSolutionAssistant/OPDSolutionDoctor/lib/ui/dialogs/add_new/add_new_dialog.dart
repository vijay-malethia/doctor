import 'package:flutter/material.dart';
import 'package:opd_doctor/ui/common/app_colors.dart';
import 'package:opd_doctor/ui/common/ui_helpers.dart';
import 'package:opd_doctor/widgets/button.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../widgets/search_input.dart';
import 'add_new_dialog_model.dart';

class AddNewDialog extends StackedView<AddNewDialogModel> {
  final DialogRequest request;
  final Function(DialogResponse) completer;
  final TextEditingController _addController = TextEditingController();

  AddNewDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    AddNewDialogModel viewModel,
    Widget? child,
  ) {
    return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        backgroundColor: primaryColor,
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                            child: SearchInput(
                                maxLines: 1,
                                controller: _addController,
                                hintText: 'Add Here'))
                      ])),
              verticalSpaceSmall,
              Row(children: [
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
                                    border: Border.all(
                                        width: 3, color: Colors.white),
                                    borderRadius: BorderRadius.circular(10)),
                                child: const Text('Cancel',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 21)))))),
                horizontalSpaceSmall,
                Expanded(
                    child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Button(
                            onPressed: () {
                              completer.call(DialogResponse(
                                  confirmed: true, data: _addController.text));
                            },
                            title: "Add",
                            height: 40,
                            isWhiteBg: true)))
              ])
            ])));
  }

  @override
  AddNewDialogModel viewModelBuilder(BuildContext context) =>
      AddNewDialogModel();

  @override
  void onDispose(AddNewDialogModel viewModel) {
    super.onDispose(viewModel);
    _addController.dispose();
  }
}
