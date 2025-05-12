import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import '/utils/authentication_backend.dart';
import '/utils/firestore_api.dart';
import '/utils/page_switcher.dart';
import '/utils/video_play_service.dart';

import './signup_signin_module/wrapper.dart';
import './theme/theme_control.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  void getCurrentAppTheme() async {
    themeChangeProvider.darkTheme =
        await themeChangeProvider.darkThemePreference.getTheme();
  }

  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => themeChangeProvider,
        ),
        ChangeNotifierProvider(
          create: (_) => VideoPlayService.instance(),
        ),
        ChangeNotifierProvider(
          create: (_) => FirestoreAPI.instance(),
        ),
        ChangeNotifierProvider(
          create: (_) => AuthUtil.instance(),
        ),
        ChangeNotifierProvider(
          create: (_) => PageSwitcher.instance(),
        ),
      ],
      child: Consumer5(
        builder: (
          ctx,
          DarkThemeProvider darkThemeProvider,
          VideoPlayService videoPlayService,
          FirestoreAPI firestoreAPI,
          AuthUtil user,
          PageSwitcher switcher,
          child,
        ) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode: Provider.of<DarkThemeProvider>(ctx).getCurrentTheme,
            theme: DarkThemeProvider.customLightTheme,
            darkTheme: DarkThemeProvider.customDarkTheme,
            home: const Wrapper(),
          );
        },
      ),
    );
  }
}
