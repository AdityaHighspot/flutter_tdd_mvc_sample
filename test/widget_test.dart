import 'package:flutter/material.dart';
import 'package:flutter_random_list/main.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  // testWidgets('Non-200 response should show error Snackbar', (WidgetTester tester) async {
  //   await tester.runAsync(() async {
  //     await tester.pumpWidget(const GetMaterialApp(home: HomePage()));
  //     await tester.tap(find.byType(FloatingActionButton));
  //     await tester.pump();
  //     await tester.pumpAndSettle();
  //     final isSnackbarTextFound = find.text('Failed to fetch item name').evaluate().isNotEmpty;
  //     assert(isSnackbarTextFound, 'Expected Snackbar Text not found');
  //   });
  // });
}
