import 'package:flutter/cupertino.dart';

import 'package:flutter_gen/gen_l10n/app_localization.dart';


class AppLocal {
  static AppLocalizations? _loc;

  static AppLocalizations get loc {
    return AppLocal._loc!;
  }

  static void init(BuildContext context) {
    _loc = AppLocalizations.of(context);
  }
}