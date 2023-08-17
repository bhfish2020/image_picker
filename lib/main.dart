
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'routes/route_helper.dart';

final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError();
});

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPreferences = await SharedPreferences.getInstance();

  runApp(
      ProviderScope(
          overrides: [
            // override the previous value with the new object
            sharedPreferencesProvider.overrideWithValue(sharedPreferences),
          ],
          child: MyApp()
      )///widget that stores the state of providers




  );
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  static bool testFlag = false;

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    final router = ref.watch(RouteHelper().goRouterProvider);// watches for changes in router


    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Sample Name',
      routerConfig: router,


    );
  }
}