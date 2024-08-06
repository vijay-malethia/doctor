import 'package:flutter_test/flutter_test.dart';
import 'package:opdsolutionui/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('MedicineViewModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
