import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'connectivity_viewmodel.dart';

class ConnectivityView extends StackedView<ConnectivityViewModel> {
  const ConnectivityView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ConnectivityViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
        body: Container(
            height: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/noInternet.png')))));
  }

  @override
  ConnectivityViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ConnectivityViewModel();
}
