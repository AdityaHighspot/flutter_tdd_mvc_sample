import 'dart:convert';
import 'dart:math';
import 'package:get/get.dart';
import 'item.dart';
import 'package:http/http.dart' as http;

class ListController extends GetxController {
  var items = <Item>[].obs;
  final http.Client httpClient;

  ListController({required this.httpClient});

  Future<void> addItem() async {
    try {
      var response = await fetchItemName();
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        items.add(Item(data['title']));
      } else {
        Get.snackbar('Error', 'Failed to fetch item name');
      }
    } catch (e) {
      Get.snackbar('Error', 'Network error occurred');
    }
  }

  Future<http.Response> fetchItemName() async {
    var randomPostId = Random().nextInt(100) + 1;
    var url = Uri.parse('https://json-placeholder.mock.beeceptor.com/posts/$randomPostId');
    return await httpClient.get(url);
  }
}
