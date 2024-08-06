import 'package:flutter_test/flutter_test.dart';
import 'package:doc_ease/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('ConnectivityViewModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
