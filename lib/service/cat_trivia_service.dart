import 'package:cattrivia/repo/cat_trivia_repo.dart';
import 'package:cattrivia/repo/dto/cattrivia_item.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

class CatTriviaService {
  late Box catTriviaBox;
  final CatTriviaRepo _catTriviaRepo;

  CatTriviaService(this._catTriviaRepo);

  Future<void> init() async {
    final directory = await getApplicationDocumentsDirectory();
    if (!Hive.isAdapterRegistered(0)) {
      Hive
        ..init(directory.path)
        ..registerAdapter(CatDataAdapter());
    }
    catTriviaBox = await Hive.openBox('catTriviaBox');
  }

  Future<CatData> fetchCatTrivia() async {
    final catTriviaItem = await _catTriviaRepo.fetchCatTrivia();
    catTriviaBox.put(catTriviaItem.dateCreation.toString(), catTriviaItem);
    return catTriviaItem;
  }

  Future<List<CatData>> fetchHistory() async {
    // catTriviaBox = await Hive.openBox('catTriviaBox');
    return catTriviaBox.values.toList().cast<CatData>();
  }
}
