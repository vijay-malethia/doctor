import 'package:flutter/material.dart';
import 'package:opdsolutionui/ui/common/ui_helpers.dart';
import 'package:opdsolutionui/ui/views/consultation/consultation_view.form.dart';
import 'package:opdsolutionui/ui/views/consultation/consultation_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../common/widgets/input.dart';
import '/ui/common/widgets/button.dart';

class AddMedicineSheet extends StackedView<ConsultationViewModel>
    with $ConsultationView {
  final Function(SheetResponse response)? completer;
  final SheetRequest request;
  const AddMedicineSheet({
    Key? key,
    required this.completer,
    required this.request,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ConsultationViewModel viewModel,
    Widget? child,
  ) {
    ScrollController _scrollController = ScrollController();
    return WillPopScope(
      onWillPop: () async {
        completer!
            .call(SheetResponse(confirmed: true, data: selectedMedicineList));
        searchController.clear();
        return Future.value(false);
      },
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Medicine',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                  IconButton(
                      onPressed: () {
                        completer!.call(SheetResponse(
                            confirmed: true, data: selectedMedicineList));
                        searchController.clear();
                      },
                      icon: const Icon(Icons.close, size: 30))
                ],
              ),
              verticalSpaceMedium,
              Row(
                children: [
                  Expanded(
                      child: Input(
                          prefixIcon: const Icon(Icons.search),
                          autofocus: false,
                          hintText: 'Search/Add custom Medicine here',
                          maxLines: 1,
                          onChanged: viewModel.filterChipsMedicine,
                          controller: searchController)),
                  horizontalSpaceMedium,
                  if (filteredChips.isEmpty && searchController.text.isNotEmpty)
                    SizedBox(
                        height: 60,
                        width: 120,
                        child: Button(
                            onPressed: () {
                              viewModel.addMedicine(
                                  medicineName:
                                      searchController.text.toString(),
                                  controller: searchController);
                            },
                            title: 'Add'))
                ],
              ),
              verticalSpaceLarge,
              // viewModel.isBusy
              // ? Container(
              //     alignment: Alignment.center,
              //     child: const CircularProgressIndicator())
              // :
              SizedBox(
                  height: 500,
                  child: Scrollbar(
                    controller: _scrollController,
                    thickness: 10,
                    thumbVisibility: true,
                    child: ListView(
                        controller: _scrollController,
                        shrinkWrap: true,
                        children: [
                          Wrap(
                            spacing: 8.0,
                            runSpacing: 8.0,
                            children: filteredChips.isEmpty &&
                                    searchController.text.isEmpty
                                ? medicineItems.asMap().entries.map((entry) {
                                    final index = entry.key;
                                    final name = entry.value;
                                    return buildChipItem(
                                        name, context, index, viewModel);
                                  }).toList()
                                : filteredChips.asMap().entries.map((entry) {
                                    final index = entry.key;
                                    final name = entry.value;
                                    return buildChipItem(
                                        name, context, index, viewModel);
                                  }).toList(),
                          ),
                        ]),
                  ))
            ],
          ),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
        ),
      ),
    );
  }

  @override
  ConsultationViewModel viewModelBuilder(BuildContext context) =>
      ConsultationViewModel();

  /// Returns a ChoiceChip
  Widget buildChipItem(name, context, index, ConsultationViewModel viewModel) {
    final bool isSelected =
        selectedMedicineList.any((item) => item.medicine == name);

    return ChoiceChip(
        label: Text(name),
        selected: isSelected,
        selectedColor: Colors.blue.withOpacity(0.3),
        backgroundColor: isSelected
            ? Colors.blue.withOpacity(0.3)
            : Colors.grey.withOpacity(0.3),
        labelStyle: const TextStyle(color: Colors.black),
        onSelected: (value) =>
            viewModel.onMedicineChipSelect(value, name, index));
  }
}
