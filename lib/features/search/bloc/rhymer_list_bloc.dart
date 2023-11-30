import 'package:equatable/equatable.dart';
import 'package:example/api/api.dart';
import 'package:example/api/models/models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'rhymer_list_event.dart';
part 'rhymer_list_state.dart';

class RhymerListBloc extends Bloc<RhymerListEvent, RhymerListState> {
  RhymerListBloc({
    required this.apiClient,
  }) : super(RhymerListInitial()) {
    on<SearchRhymer>(_onSearch);
  }

  final RhymerApiClient apiClient;

  Future<void> _onSearch(
    SearchRhymer event,
    Emitter<RhymerListState> emit,
  ) async {
    try {
      emit(RhymerListLoading());
      final rhymers = await apiClient.getRhymesList();
      emit(RhymerListLoaded(rhymers));
    } catch (e) {
      emit(RhymerListFailure(e));
    }
  }
}
