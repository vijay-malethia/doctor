import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';

import 'medicines_viewmodel.dart';
import '/ui/common/index.dart';

class MedicinesView extends StackedView<MedicinesViewModel> {
  const MedicinesView(this.mdedicinesDetails, {Key? key}) : super(key: key);
  final List<dynamic>? mdedicinesDetails;

  @override
  Widget builder(
    BuildContext context,
    MedicinesViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
        // backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
            backgroundColor: primaryColor,
            systemOverlayStyle:
                const SystemUiOverlayStyle(statusBarColor: primaryColor),
            elevation: 0,
            centerTitle: false,
            title:
                Text('Medicines', style: Theme.of(context).textTheme.bodyLarge),
            leadingWidth: 30,
            leading: IconButton(
                padding: const EdgeInsets.only(left: 16),
                onPressed: () {
                  viewModel.goToBack();
                },
                icon: const Icon(Icons.arrow_back_ios,
                    color: Colors.white, size: 18))),
        body: Container(
            padding: const EdgeInsets.only(left: 18, top: 15, bottom: 10),
            child: Column(children: [
              renderHeading(context),
              Expanded(
                  child: SizedBox(
                      child: ListView.builder(
                          shrinkWrap: true,
                          padding: const EdgeInsets.only(top: 10),
                          itemCount: mdedicinesDetails!.length,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                                onTap: () {},
                                child: Container(
                                    margin: const EdgeInsets.only(top: 10),
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        border: Border.all(
                                            color: const Color.fromRGBO(
                                                42, 45, 52, 0.1))),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                              '${index + 1}. ${mdedicinesDetails![index]['medicine']}',
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                  fontFamily: 'Lato',
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500)),
                                          Container(
                                              padding: const EdgeInsets.only(
                                                  top: 10, bottom: 10),
                                              margin: const EdgeInsets.only(
                                                  top: 10, bottom: 10),
                                              decoration: BoxDecoration(
                                                  color: bglightColor,
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                              child: Row(children: [
                                                horizontalSpaceSmall,
                                                renderText(index,
                                                    '${mdedicinesDetails![index]['dose'] ?? ''}'),
                                                renderText(index,
                                                    '${mdedicinesDetails![index]['when'] ?? ''}'),
                                                renderText(index,
                                                    '${mdedicinesDetails![index]['Frequency'] ?? ''}'),
                                                renderText(index,
                                                    '${mdedicinesDetails![index]['duration'] ?? ''}')
                                              ]))
                                        ])));
                          })))
            ])));
  }

//Heading of details
  Row renderHeading(BuildContext context) {
    return Row(children: [
      horizontalSpaceSmall,
      horizontalSpaceTiny,
      Expanded(
          flex: 1,
          child: Text('Dose',
              style: Theme.of(context).textTheme.labelLarge,
              overflow: TextOverflow.ellipsis)),
      Expanded(
          flex: 1,
          child: Text('When', style: Theme.of(context).textTheme.labelLarge)),
      Expanded(
          flex: 1,
          child:
              Text('Frequency', style: Theme.of(context).textTheme.labelLarge)),
      Expanded(
          flex: 1,
          child:
              Text('Duration', style: Theme.of(context).textTheme.labelLarge))
    ]);
  }

//table text
  Expanded renderText(int index, name) {
    return Expanded(
        flex: 1,
        child: Text(name,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
                fontFamily: 'Lato',
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: primaryColor)));
  }

  @override
  MedicinesViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      MedicinesViewModel();
}
