import 'package:flutter/material.dart';
import 'package:opd_doctor/ui/common/app_colors.dart';
import 'package:opd_doctor/ui/common/ui_helpers.dart';
import 'package:opd_doctor/ui/views/patient/patient_view.form.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../common/utils.dart';
import '../../views/patient/patient_viewmodel.dart';

class AddReportsSheet extends StackedView<PatientViewModel> with $PatientView {
  final Function(SheetResponse response)? completer;
  final SheetRequest request;
  const AddReportsSheet({
    Key? key,
    required this.completer,
    required this.request,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    PatientViewModel viewModel,
    Widget? child,
  ) {
    final orientation = MediaQuery.of(context).orientation;
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Add Reports',
                    style: TextStyle(
                        color: Color.fromARGB(255, 3, 116, 237),
                        fontSize: 20,
                        fontWeight: FontWeight.w700)),
                IconButton(
                    onPressed: () {
                      completer!.call(SheetResponse(confirmed: true));
                    },
                    padding: const EdgeInsets.all(0),
                    icon:
                        const Icon(Icons.close, size: 30, color: primaryColor))
              ],
            ),
            verticalSpaceSmall,
            renderSearch(viewModel),
            verticalSpaceSmall,
            viewModel.isBusy
                ? const Center(child: CircularProgressIndicator())
                : Expanded(
                    child: GridView.builder(
                      shrinkWrap: true,
                      itemCount:
                          filteredChips.isEmpty && searchController.text.isEmpty
                              ? reportsItems.length
                              : filteredChips.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 15,
                          childAspectRatio:
                              MediaQuery.of(context).size.height * 0.008,
                          crossAxisCount:
                              (orientation == Orientation.portrait) ? 3 : 4),
                      itemBuilder: (BuildContext context, int index) {
                        return filteredChips.isEmpty &&
                                searchController.text.isEmpty
                            ? buildChipItem(
                                reportsItems[index], context, index, viewModel)
                            : buildChipItem(filteredChips[index], context,
                                index, viewModel);
                      },
                    ),
                  ),
            verticalSpaceMedium
          ]),
    );
  }

  Row renderSearch(PatientViewModel viewModel) {
    return Row(
      children: [
        Expanded(
          flex: 5,
          child: TextFormField(
              textInputAction: TextInputAction.done,
              controller: searchController,
              maxLines: 1,
              autofocus: false,
              onChanged: viewModel.filterChipsDiagnosis,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16)),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: Colors.grey.shade200),
                  ),
                  filled: true,
                  fillColor: bglightColor,
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 19, horizontal: 15.0),
                  hintText: 'Add custom report here'),
              style: const TextStyle(
                  color: Color.fromARGB(255, 23, 24, 26),
                  fontSize: 16,
                  fontWeight: FontWeight.w500)),
        ),
        horizontalSpaceMedium,
        if (filteredChips.isEmpty && searchController.text.isNotEmpty)
          Expanded(
            child: InkWell(
                child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    height: 47,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text('Add',
                            style: TextStyle(
                                fontFamily: 'Lato',
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 18)))),
                onTap: () async {
                  dismissKeyboard();
                  await viewModel.addReports(
                      reportName: searchController.text.toString());
                  searchController.clear();
                }),
          )
      ],
    );
  }

  /// Returns a ChoiceChip
  Widget buildChipItem(name, context, index, PatientViewModel viewModel) {
    bool isSelected =
        selectedReportList.any((ele) => ele['reportName'] == name);
    return InkWell(
      onTap: () {
        viewModel.onReportsChipSelect(
            selectedReportList.any((ele) => ele['reportName'] == name)
                ? false
                : true,
            name,
            index);
      },
      child: Container(
          decoration: BoxDecoration(
              color: isSelected ? primaryColor : bglightColor,
              borderRadius: BorderRadius.circular(10)),
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: isSelected ? Colors.white : Colors.black),
          )),
    );
  }

  @override
  PatientViewModel viewModelBuilder(BuildContext context) => PatientViewModel();
  @override
  void onDispose(PatientViewModel viewModel) {
    super.onDispose(viewModel);
    disposeForm();
  }
}
