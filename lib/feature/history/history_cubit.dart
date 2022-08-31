import 'package:cattrivia/repo/dto/cattrivia_item.dart';
import 'package:cattrivia/service/cat_trivia_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryCubit extends Cubit<HistoryState> {
  final CatTriviaService _catTriviaService;

  HistoryCubit(this._catTriviaService) : super(HistoryState());

  void fetchHistory() async {
    emit(HistoryState(isLoading: true));
    List<CatData> cattrivias = await _catTriviaService.fetchHistory();
    emit(HistoryState(cattrivias: cattrivias));
  }
}

class HistoryState {
  final List<CatData> cattrivias;
  final bool isLoading;

  HistoryState({this.isLoading = false, this.cattrivias = const []});
}
