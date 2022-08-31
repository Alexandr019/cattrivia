import 'package:cattrivia/repo/dto/cattrivia_item.dart';
import 'package:cattrivia/service/cat_trivia_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CatTriviaCubit extends Cubit<CatTriviaState> {
  final CatTriviaService _catTriviaService;

  CatTriviaCubit(this._catTriviaService) : super(CatTriviaState());

  void fetchCatTrivia() async {
    emit(CatTriviaState(isLoading: true));
    CatData cattrivias = await _catTriviaService.fetchCatTrivia();
    emit(CatTriviaState(cattrivias: cattrivias));
  }
}

class CatTriviaState {
  final CatData? cattrivias;
  final bool isLoading;

  CatTriviaState({this.isLoading = false, this.cattrivias});
}
