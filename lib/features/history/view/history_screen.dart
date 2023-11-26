import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HistoryScreen extends StatelessWidget {
  const HistoryScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            snap: true,
            floating: true,
            title: Center(
              child: Text("Історія"),
            ),
            elevation: 0,
            surfaceTintColor: Colors.transparent,
          ),
          SliverToBoxAdapter(child: SizedBox(height: 16)),
          /*SliverList.builder(
            itemBuilder: (context, index) => const RhymeListCard(
              isFavorite: true,
            ),
          ),*/
        ],
      ),
    );
  }
}
