import 'package:flutter/material.dart';
import 'package:flutter_random_list/app/list-posts/post_list_controller.dart';
import 'package:flutter_random_list/app/list-posts/post_list_view.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:http/testing.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;

class MockHttpClient extends Mock implements http.Client {}

late MockClient mockClient;
void main() {
  group('PostListView Tests', () {
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
    testWidgets('Displays a list of blog posts', (WidgetTester tester) async {
      await controller.fetchBlogPosts();
      expect(controller.items.length, 1);
      await tester.pumpWidget(const GetMaterialApp(
        home: PostListView(),
      ));
      await tester.pumpAndSettle();
      expect(find.byType(ListTile), findsWidgets);
    });

    testWidgets('itemBuilder builds items based on mock data', (WidgetTester tester) async {
      await tester.pumpWidget(const GetMaterialApp(
        home: PostListView(),
      ));
      await tester.pumpAndSettle();
      expect(find.text('Introduction to Artificial Intelligence'), findsOneWidget);
    });
  });
}
