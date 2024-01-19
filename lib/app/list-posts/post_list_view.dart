import 'package:flutter/material.dart';
import 'package:flutter_random_list/app/list-posts/post_list_controller.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class PostListView extends StatelessWidget {
  const PostListView({super.key});

  @override
  Widget build(BuildContext context) {
    final PostListController controller = Get.put(PostListController(httpClient: http.Client()));
    return Scaffold(
      appBar: AppBar(title: const Text('Blog Posts')),
      body: Obx(
        () {
          return ListView.builder(
            itemCount: controller.items.length,
            itemBuilder: (context, index) {
              final blogPost = controller.items[index];
              return ListTile(
                title: Text(blogPost.title),
                subtitle: Text(blogPost.body),
              );
            },
          );
        },
      ),
    );
  }
}
