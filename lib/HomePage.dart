import 'package:flutter/material.dart';
import 'package:multi_lingual_application/provider/provider.dart';
import 'helper/shared_pref.dart';
import 'l10n/l10n.dart';
import '../app_local.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => HomepageState();
}

class HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    AppLocal.init(context);
    SetProvider provider = Provider.of(context);

    var name = [AppLocal.loc.english, AppLocal.loc.hindi, AppLocal.loc.arabic];

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // SimpleText(),
            // SizedBox(height: 20),
            Wrap(
              children: List.generate(L10n.all.length, (index) {
                return RadioListTile(
                    title: Text(
                      name[index],
                      textAlign: TextAlign.center,
                    ),
                    value: L10n.all[index].languageCode,
                    groupValue: provider.local,
                    onChanged: (String? value) {
                      AppSharedPreferences.addLang(value!);
                      provider.updateLocal(value);
                    });
              }),
            ),

            Center(
              child: Text(
                AppLocal.loc.helloWorld,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w900,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
