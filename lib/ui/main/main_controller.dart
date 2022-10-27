import 'package:dio/dio.dart';
import 'package:git_get/base/base_controller.dart';
import 'package:git_get/data/model/post_model.dart';

class MainController extends BaseController {
  List<PostModel?>? listPost = [];


  @override
  void onInit() {
    super.onInit();
    getPosts();
  }

  void getPosts() async {
    try {
      var response = await networkCore.dio.get("/posts");
      for (var element in (response.data as List)) {
        listPost?.add(PostModel.fromJson(element));
        update();
      }} on DioError catch(e) {
      print(e.error);
    }
  }
}