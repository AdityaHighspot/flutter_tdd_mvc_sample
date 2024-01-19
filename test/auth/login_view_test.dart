import 'package:flutter/material.dart';
import 'package:flutter_random_list/app/auth/login_controller.dart';
import 'package:flutter_random_list/app/auth/login_view.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';

void main() {
  testWidgets('TextField updates on change', (WidgetTester tester) async {
    final controller = Get.put(LoginController());
    await tester.pumpWidget(const GetMaterialApp(
      home: LoginView(),
    ));
    String testEmail = 'test@example.com';
    String testPassword = 'password123';
    final emailField = find.byWidgetPredicate(
      (Widget widget) => widget is TextField && widget.decoration?.labelText == 'Email',
    );
    final passwordField = find.byWidgetPredicate(
      (Widget widget) => widget is TextField && widget.decoration?.labelText == 'Password',
    );
    await tester.enterText(emailField, testEmail);
    await tester.enterText(passwordField, testPassword);
    await tester.pump(); 
    expect(controller.email.value, testEmail);
    expect(controller.password.value, testPassword);
  });
}
