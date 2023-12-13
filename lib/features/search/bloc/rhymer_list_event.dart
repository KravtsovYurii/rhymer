part of 'rhymer_list_bloc.dart';

sealed class RhymerListEvent extends Equatable {
  const RhymerListEvent();

  @override
  List<Object> get props => [];
}

class SearchRhymer extends RhymerListEvent {
  const SearchRhymer({required this.query});

  final String query;

  @override
  List<Object> get props => super.props..addAll([query]);
}
