import 'package:flutter_riverpod/flutter_riverpod.dart';

/// The [Favorites] controller holds a list of favorite items saved by the user.
class Favorites extends StateNotifier<List<int>> {
  Favorites() : super(List<int>.empty(growable: true));

  void add(int itemNo) {
    state.add(itemNo);
    state = state;
  }

  void remove(int itemNo) {
    state.remove(itemNo);
    state = state;
  }
}

final favoritesProvider =
    StateNotifierProvider<Favorites, List<int>>((ref) => Favorites());
