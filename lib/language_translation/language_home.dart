import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LanguageHomePage extends StatefulWidget {
  const LanguageHomePage({Key? key}) : super(key: key);

  @override
  State<LanguageHomePage> createState() => _LanguageHomePageState();
}

class _LanguageHomePageState extends State<LanguageHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Language translation"),
      ),
      body:
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(AppLocalizations.of(context).helloWorld),
            ElevatedButton(onPressed: (){
              changeLang();
            }, child: Text("Change language"))
          ],
        ),
      ),
    );
  }

  void changeLang() {
    // print(object);
  }
}
