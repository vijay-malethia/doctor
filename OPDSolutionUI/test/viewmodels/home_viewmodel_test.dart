import 'package:flutter_test/flutter_test.dart';
import 'package:opdsolutionui/app/app.locator.dart';
import 'package:opdsolutionui/ui/views/home/home_viewmodel.dart';

import '../helpers/test_helpers.dart';

void main() {
  HomeViewModel _getModel() => HomeViewModel();

  group('HomeViewmodelTest -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());

    group('incrementCounter -', () {
      test('When called once should return  Counter is: 1', () {});
    });

    group('showBottomSheet -', () {
      test('When called, should show custom bottom sheet using notice variant',
          () {
        // model.showBottomSheet();
      });
    });
  });
}
