part of 'rhymer_list_bloc.dart';

sealed class RhymerListState extends Equatable {
  const RhymerListState();

  @override
  List<Object> get props => [];
}

final class RhymerListInitial extends RhymerListState {}

final class RhymerListLoading extends RhymerListState {}

final class RhymerListLoaded extends RhymerListState {
  const RhymerListLoaded(this.rhymers);

  final Rhymes rhymers;

  @override
  List<Object> get props => super.props..add(rhymers);
}

final class RhymerListFailure extends RhymerListState {
  const RhymerListFailure(this.error);
  final Object error;

  @override
  List<Object> get props => super.props..add(error);
}
