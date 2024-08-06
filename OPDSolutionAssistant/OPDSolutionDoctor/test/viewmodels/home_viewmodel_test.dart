import 'package:flutter_test/flutter_test.dart';
import 'package:opd_doctor/app/app.locator.dart';
import 'package:opd_doctor/ui/views/home/home_viewmodel.dart';

import '../helpers/test_helpers.dart';

void main() {
  HomeViewModel getModel() => HomeViewModel();

  group('HomeViewmodelTest -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());

    group('showBottomSheet -', () {
      test('When called, should show custom bottom sheet using notice variant',
          () {});
    });
  });
}
