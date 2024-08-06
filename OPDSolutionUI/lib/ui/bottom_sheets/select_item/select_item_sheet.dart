import 'package:flutter/material.dart';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../views/consultation/consultation_viewmodel.dart';
import '/ui/common/ui_helpers.dart';
import '/ui/common/widgets/button.dart';
import '/ui/common/widgets/input.dart';
import '/ui/common/app_colors.dart';
import '/ui/views/consultation/consultation_view.form.dart';

class SelectItemSheet extends StackedView<ConsultationViewModel>
    with $ConsultationView {
  final Function(SheetResponse response)? completer;
  final SheetRequest request;
  const SelectItemSheet({
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
            .call(SheetResponse(confirmed: true, data: selectedSymptomsList));
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
                  const Text('Symptoms',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                  IconButton(
                      onPressed: () {
                        completer!.call(SheetResponse(
                            confirmed: true, data: selectedSymptomsList));
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
                          hintText: 'Search/Add custom Symptom here',
                          prefixIcon:
                              const Icon(Icons.search, color: primaryColor),
                          autofocus: false,
                          maxLines: 1,
                          onChanged: viewModel.filterChipsSymptom,
                          controller: searchController)),
                  horizontalSpaceMedium,
                  SizedBox(
                      height: 60,
                      width: 120,
                      child: Button(
                          onPressed: () {
                            viewModel.addSymptoms(
                                symptomsName: searchController.text.toString(),
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
                                ? symptomsItems.asMap().entries.map((entry) {
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
    final bool isSelected = selectedSymptomsList.contains(name);

    return ChoiceChip(
        label: Text(name),
        selected: isSelected,
        selectedColor: const Color.fromARGB(255, 178, 221, 252),
        backgroundColor: isSelected
            ? Colors.blue.withOpacity(0.3)
            : Colors.grey.withOpacity(0.3),
        labelStyle: const TextStyle(color: Colors.black),
        onSelected: (value) => viewModel.onChipSelect(value, name, index));
  }
}
