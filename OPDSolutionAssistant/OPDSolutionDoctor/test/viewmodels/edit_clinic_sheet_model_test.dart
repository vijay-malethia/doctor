import 'package:flutter_test/flutter_test.dart';
import 'package:opd_doctor/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('EditClinicSheetModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
