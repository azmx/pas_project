// views/post_detail_view.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_project/database/databasehelper.dart';
import 'package:pas_project/model/PostModel.dart';

class PostDetailView extends StatelessWidget {
  final PostModel post;  // Use the entire PostModel

  const PostDetailView({required this.post, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(post.strTeam),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Center(
                    child: Image.network(
                      post.strBadge,
                      width: 100,
                      height: 100,
                      errorBuilder: (context, error, stackTrace) =>
                          Icon(Icons.broken_image, size: 100),
                    ),
                  ),
                ),
                Obx(() => IconButton(
                      icon: Icon(
                        Icons.favorite,
                        color: post.isFavorite.value
                            ? Colors.red
                            : Colors.grey[500],
                      ),
                      onPressed: () async {
                        post.isFavorite.value = !post.isFavorite.value;
                        if (post.isFavorite.value) {
                          await DatabaseHelper.instance.addFavorite(post);
                        } else {
                          await DatabaseHelper.instance
                              .removeFavorite(post.strTeam);
                        }

                        
                      },
                    )),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              'League: ${post.strLeague}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  post.strDescriptionEN,
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}