import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:photo_view/photo_view.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:stacked/stacked.dart';

import '/ui/common/widgets/loader.dart';
import '/ui/common/index.dart';
import 'preview_viewmodel.dart';

// ignore: must_be_immutable
class PreviewView extends StackedView<PreviewViewModel> {
  PreviewView(
      {required this.id,
      required this.result,
      required this.isreport,
      Key? key})
      : super(key: key);

  final result;
  bool isreport;
  final String id;

  @override
  Widget builder(
    BuildContext context,
    PreviewViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
        appBar: renderAppBar(context, viewModel),
        backgroundColor: Colors.white,
        body: viewModel.isBusy
            ? const Loader()
            : Stack(children: [
                // Spacer(),

                PageView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemCount: viewModel.previewData.length,
                  controller: PageController(initialPage: selectedindex),
                  onPageChanged: (index) => viewModel.update(index),
                  itemBuilder: (context, index) {
                    return Container(
                      child: viewModel.previewData[selectedindex]['reportPath']
                                  .split('.')
                                  .last ==
                              'pdf'
                          ? SizedBox(
                              height: MediaQuery.of(context).size.height,
                              width: MediaQuery.of(context).size.width,
                              child: SfPdfViewer.network(
                                  "${viewModel.previewData[selectedindex]['reportPath']}"))
                          : GestureDetector(
                              onTap: () => viewModel.showGrid(),
                              child: SizedBox(
                                height: MediaQuery.of(context).size.height,
                                width: MediaQuery.of(context).size.width,
                                child: PhotoView(
                                  backgroundDecoration:
                                      const BoxDecoration(color: Colors.white),
                                  minScale:
                                      PhotoViewComputedScale.contained * 0.5,
                                  maxScale:
                                      PhotoViewComputedScale.contained * 5,
                                  initialScale:
                                      PhotoViewComputedScale.contained,
                                  imageProvider: NetworkImage(
                                      "${viewModel.previewData[selectedindex]['reportPath']}"),
                                ),
                              ),
                            ),
                    );
                  },
                ),

                SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Spacer(),
                          Padding(
                              padding: const EdgeInsets.only(bottom: 5),
                              child: Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 10),
                                  height: 65,
                                  width: double.infinity,
                                  child: viewModel.isBusy
                                      ? const Center(
                                          child: CircularProgressIndicator())
                                      : ListView.builder(
                                          controller:
                                              viewModel.scrollController,
                                          scrollDirection: Axis.horizontal,
                                          itemCount:
                                              viewModel.previewData.length,
                                          shrinkWrap: true,
                                          itemBuilder: (context, index) {
                                            return GestureDetector(
                                                onTap: () {
                                                  viewModel.showgrid
                                                      ? viewModel.update(index)
                                                      : null;
                                                },
                                                child: AnimatedOpacity(
                                                  opacity: viewModel.showgrid
                                                      ? 1.0
                                                      : 0.0,
                                                  duration: const Duration(
                                                      milliseconds: 600),
                                                  child: Container(
                                                      color: Colors.transparent,
                                                      width: 60,
                                                      child: ColorFiltered(
                                                          colorFilter:
                                                              ColorFilter.mode(
                                                            index ==
                                                                    selectedindex
                                                                ? Colors
                                                                    .transparent
                                                                    .withOpacity(
                                                                        0.5)
                                                                : Colors
                                                                    .transparent,
                                                            BlendMode.srcATop,
                                                          ),
                                                          child: viewModel
                                                                      .previewData[
                                                                          index]
                                                                          [
                                                                          'reportPath']
                                                                      .split(
                                                                          '.')
                                                                      .last ==
                                                                  'pdf'
                                                              ? SvgPicture
                                                                  .asset(
                                                                  Images()
                                                                      .uploadedReport,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                )
                                                              : Image.network(
                                                                  viewModel.previewData[
                                                                          index]
                                                                      ['reportPath'],
                                                                  loadingBuilder:
                                                                      (context,
                                                                          child,
                                                                          loading) {
                                                                  if (loading ==
                                                                      null) {
                                                                    return child;
                                                                  }
                                                                  return const Center(
                                                                      child:
                                                                          CircularProgressIndicator());
                                                                }))),
                                                ));
                                          })))
                        ]))
              ]));
  }

///////////////////////////////////////////////////////////////////app bar///////////////////////////////////////////////////
  AppBar renderAppBar(BuildContext context, PreviewViewModel viewModel) {
    return AppBar(
        leading: Container(
            padding: const EdgeInsets.only(left: 11.57),
            child: IconButton(
                onPressed: () {
                  viewModel.goBack();
                },
                icon: const Icon(Icons.arrow_back_ios,
                    size: 16, color: Colors.white))),
        titleSpacing: 15,
        centerTitle: false,
        leadingWidth: 30,
        automaticallyImplyLeading: false,
        title: Text(viewModel.previewData[selectedindex]['name'],
            style: Theme.of(context).textTheme.bodyLarge),
        actions: [
          Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(right: 12),
              child: Text(
                  DateFormat('MMMM dd, yyyy')
                      .format(viewModel.previewData[selectedindex]['date']),
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.white)))
        ],
        elevation: 0,
        backgroundColor: primaryColor);
  }

  @override
  PreviewViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      PreviewViewModel()..init(result, id);
}
