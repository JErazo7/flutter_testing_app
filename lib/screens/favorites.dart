import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testing_app/controllers/favorites.dart';

class FavoritesPage extends StatelessWidget {
  static String routeName = '/favorites_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
      ),
      body: Consumer(
        builder: (context, watch, _) {
          var favoritesList = watch(favoritesProvider);

          return ListView.builder(
            itemCount: favoritesList.length,
            padding: const EdgeInsets.symmetric(vertical: 16),
            itemBuilder: (context, index) =>
                FavoriteItemTile(favoritesList[index]),
          );
        },
      ),
    );
  }
}

class FavoriteItemTile extends StatelessWidget {
  final int itemNo;

  const FavoriteItemTile(
    this.itemNo,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.primaries[itemNo % Colors.primaries.length],
        ),
        title: Text(
          'Item $itemNo',
          key: Key('favorites_text_$itemNo'),
        ),
        trailing: IconButton(
          key: Key('remove_icon_$itemNo'),
          icon: Icon(Icons.close),
          onPressed: () {
            context.read(favoritesProvider.notifier).remove(itemNo);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Removed from favorites.'),
                duration: Duration(seconds: 1),
              ),
            );
          },
        ),
      ),
    );
  }
}
