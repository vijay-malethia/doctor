import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '/ui/common/widgets/loader.dart';
import '/ui/common/widgets/button.dart';
import '/ui/common/widgets/bottom_bar.dart';
import '/ui/common/index.dart';
import 'history_viewmodel.dart';

class HistoryView extends StackedView<HistoryViewModel> {
  const HistoryView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HistoryViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
        appBar: renderAppBar(context, viewModel),
        body: viewModel.isBusy
            ? const Loader()
            : Column(children: [
                Container(
                    height: 52,
                    color: Colors.white,
                    child: Row(children: [
                      Expanded(
                          child: Button(
                              color: isJouney ? primaryColor : Colors.grey,
                              height: 50,
                              onPressed: () async {
                                viewModel.changeIndex(0);
                                isJouney = true;
                                await viewModel.getJourney();
                              },
                              title: "Journey",
                              isWhiteBg: true)),
                      Expanded(
                          child: Button(
                              color: isJouney ? Colors.grey : primaryColor,
                              height: 50,
                              onPressed: () {
                                viewModel.changeIndex(1);
                                isJouney = false;
                                viewModel.getReports();
                              },
                              title: "Reports",
                              isWhiteBg: true))
                    ])),
                Expanded(
                    child: Stack(children: [
                  SizedBox(
                      width: double.infinity,
                      height: double.infinity,
                      child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: SvgPicture.asset(Images().historyBg,
                              fit: BoxFit.fill))),
                  isJouney
                      ? historySheet(viewModel, child, !isJouney) //journeySheet
                      : historySheet(viewModel, child, !isJouney) //reportSheet
                  // : reportSheet(viewModel, child)
                ]))
              ]),
        bottomNavigationBar: BottomNavigation(currentIndex: 1));
  }

///////////////////////////////////////////////////////////////////app bar/////////////////////////////////////////////////////////////////////////////
  AppBar renderAppBar(BuildContext context, HistoryViewModel viewModel) {
    return AppBar(
        titleSpacing: 0,
        centerTitle: false,
        automaticallyImplyLeading: false,
        title: Text('History', style: Theme.of(context).textTheme.bodyLarge),
        leadingWidth: 20,
        leading: Container(),
        actions: [
          InkWell(
              onTap: () {
                viewModel.add(isJouney ? "Journey" : "Report");
              },
              child: Row(children: [
                const Icon(Icons.add_circle_outline, size: 20),
                horizontalSpaceTiny,
                Text('Add', style: Theme.of(context).textTheme.displayMedium),
                const SizedBox(width: 20)
              ]))
        ],
        elevation: 0,
        backgroundColor: primaryColor);
  }

/////////////////////////////////////////////////////Journey and Reports sheet////////////////////////////////////////////////////////////////////////////////////
  historySheet(HistoryViewModel viewModel, Widget? child, bool isreports) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemCount: viewModel.groupedData.length,
        itemBuilder: (context, index) {
          String yearMonth = viewModel.groupedData.keys.elementAt(index);

          return Column(children: [
            verticalSpaceMedium,
            Container(
                margin: const EdgeInsets.only(left: 10),
                decoration: const BoxDecoration(
                    border: Border(
                  top: BorderSide(width: 2, color: primaryColor),
                  left: BorderSide(
                      width: 2, color: Color.fromRGBO(192, 220, 251, 1)),
                )),
                child: ListTileTheme(
                    contentPadding: const EdgeInsets.all(0),
                    horizontalTitleGap: 0.0,
                    dense: true,
                    minVerticalPadding: 0,
                    child: Theme(
                        data: Theme.of(context)
                            .copyWith(dividerColor: Colors.transparent),
                        child: ExpansionTile(
                            collapsedIconColor: primaryColor,
                            iconColor: primaryColor,
                            collapsedTextColor: primaryColor,
                            textColor: primaryColor,
                            collapsedBackgroundColor: Colors.white,
                            collapsedShape: const Border(
                                bottom:
                                    BorderSide(width: 2, color: primaryColor)),
                            initiallyExpanded: index == 0 ? true : false,
                            title: Container(
                                height: 50,
                                padding:
                                    const EdgeInsets.only(left: 15, bottom: 4),
                                alignment: Alignment.centerLeft,
                                color: Colors.white,
                                child: Text(yearMonth.toString(),
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700))),
                            trailing: Container(
                                padding: const EdgeInsets.only(right: 15),
                                height: 50,
                                color: Colors.white,
                                child: const Icon(Icons.expand_more)),
                            children: [
                              Column(children: [
                                Container(
                                    decoration: const BoxDecoration(
                                        border: Border(
                                            top: BorderSide(
                                                width: 2,
                                                color: primaryColor))),
                                    child: SingleChildScrollView(
                                        child: Column(children: [
                                      ListView.builder(
                                          shrinkWrap: true,
                                          physics:
                                              const BouncingScrollPhysics(),
                                          itemCount: viewModel
                                              .groupedData[yearMonth]?.length,
                                          itemBuilder: (context, index) {
                                            String formattedDate = DateFormat(
                                                    'dd')
                                                .format(viewModel
                                                        .groupedData[yearMonth]
                                                    ?[index]['date']);
                                            return Container(
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 10,
                                                        horizontal: 12),
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12),
                                                    boxShadow: [
                                                      BoxShadow(
                                                          color: Colors
                                                              .grey.shade100,
                                                          blurRadius: 1.0,
                                                          spreadRadius: 1,
                                                          offset: const Offset(
                                                              2, 2))
                                                    ]),
                                                child: ListTileTheme(
                                                    horizontalTitleGap: 0.0,
                                                    dense: true,
                                                    minVerticalPadding: 15,
                                                    child: ExpansionTile(
                                                        iconColor:
                                                            Colors.black54,
                                                        collapsedBackgroundColor:
                                                            Colors.white,
                                                        leading: Container(
                                                            alignment: Alignment
                                                                .center,
                                                            width: 50,
                                                            child: Row(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  const Icon(
                                                                      Icons
                                                                          .calendar_today_outlined,
                                                                      color:
                                                                          primaryColor,
                                                                      size: 18),
                                                                  horizontalSpaceTiny,
                                                                  Text(
                                                                      formattedDate,
                                                                      style: const TextStyle(
                                                                          color:
                                                                              primaryColor,
                                                                          fontSize:
                                                                              14,
                                                                          fontWeight: FontWeight
                                                                              .w700,
                                                                          fontFamily:
                                                                              'Lato'))
                                                                ])),
                                                        title: Row(children: [
                                                          Container(
                                                              margin: const EdgeInsets
                                                                      .only(
                                                                  left: 10,
                                                                  right: 15),
                                                              color: const Color
                                                                      .fromARGB(
                                                                  255,
                                                                  224,
                                                                  224,
                                                                  225),
                                                              width: 1,
                                                              height: 50),
                                                          SvgPicture.asset(
                                                              Images()
                                                                  .userYellowImage,
                                                              height: 41,
                                                              width: 41),
                                                          horizontalSpaceSmall,
                                                          Expanded(
                                                            child: Text(
                                                              isreports == false
                                                                  ? viewModel.groupedData[
                                                                              yearMonth]![
                                                                          index]
                                                                      ['doctor']
                                                                  : viewModel.groupedData[
                                                                              yearMonth]
                                                                          ?[
                                                                          index]
                                                                      [
                                                                      'report'],
                                                              style: const TextStyle(
                                                                  fontSize: 18,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          16,
                                                                          17,
                                                                          18)),
                                                              softWrap: true,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                            ),
                                                          )
                                                        ]),
                                                        children: [
                                                          SingleChildScrollView(
                                                            child: Column(
                                                                children: [
                                                                  // verticalSpaceSmall,
                                                                  const Divider(
                                                                      endIndent:
                                                                          5,
                                                                      indent: 5,
                                                                      color: Colors
                                                                          .black38,
                                                                      height:
                                                                          5.0),
                                                                  verticalSpaceSmall,
                                                                  ListView.builder(
                                                                      physics: const BouncingScrollPhysics(),
                                                                      itemCount: viewModel.groupedData[yearMonth]?[index]['reports'].length,
                                                                      shrinkWrap: true,
                                                                      itemBuilder: (context, reportIndex) {
                                                                        return InkWell(
                                                                          onTap:
                                                                              () {
                                                                            viewModel.gotToPreview(viewModel.groupedData[yearMonth]?[index]['reports'][reportIndex]['reportId'],
                                                                                isreports);
                                                                          },
                                                                          child: Container(
                                                                              child: viewModel.groupedData[yearMonth]?[index]['reports'][reportIndex]['reportPath'].split('.').last == 'pdf'
                                                                                  ? Padding(padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5), child: SizedBox(height: MediaQuery.of(context).size.height, width: MediaQuery.of(context).size.width, child: SfPdfViewer.network(viewModel.groupedData[yearMonth]?[index]['reports'][reportIndex]['reportPath'])))
                                                                                  : Padding(
                                                                                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                                                                                      child: ClipRRect(
                                                                                          borderRadius: BorderRadius.circular(8),
                                                                                          child: Image.network(viewModel.groupedData[yearMonth]?[index]['reports'][reportIndex]['reportPath'], loadingBuilder: (ctx, child, loadingProgress) {
                                                                                            if (loadingProgress == null) {
                                                                                              return child;
                                                                                            }
                                                                                            return const Center(
                                        child: CircularProgressIndicator());
                                                                                          })))),
                                                                        );
                                                                      }),
                                                                  verticalSpaceSmall,
                                                                ]),
                                                          )
                                                        ])));
                                          })
                                    ])))
                              ])
                            ])))),
            verticalSpaceSmall
          ]);
        });
  }

  @override
  HistoryViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HistoryViewModel()
        // ..getReports()
        ..getJourney()
        ..init();
}
