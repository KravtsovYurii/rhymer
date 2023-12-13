import 'package:equatable/equatable.dart';
import 'package:example/api/api.dart';
import 'package:example/api/models/models.dart';
import 'package:example/repositories/history/history.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'rhymer_list_event.dart';
part 'rhymer_list_state.dart';

class RhymerListBloc extends Bloc<RhymerListEvent, RhymerListState> {
  RhymerListBloc({
    required RhymerApiClient apiClient,
    required HistoryRepositoryInterface historyRepository,
  })  : _historyRepository = historyRepository,
        _apiClient = apiClient,
        super(RhymerListInitial()) {
    on<SearchRhymer>(_onSearch);
  }

  final RhymerApiClient _apiClient;
  final HistoryRepositoryInterface _historyRepository;

  Future<void> _onSearch(
    SearchRhymer event,
    Emitter<RhymerListState> emit,
  ) async {
    try {
      emit(RhymerListLoading());
      final rhymers = await _apiClient.getRhymesList(event.query);
      final historyRhymer = rhymers.toHistory(event.query);
      _historyRepository.setRhymer(historyRhymer);
      emit(RhymerListLoaded(rhymers));
    } catch (e) {
      emit(RhymerListFailure(e));
    }
  }
}
