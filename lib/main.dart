import 'package:flutter/material.dart';
import 'package:librum/models/app_state_manager.dart';
import 'package:librum/models/book_manager.dart';
import 'package:librum/ui/home.dart';
import 'package:provider/provider.dart';
import 'package:logging/logging.dart';
import 'data/repository.dart';
import 'network/book_service.dart';
import 'network/service_interface.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'data/memory_repository.dart';

import 'navigation/app_router.dart';

Future<void> main() async {
  _setupLogging();
  await dotenv.load(fileName: '.env');

  runApp(const Librum());
}

void _setupLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((rec) {
    // print('${rec.level.name}: ${rec.time}: ${rec.message}');
  });
}

class Librum extends StatefulWidget {
  const Librum({Key? key}) : super(key: key);

  @override
  State<Librum> createState() => _LibrumState();
}

class _LibrumState extends State<Librum> {
  final _appStateManager = AppStateManager();
  final _bookManager = BookManager();

  late AppRouter _appRouter;

  @override
  void initState() {
    _appRouter = AppRouter(
      appStateManager: _appStateManager,
      bookManager: _bookManager,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<Repository>(
          lazy: false,
          create: (_) => MemoryRepository(),
        ),
        Provider<ServiceInterface>(
          lazy: false,
          create: (_) => BookService.create(),
        )
      ],
      child: MaterialApp(
        title: 'Recipes',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.white,
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: const Home(),
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   final theme = LibrumTheme.light();
  //   return MultiProvider(
  //       providers: [
  //         ChangeNotifierProvider(create: (context) => _appStateManager),
  //         ChangeNotifierProvider(create: (context) => _bookManager),
  //       ],
  //       child: MaterialApp(
  //         theme: theme,
  //         home: Router(
  //           routerDelegate: _appRouter,
  //           backButtonDispatcher: RootBackButtonDispatcher(),
  //         ),
  //       ));
  // }
}
