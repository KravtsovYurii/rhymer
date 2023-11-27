import 'package:auto_route/auto_route.dart';
import 'package:example/ui/ui.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HistoryScreen extends StatelessWidget {
  const HistoryScreen({
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
              child: Text("Історія"),
            ),
            elevation: 0,
            surfaceTintColor: Colors.transparent,
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 16)),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 1.6,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return const RhymeHistoryCard(
                    rhymes: [
                      "Рифма 1",
                      "Рифма 2",
                      "Рифма 3",
                      "Рифма 4",
                    ],
                  );
                },
                childCount: 20,
              ),
            ),
          )
        ],
      ),
    );
  }
}
