import 'package:cattrivia/utils/di_utils.dart' as di_utils;
import 'package:cattrivia/utils/navigation.dart';
import 'package:cattrivia/utils/project_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  di_utils.setup();
  await Hive.initFlutter();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ],
    );
    return MaterialApp(
      title: 'Cat Trivia',
      initialRoute: Routes.cattrivia.name,
      navigatorKey: Navigation.navigatorKey,
      onGenerateRoute: ProjectRouter.generateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
