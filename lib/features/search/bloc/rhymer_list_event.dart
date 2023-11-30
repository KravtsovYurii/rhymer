part of 'rhymer_list_bloc.dart';

sealed class RhymerListEvent extends Equatable {
  const RhymerListEvent();

  @override
  List<Object> get props => [];
}

class SearchRhymer extends RhymerListEvent {
  const SearchRhymer();

  @override
  List<Object> get props => super.props;
}
