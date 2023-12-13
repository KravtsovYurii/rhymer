import 'package:auto_route/auto_route.dart';
import 'package:example/features/history/bloc/history_rhymes_bloc.dart';
import 'package:example/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class HistoryScreen extends StatefulWidget {
  const HistoryScreen({
    super.key,
  });

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  void initState() {
    BlocProvider.of<HistoryRhymesBloc>(context).add(LoadHistoryRhymes());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HistoryRhymesBloc, HistoryRhymesState>(
        builder: (context, state) {
          return CustomScrollView(
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
              if (state is HistoryRhymesLoaded)
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  sliver: SliverGrid(
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      mainAxisSpacing: 10.0,
                      crossAxisSpacing: 10.0,
                      childAspectRatio: 1.6,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        return RhymeHistoryCard(
                          word: state.rhymes[index].word,
                          rhymes: state.rhymes[index].name,
                        );
                      },
                      childCount: state.rhymes.length,
                    ),
                  ),
                )
            ],
          );
        },
      ),
    );
  }
}
