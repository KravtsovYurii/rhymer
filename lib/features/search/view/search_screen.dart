import 'package:auto_route/auto_route.dart';
import 'package:example/features/history/bloc/history_rhymes_bloc.dart';
import 'package:example/features/search/bloc/rhymer_list_bloc.dart';
import 'package:example/features/search/widgets/widgets.dart';
import 'package:example/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          snap: true,
          floating: true,
          title: const Center(
            child: Text("Rhymer"),
          ),
          elevation: 0,
          surfaceTintColor: Colors.transparent,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(70),
            child: SearchButton(
                controller: _searchController,
                onTap: () => _showSearchBottomSheet(context)),
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 16)),
        SliverToBoxAdapter(
          child: BlocBuilder<HistoryRhymesBloc, HistoryRhymesState>(
            builder: (context, state) {
              if (state is! HistoryRhymesLoaded) return const SizedBox();
              return SizedBox(
                height: 100,
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  scrollDirection: Axis.horizontal,
                  itemCount: state.rhymes.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 16),
                  itemBuilder: (context, index) {
                    final rhymes = state.rhymes[index];
                    return RhymeHistoryCard(
                      rhymes: rhymes.name,
                      word: rhymes.word,
                    );
                  },
                ),
              );
            },
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 16)),
        BlocBuilder<RhymerListBloc, RhymerListState>(
          bloc: BlocProvider.of<RhymerListBloc>(context),
          builder: (context, state) {
            if (state is RhymerListLoaded) {
              final rhymes = state.rhymers.episode;
              return SliverList.builder(
                itemBuilder: (context, index) => RhymeListCard(
                  rhyme: rhymes.first,
                ),
              );
            }
            if (state is RhymerListInitial) {
              return const SliverFillRemaining(
                child: RhymesListInitialBanner(),
              );
            }
            return const SliverFillRemaining(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          },
        )
      ],
    );
  }

  Future<void> _showSearchBottomSheet(BuildContext context) async {
    final bloc = BlocProvider.of<RhymerListBloc>(context);
    final query = await showModalBottomSheet<String>(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      context: context,
      builder: (context) => Padding(
        padding: const EdgeInsets.only(top: 85),
        child: SearchRhymesBottomSheet(
          controller: _searchController,
        ),
      ),
    );
    if (query?.isNotEmpty ?? false) {
      bloc.add(SearchRhymer(query: query!));
    }
  }
}
