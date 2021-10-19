import 'package:flutter/material.dart';
import 'package:librum/models/app_state_manager.dart';
import 'package:librum/models/book_manager.dart';
import 'package:provider/provider.dart';
import 'package:logging/logging.dart';

import 'librum_theme.dart';
import 'navigation/app_router.dart';

void main() {
  _setupLogging();
  runApp(const Librum());
}

void _setupLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((rec) {
    print('${rec.level.name}: ${rec.time}: ${rec.message}');
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
    final theme = LibrumTheme.light();
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => _appStateManager),
          ChangeNotifierProvider(create: (context) => _bookManager),
        ],
        child: MaterialApp(
          theme: theme,
          home: Router(
            routerDelegate: _appRouter,
            backButtonDispatcher: RootBackButtonDispatcher(),
          ),
        ));
  }
}
