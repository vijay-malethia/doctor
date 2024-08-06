import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';

import '/ui/common/app_colors.dart';
import '/ui/common/widgets/loader.dart';
import '../../common/images.dart';
import '../../common/ui_helpers.dart';
import 'report_viewmodel.dart';

class ReportView extends StackedView<ReportViewModel> {
  final String id;
  const ReportView({required this.id, Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ReportViewModel viewModel,
    Widget? child,
  ) {
    return SafeArea(
        child: Scaffold(
            appBar: renderAppBar(context, viewModel),
            body: viewModel.isBusy
                ? const Loader()
                : SingleChildScrollView(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                        viewModel.isBusy
                            ? const Loader()
                            : GridView.builder(
                                shrinkWrap: true,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        mainAxisExtent: 205,
                                        mainAxisSpacing: 10,
                                        crossAxisSpacing: 10,
                                        crossAxisCount: 2),
                                itemCount: viewModel.reportList.length,
                                itemBuilder: (context, index) => viewModel
                                            .reportList[index]['reportName']
                                            .toString()
                                            .trim() ==
                                        ""
                                    ? Container()
                                    : reportsListView(
                                        viewModel, index, context))
                      ]))));
  }

//////////////////////////////////////////////////////////////Report List View///////////////////////////////////////////////////////////////////////////////
  reportsListView(ReportViewModel viewModel, int index, BuildContext context) {
    return GestureDetector(
        onLongPress: () {
          viewModel.toggleSelection(index: index);
        },
        onTap: () {
          longPressed ? viewModel.toggleSelection(index: index) : '';
        },
        child: Container(
            decoration: BoxDecoration(
                color: longPressed
                    ? viewModel.reportList[index]['selected']
                        ? primaryColor
                        : Colors.white
                    : Colors.white,
                borderRadius: BorderRadius.circular(9),
                boxShadow: const [
                  BoxShadow(
                      color: Color.fromARGB(255, 243, 242, 242),
                      blurRadius: 10.0,
                      offset: Offset(7.0, 8.0))
                ]),
            child: Column(children: [
              longPressed
                  ? selectedReportWidget(index, viewModel)
                  : viewModel.reportList[index]['reportPath'] == ""
                      ? uploadReport(context, viewModel, index)
                      : imageWidget(viewModel, index),
              verticalSpaceMedium,
              Text(viewModel.reportList[index]['reportName'].toString(),
                  style: longPressed
                      ? viewModel.reportList[index]['selected']
                          ? Theme.of(context).textTheme.displayMedium
                          : Theme.of(context).textTheme.displayLarge
                      : Theme.of(context).textTheme.displayLarge)
            ])));
  }

/////////////////////////////////////////////////////////////////////selected Reports////////////////////////////////////////////////////////////////////////
  selectedReportWidget(index, ReportViewModel viewModel) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Container(
            alignment: Alignment.bottomCenter,
            height: 105,
            width: 140,
            child: Icon(Icons.check_circle_outlined,
                size: 50,
                color: viewModel.reportList[index]['selected']
                    ? Colors.white
                    : Colors.grey)));
  }

////////////////////////////////////////////////////////////////////////// App Bar///////////////////////////////////////////////////////////////////////////
  AppBar renderAppBar(BuildContext context, ReportViewModel viewModel) {
    return AppBar(
        titleSpacing: 0,
        centerTitle: false,
        automaticallyImplyLeading: false,
        title: Text('Reports', style: Theme.of(context).textTheme.bodyLarge),
        leadingWidth: 46,
        actions: [
          longPressed
              ? GestureDetector(
                  onTap: () {
                    viewModel.shareSelectedReports();
                  },
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: SvgPicture.asset(Images().shareIcon)))
              : IconButton(
                  onPressed: () {
                    viewModel.toggleSelection();
                  },
                  icon: const Icon(Icons.share_rounded, size: 16))
        ],
        leading: Container(
            padding: const EdgeInsets.only(left: 11.57),
            child: IconButton(
                onPressed: () {
                  longPressed ? viewModel.back() : viewModel.goBack();
                },
                icon: Icon(longPressed ? Icons.close : Icons.arrow_back_ios,
                    size: 16, color: Colors.white))),
        elevation: 0,
        backgroundColor: primaryColor);
  }

///////////////////////////////////////////////////////////////////// Report Not Uploaded////////////////////////////////////////////////////////////////////////////
  uploadReport(BuildContext context, ReportViewModel viewModel, index) {
    return GestureDetector(
        onLongPress: () {},
        onTap: () {
          viewModel.showUploadOptionsBottomSheet(
              viewModel.reportList[index]['reportName'], id);
        },
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: DottedBorder(
                color: Colors.grey,
                dashPattern: const [7, 7],
                strokeWidth: 2,
                child: SizedBox(
                    height: 105,
                    width: 140,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.upload, color: Colors.grey),
                          verticalSpaceSmall,
                          Text("Upload",
                              style: Theme.of(context).textTheme.titleMedium)
                        ])))));
  }

  //////////////////////////////////////////////////////////////// Uploaded Report/////////////////////////////////////////////////////////////////////////////////
  imageWidget(ReportViewModel viewModel, index) {
    return GestureDetector(
        onTap: () {
          viewModel.preview(index);
        },
        child: Column(children: [
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                InkWell(
                    onTap: () {
                      viewModel.showUploadOptionsBottomSheet(
                          viewModel.reportList[index]['reportName'], id);
                    },
                    child: SvgPicture.asset(Images().reUploadIcon,
                        height: 20, width: 20))
              ])),
          Container(
              alignment: Alignment.center,
              width: 140,
              height: 90,
              child: Stack(children: [
                SvgPicture.asset(Images().uploadedReport),
                Container(
                    margin: const EdgeInsets.fromLTRB(60, 65, 0, 0),
                    height: 20,
                    width: 20,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(28))),
                    child: SvgPicture.asset(Images().checkIcon))
              ]))
        ]));
  }

  @override
  ReportViewModel viewModelBuilder(BuildContext context) =>
      ReportViewModel()..getReportsName(id: id);
}
