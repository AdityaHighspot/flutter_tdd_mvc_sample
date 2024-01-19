import 'package:flutter/material.dart';
import 'package:flutter_random_list/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('App should run without errors', (WidgetTester tester) async {
    await tester.pumpWidget(const HomePage());
    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
