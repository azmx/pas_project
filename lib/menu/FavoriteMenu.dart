import 'package:flutter/material.dart';
import 'package:pas_project/database/databasehelper.dart';
import 'package:pas_project/model/PostModel.dart';
import 'package:pas_project/widget/reuseblecard.dart';


class FavoriteMenu extends StatefulWidget {
  const FavoriteMenu({Key? key}) : super(key: key);

  @override
  _FavoriteState createState() => _FavoriteState();
}

class _FavoriteState extends State<FavoriteMenu> {
  List<PostModel> favoriteList = [];

  @override
  void initState() {
    super.initState();
    fetchFavorites();
  }

  Future<void> fetchFavorites() async {
    final favorites = await DatabaseHelper.instance.getFavorites();
    setState(() {
      favoriteList = favorites;
    });
  }

  Future<void> deleteFavorite(String teamName) async {
    await DatabaseHelper.instance.removeFavorite(teamName);
    fetchFavorites(); 
  }

  void showDeleteConfirmationDialog(String teamName) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Confirm Delete"),
          content: Text("Are you sure you want to delete this favorite?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                deleteFavorite(teamName);
                Navigator.of(context).pop();
              },
              child: Text("Delete"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: favoriteList.isEmpty
          ? Center(child: Text("No favorites yet", style: TextStyle(color: Colors.white)))
          : ListView.builder(
              itemCount: favoriteList.length,
              itemBuilder: (context, index) {
                final post = favoriteList[index];
                return ReusableCard(
                  leading: post.strBadge.isNotEmpty
                      ? Image.network(post.strBadge, width: 50, height: 50)
                      : Icon(Icons.image, color: Colors.white),
                  title: post.strTeam,
                  trailing: IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () => showDeleteConfirmationDialog(post.strTeam),
                  ),
                );
              },
            ),
    );
  }
}