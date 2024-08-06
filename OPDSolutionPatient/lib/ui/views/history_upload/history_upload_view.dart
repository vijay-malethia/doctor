import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked/stacked.dart';

import '/ui/common/widgets/loader.dart';
import '/ui/common/index.dart';
import '/ui/common/widgets/button.dart';
import '/ui/common/widgets/input.dart';
import '/ui/common/widgets/dismisskeyboard.dart';
import '/ui/views/history_upload/history_upload_view.form.dart';
import 'history_upload_viewmodel.dart';

List report = [];

@FormView(fields: [
  FormTextField(name: 'doctorName', initialValue: ''),
])
class HistoryUploadView extends StackedView<HistoryUploadViewModel>
    with $HistoryUploadView {
  final String sheetName;
  final String id;

  HistoryUploadView({required this.sheetName, required this.id, Key? key})
      : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HistoryUploadViewModel viewModel,
    Widget? child,
  ) {
    String formattedDate =
        DateFormat('dd/MM/yyyy').format(viewModel.selectedDate);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: renderAppBar(context, viewModel),
        body: viewModel.isBusy
            ? const Loader()
            : Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(children: [
                  verticalSpaceTiny,
                  if (sheetName == 'Journey') ...[
                    Input(
                        onFieldSubmitted: (p0) {
                          dismissKeyboard(context);
                        },
                        autofocus: false,
                        maxLines: 1,
                        textInputAction: TextInputAction.next,
                        controller: doctorNameController,
                        hintText: 'Doctor Name',
                        textStyle: const TextStyle(
                          fontSize: 16,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                        prefixIcon: Container(
                            width: 84,
                            padding: const EdgeInsets.only(left: 18),
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(Images().personIcon),
                                  horizontalSpaceMedium,
                                  Container(
                                    padding: const EdgeInsets.only(bottom: 4),
                                    child: const Text('Dr.',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontFamily: 'Lato',
                                            fontWeight: FontWeight.w500,
                                            color: primaryColor)),
                                  )
                                ]))),
                    verticalSpaceSmall,
                    selectDate(viewModel, context, formattedDate),
                    verticalSpaceSmall,
                    //show selected images
                    renderNewJourneyList(viewModel, context),

                    verticalSpaceMedium,
                    //upload button
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(9),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Color.fromARGB(255, 243, 242, 242),
                                      blurRadius: 10.0,
                                      offset: Offset(7.0, 8.0))
                                ]),
                            child: upload(context, viewModel, onTap: () {
                              viewModel.showUploadOptionsBottomSheet(
                                  sheetName: 'journey');
                            }, index: 0)),
                      ],
                    )
                  ] else ...[
                    selectDate(viewModel, context, formattedDate),
                    verticalSpaceLarge,
                    addNew(viewModel)
                  ]
                ])),
        bottomNavigationBar: viewModel.isBusy
            ? const Center(child: CircularProgressIndicator())
            : bottomBar(viewModel));
  }

//////////////////////////////////////////////////////Selected journey data///////////////////////////////////////////////////////////////
  renderNewJourneyList(HistoryUploadViewModel viewModel, BuildContext context) {
    return Expanded(
      child: GridView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemCount: viewModel.journeyDocuments.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisExtent: 184,
              mainAxisSpacing: 10),
          itemBuilder: (context, index) {
            return Stack(children: [
              Container(
                  width: MediaQuery.of(context).size.width / 2,
                  height: 184,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(9),
                      border: Border.all(color: Colors.white, width: 3),
                      boxShadow: const [
                        BoxShadow(
                            color: Color.fromARGB(255, 243, 242, 242),
                            blurRadius: 10.0,
                            offset: Offset(7.0, 8.0))
                      ]),
                  child: Container(
                      padding: const EdgeInsets.all(5),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(7),
                          child: viewModel.journeyDocuments[index].type == "pdf"
                              ? SvgPicture.asset(Images().uploadedReport,
                                  fit: BoxFit.cover)
                              : Image.file(
                                  File(viewModel
                                      .journeyDocuments[index].content.path),
                                  fit: BoxFit.cover)))),
              Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                      onTap: () {
                        viewModel.removeJourneyFiles(index);
                      },
                      child: Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(28)),
                          child: const Icon(Icons.close,
                              size: 15, color: Colors.white))))
            ]);
          }),
    );
  }

//////////////////////////////////////////////////////////add new/////////////////////////////////////////////////////////////////////////////////
  Expanded addNew(HistoryUploadViewModel viewModel) {
    return Expanded(
        child: GridView.builder(
            itemCount: viewModel.containers.length +
                viewModel.uploadedContainers.length +
                1,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisExtent: 184,
                mainAxisSpacing: 10),
            itemBuilder: (context, index) {
              return Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(9),
                      boxShadow: const [
                        BoxShadow(
                            color: Color.fromARGB(255, 243, 242, 242),
                            blurRadius: 10.0,
                            offset: Offset(7.0, 8.0))
                      ]),
                  child: index < viewModel.uploadedContainers.length
                      ? viewModel.uploadedContainers[index]
                      : index <
                              viewModel.containers.length +
                                  viewModel.uploadedContainers.length
                          ? viewModel.containers[
                              index - viewModel.uploadedContainers.length]
                          : upload(context, viewModel, onTap: () {
                              Widget uploadedWidget =
                                  imageWidget(context, viewModel, index);
                              viewModel.showUploadOptionsBottomSheet(
                                  widget: uploadedWidget, sheetName: sheetName);
                            }, index: index));
            }));
  }

  ////////////////////////////////////////////////////////////////image widget///////////////////////////////////////////////////////////////////////////////
  GestureDetector imageWidget(
      BuildContext context, HistoryUploadViewModel viewModel, index) {
    return GestureDetector(
        onTap: () {},
        child: Column(children: [
          Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                  onTap: () {
                    viewModel.removeUploadedContainer(index);
                  },
                  child: Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(28)),
                      child: const Icon(Icons.close,
                          size: 15, color: Colors.white)))),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Container(
                  alignment: Alignment.center,
                  width: 140,
                  height: 115,
                  child: Stack(children: [
                    SvgPicture.asset(Images().uploadedReport),
                    Container(
                        margin: const EdgeInsets.fromLTRB(60, 65, 0, 0),
                        height: 20,
                        width: 20,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(28))),
                        child: SvgPicture.asset(Images().checkIcon))
                  ])))
        ]));
  }

///////////////////////////////////////////////////////////Upload Report//////////////////////////////////////////////////////////////////////////
  GestureDetector upload(BuildContext context, HistoryUploadViewModel viewModel,
      {void Function()? onTap, index}) {
    return GestureDetector(
        onTap: onTap,
        child: Stack(children: [
          Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: sheetName == " Journey" ? 10 : 20,
                  vertical: sheetName == "Journey" ? 15 : 20),
              child: Column(children: [
                if (sheetName != "Journey") verticalSpaceSmall,
                DottedBorder(
                    color: Colors.grey,
                    dashPattern: const [4, 4],
                    borderType: BorderType.RRect,
                    strokeWidth: 2,
                    child: SizedBox(
                        height: 105,
                        width: sheetName == 'Journey' ? double.infinity : 120,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(Images().uploadIcon,
                                  color: Colors.grey),
                              verticalSpaceSmall,
                              Text("Upload",
                                  style:
                                      Theme.of(context).textTheme.titleMedium),
                            ]))),
                verticalSpaceSmall,
                if (sheetName == "Journey")
                  const Text('Upload Prescription',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color.fromARGB(255, 14, 34, 54)))
              ])),
        ]));
  }

////////////////////////////////////////////////////////Date Picker/////////////////////////////////////////////////////////////////////////////////
  InkWell selectDate(HistoryUploadViewModel viewModel, BuildContext context,
      String formattedDate) {
    return InkWell(
        onTap: () {
          viewModel.selectAppointmentDate(context);
        },
        child: Container(
            height: 58,
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 248, 249, 255),
                border:
                    Border(bottom: BorderSide(color: primaryColor, width: 1))),
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                child: Row(children: [
                  const Icon(Icons.calendar_today_outlined,
                      size: 20, color: primaryColor),
                  horizontalSpaceMedium,
                  Text(formattedDate,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500))
                ]))));
  }

///////////////////////////////////////////////////////////////bottom bar///////////////////////////////////////////////////////////////////////////
  BottomAppBar bottomBar(HistoryUploadViewModel viewModel) {
    return BottomAppBar(
        color: Colors.white,
        elevation: 0,
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Row(children: [
              Expanded(
                  child: Button(
                      onPressed: () {
                        doctorNameController.clear();

                        viewModel.goBack();
                      },
                      title: "Back",
                      height: 55,
                      isWhiteBg: true,
                      border: true)),
              horizontalSpaceSmall,
              Expanded(
                  child: Button(
                      onPressed: () {
                        sheetName == 'Journey'
                            ? viewModel.uploadJourneyFile(
                                date: viewModel.selectedDate,
                                doctorName: doctorNameController,
                                id: id)
                            : viewModel.uploadFile(
                                id: id, date: viewModel.selectedDate);
                      },
                      title: "Save",
                      height: 55))
            ])));
  }

///////////////////////////////////////////////////////////// app bar/////////////////////////////////////////////////////////////////////////
  AppBar renderAppBar(BuildContext context, HistoryUploadViewModel viewModel) {
    return AppBar(
        titleSpacing: 0,
        centerTitle: false,
        automaticallyImplyLeading: false,
        title: Text(
            sheetName == 'Journey' ? 'Add Prescription' : "Upload Report",
            style: Theme.of(context).textTheme.bodyLarge),
        leadingWidth: 46,
        leading: Container(
            padding: const EdgeInsets.only(left: 11.57),
            child: IconButton(
                onPressed: () {
                  viewModel.goBack();
                },
                icon: const Icon(Icons.arrow_back_ios,
                    size: 16, color: Colors.white))),
        elevation: 0,
        backgroundColor: primaryColor);
  }

  @override
  HistoryUploadViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HistoryUploadViewModel();
}
