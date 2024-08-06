import 'package:flutter/material.dart';
import 'package:opdsolutionui/ui/common/ui_helpers.dart';
import 'package:opdsolutionui/ui/views/symptom/symptom_view.form.dart';
import 'package:opdsolutionui/ui/views/symptom/symptom_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

@FormView(fields: [
  FormTextField(name: 'search'),
])
class SymptomsView extends StackedView<SymptomsViewModel> with $SymptomsView {
  SymptomsView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SymptomsViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leading: IconButton(
                alignment: Alignment.centerLeft,
                onPressed: () {
                  viewModel.goBack();
                },
                icon: const Icon(Icons.arrow_back_ios_new_outlined,
                    color: Colors.black))),
        body: viewModel.isBusy
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    child: Column(mainAxisSize: MainAxisSize.min, children: [
                      renderSearch(viewModel),
                      verticalSpaceMedium,
                      renderSymptom(viewModel),
                      verticalSpaceLarge,
                      verticalSpaceLarge
                    ])),
              ));
  }

  renderSymptom(SymptomsViewModel viewModel) {
    return Card(
        elevation: 10,
        child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(children: <Widget>[
              Row(mainAxisAlignment: MainAxisAlignment.start, children: const [
                Expanded(
                    flex: 1,
                    child: Text("S.no :", textAlign: TextAlign.center)),
                Expanded(
                    flex: 3,
                    child: Text("Symptoms :", textAlign: TextAlign.center)),
                Expanded(
                    flex: 2,
                    child: Text("Status :", textAlign: TextAlign.center))
              ]),
              const Divider(color: Colors.grey),
              SizedBox(
                  child: Scrollbar(
                      thickness: 5,
                      radius: const Radius.circular(20),
                      child: ListView.builder(
                          shrinkWrap: true,
                          padding: const EdgeInsets.all(0),
                          itemCount: viewModel.searchResults.isEmpty
                              ? viewModel.responseList.length
                              : viewModel.searchResults.length,
                          itemBuilder: (BuildContext context, int index) {
                            int serialNumber = index + 1;
                            return showList(
                                serialNumber,
                                viewModel,
                                index,
                                viewModel.searchResults.isEmpty
                                    ? viewModel.responseList
                                    : viewModel.searchResults);
                          }))),
              const Divider(color: Colors.grey),
              Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.all(10),
                  child: Text("Total : ${viewModel.responseList.length}"))
            ])));
  }

  Row renderSearch(SymptomsViewModel viewModel) {
    return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
      Expanded(
          flex: 1,
          child: SizedBox(
              child: ElevatedButton(
                  onPressed: () {
                    viewModel.showPop();
                  },
                  child: const Text("Add Symptom",
                      style: TextStyle(fontSize: 16))))),
      const Expanded(flex: 2, child: SizedBox()),
      Expanded(
          flex: 3,
          child: Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.circular(30)),
              child: TextFormField(
                  onChanged: (value) {
                    viewModel.search(value);
                  },
                  controller: searchController,
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.search_outlined),
                      prefixIconColor: Colors.grey,
                      border: InputBorder.none,
                      hintStyle: TextStyle(color: Colors.grey),
                      hintText: "Search Here"))))
    ]);
  }

  Row showList(
      int serialNumber, SymptomsViewModel viewModel, int index, List list) {
    return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
      Expanded(
          flex: 1,
          child: Text(serialNumber.toString(), textAlign: TextAlign.center)),
      Expanded(
          flex: 3,
          child: Text(list[index].listItem, textAlign: TextAlign.center)),
      Expanded(
          flex: 2,
          child: Switch.adaptive(
              value:
                  viewModel.responseList[index].isActive == true ? true : false,
              onChanged: (val) {
                viewModel.switchButton(index);
              }))
    ]);
  }

  @override
  SymptomsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SymptomsViewModel();

  @override
  void onDispose(SymptomsViewModel viewModel) {
    super.onDispose(viewModel);
    disposeForm();
  }
}
