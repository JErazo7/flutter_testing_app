import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test/test.dart';
import 'package:testing_app/controllers/favorites.dart';

void main() {
  late ProviderContainer container;
  setUp(() {
    container = ProviderContainer();
  });
  group('Testing App Provider', () {
    test('A new item should be added', () {
      var number = 35;
      container.read(favoritesProvider.notifier).add(number);
      expect(container.read(favoritesProvider).contains(number), true);
    });

    test('An item should be removed', () {
      var number = 45;
      container.read(favoritesProvider.notifier).add(number);
      expect(container.read(favoritesProvider).contains(number), true);
      container.read(favoritesProvider.notifier).remove(number);
      expect(container.read(favoritesProvider).contains(number), false);
    });
  });
}
