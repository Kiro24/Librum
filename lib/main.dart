import 'package:flutter/material.dart';
import 'package:librum/models/app_state_manager.dart';
import 'package:librum/models/book_manager.dart';
import 'package:provider/provider.dart';

import 'librum_theme.dart';
import 'navigation/app_router.dart';

void main() {
  runApp(const Librum());
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
