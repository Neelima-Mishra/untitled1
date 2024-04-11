import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/resource/routes_manager.dart';
import 'package:untitled1/resource/strings_manager.dart';
import 'app/di.dart';

void main() {
  mainDelegate();
}

Future<void> mainDelegate() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initAppModule();
  initHomeModule();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey();
  final botToastBuilder = BotToastInit();
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState
    super.didChangeAppLifecycleState(state);
    switch (state) {
      case AppLifecycleState.resumed:
        break;
      case AppLifecycleState.inactive:
        break;
      case AppLifecycleState.paused:
        break;
      case AppLifecycleState.detached:
        break;
      case AppLifecycleState.hidden:
        break;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    debugPrint("Inside init state");
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: StringManager.appBarTitle,
      navigatorKey: _navigatorKey,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      builder: (context, child) {
        child = botToastBuilder(context, child);
        return child;
      },
      navigatorObservers: [BotToastNavigatorObserver()],
      initialRoute: Routes.splashRoute,
      onGenerateRoute: RouteGenerator().getRoute,
    );
  }
}
