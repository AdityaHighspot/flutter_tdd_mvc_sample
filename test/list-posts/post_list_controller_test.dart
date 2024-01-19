import 'package:flutter/material.dart';
import 'package:flutter_random_list/app/list-posts/post_item.dart';
import 'package:flutter_random_list/app/list-posts/post_list_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:mockito/mockito.dart';
import 'post_list_controller_test.mocks.dart';

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

  group(
    'PostListController Tests',
    () {
      late PostListController controller;
      late MockClient mockClient;
      setUp(
        () {
          mockClient = MockClient(
            (request) async {
              return http.Response(
                '[{"userId": 1,"id": 1,"title": "Introduction to Artificial Intelligence","body": "Learn the basics of Artificial Intelligence and its applications in various industries.","link": "https://example.com/article1","comment_count": 8}]',
                200,
              );
            },
          );

          controller = PostListController(httpClient: mockClient);
        },
      );
      test('Item should be added on successful network call', () async {
        expect(controller.items.length, 0);
        await controller.fetchBlogPosts();
        expect(controller.items.length, 1);
        expect(controller.items[0].title, 'Introduction to Artificial Intelligence');
      });
    },
  );

  group('PostListView Widget Tests', () {
    late PostListController controller;
    late MockClient mockClient;
    setUp(
      () {
        mockClient = MockClient(
          (request) async {
            return http.Response(
              '[{"userId": 1,"id": 1,"title": "Introduction to Artificial Intelligence","body": "Learn the basics of Artificial Intelligence and its applications in various industries.","link": "https://example.com/article1","comment_count": 8}]',
              200,
            );
          },
        );

        controller = PostListController(httpClient: mockClient);
      },
    );

    testWidgets('ListTile should display item names', (WidgetTester tester) async {
      controller.items.add(PostItem(id: 1, title: 'Some text', body: '', link: '', commentCount: 3));

      await tester.pumpWidget(
        GetMaterialApp(
          home: Scaffold(
            body: ListView.builder(
              itemCount: controller.items.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(controller.items[index].title),
              ),
            ),
          ),
        ),
      );
      expect(find.text('Some text'), findsOneWidget);
    });
  });
}
