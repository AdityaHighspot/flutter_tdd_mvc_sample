import 'dart:convert';
import 'package:flutter_random_list/app/list-posts/post_item.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class PostListController extends GetxController {
  var items = <PostItem>[].obs;
  http.Client httpClient;

  PostListController({required this.httpClient});

  @override
  void onInit() {
    super.onInit();
    fetchBlogPosts();
  }

  Future<void> fetchBlogPosts() async {
    try {
      var response = await httpClient.get(
        Uri.parse('https://json-placeholder.mock.beeceptor.com/posts'),
      );
      if (response.statusCode == 200) {
        List<dynamic> jsonData = json.decode(response.body);
        List<PostItem> blogPosts = jsonData.map((data) {
          return PostItem(
            id: data['id'],
            title: data['title'],
            body: data['body'],
            link: data['link'],
            commentCount: data['comment_count'],
          );
        }).toList();
        items.assignAll(blogPosts);
      } else {
        Get.snackbar('Error', 'Failed to fetch blog posts');
      }
    } catch (e) {
      Get.snackbar('Error', 'Network error occurred');
    }
  }
}
