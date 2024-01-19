import 'package:flutter_random_list/app/auth/login_controller.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('LoginController', () {
    final controller = LoginController();

    test('Initial values are correct', () {
      expect(controller.email.value, '');
      expect(controller.password.value, '');
    });

    test('Can update email and password', () {
      controller.email.value = 'test@example.com';
      controller.password.value = 'password123';

      expect(controller.email.value, 'test@example.com');
      expect(controller.password.value, 'password123');
    });
  });
}
