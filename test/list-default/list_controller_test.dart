import 'package:flutter/material.dart';
import 'package:flutter_random_list/app/list-default/item.dart';
import 'package:flutter_random_list/app/list-default/list_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:mockito/mockito.dart';
import 'list_controller_test.mocks.dart';

class MockHttpClient extends Mock implements http.Client {}

@GenerateMocks([GetInterface])
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late MockGetInterface mockGet;

  setUp(() {
    mockGet = MockGetInterface();
    Get.testMode = true;
    Get.replace(mockGet);
  });

  group('ListController Tests', () {
    test('Item should be added on successful network call', () async {
      final mockClient = MockClient((request) async {
        return http.Response('{"title": "Mock Post Title"}', 200);
      });

      final controller = ListController(httpClient: mockClient);

      expect(controller.items.length, 0);

      await controller.addItem();

      expect(controller.items.length, 1);
      expect(controller.items.last.name, 'Mock Post Title');
    });
  });

  group('ListView Widget Tests', () {
    testWidgets('ListTile should display item names', (WidgetTester tester) async {
      final listController = ListController(httpClient: MockHttpClient());
      Get.put(listController);
      listController.items.add(Item('Item 1'));
      listController.items.add(Item('Item 2'));
      await tester.pumpWidget(
        GetMaterialApp(
          home: Scaffold(
            body: ListView.builder(
              itemCount: listController.items.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(listController.items[index].name),
              ),
            ),
          ),
        ),
      );
      expect(find.text('Item 1'), findsOneWidget);
      expect(find.text('Item 2'), findsOneWidget);
    });
  });
}
