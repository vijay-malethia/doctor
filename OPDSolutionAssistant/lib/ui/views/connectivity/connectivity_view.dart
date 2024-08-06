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
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
      ),
    );
  }

  @override
  ConnectivityViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ConnectivityViewModel();
}
