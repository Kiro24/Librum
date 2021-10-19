import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:librum/models/app_state_manager.dart';

import '../navigation/librum_pages.dart';

class SplashScreen extends StatefulWidget {
  static MaterialPage page() {
    return MaterialPage(
      name: LibrumPages.splashPath,
      key: ValueKey(LibrumPages.splashPath),
      child: const SplashScreen(),
    );
  }

  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Provider.of<AppStateManager>(context, listen: false).initializeApp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            SizedBox(
              height: 200,
              width: 200,
              child: FlutterLogo(),
            ),
            Text('Loading...'),
          ],
        ),
      ),
    );
  }
}
