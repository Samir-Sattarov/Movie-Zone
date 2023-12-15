import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'application.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
        supportedLocales:const [Locale('en'), Locale('ru')],
        path: 'assets/translations/',
        fallbackLocale: const Locale('ru'),
        child: const Application()
    ),
  );
}
