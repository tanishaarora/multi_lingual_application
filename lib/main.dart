import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:multi_lingual_application/helper/shared_pref.dart';
import 'package:multi_lingual_application/l10n/l10n.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:multi_lingual_application/provider/provider.dart';
import 'package:provider/provider.dart';
import 'HomePage.dart';

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppSharedPreferences.getLang();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SetProvider())
      ],
      child: Builder(
        builder: (context) {
          return MaterialApp(
            supportedLocales: L10n.all,
            locale: Locale(Provider.of<SetProvider>(context).local ?? AppSharedPreferences.lang ?? 'en'),
            localizationsDelegates: [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate
            ],
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: const Homepage(),
          );
        }
      ),
    );
  }
}