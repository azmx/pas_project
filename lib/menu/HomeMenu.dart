import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/PostController.dart';
import '../pages/PostDetailView.dart';

class Homemenu extends StatelessWidget {
  final PostController postController = Get.put(PostController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Obx(() {
        if (postController.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          );
        }
        return ListView.builder(
          itemCount: postController.postList.length,
          itemBuilder: (context, index) {
            final post = postController.postList[index];

            return Card(
              color: Colors.grey[850],
              child: ListTile(
                leading: post.strBadge.isNotEmpty
                    ? Image.network(
                        post.strBadge,
                        width: 50,
                        height: 50,
                        errorBuilder: (context, error, stackTrace) =>
                            Icon(Icons.broken_image, color: Colors.white),
                      )
                    : Icon(Icons.image, color: Colors.white),
                title: Text(
                  post.strTeam,
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Get.to(PostDetailView(post: post));
                },
              ),
            );
          },
        );
      }),
    );
  }
}