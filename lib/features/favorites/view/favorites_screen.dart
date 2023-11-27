import 'package:auto_route/auto_route.dart';
import 'package:example/ui/ui.dart';
import 'package:flutter/material.dart';

@RoutePage()
class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            snap: true,
            floating: true,
            title: Center(
              child: Text("Обране"),
            ),
            elevation: 0,
            surfaceTintColor: Colors.transparent,
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 16)),
          SliverList.builder(
            itemBuilder: (context, index) => const RhymeListCard(
              isFavorite: true,
              rhyme: 'Рифма',
              sourceWord: 'Слово',
            ),
          ),
        ],
      ),
    );
  }
}
