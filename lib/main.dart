import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_zone/locator/locator.dart';
import 'package:uuid/uuid.dart';

import 'application.dart';
import 'core/utils/secure_storage.dart';
import 'core/utils/storage_keys.dart';
import 'firebase_options.dart';

const uuid = Uuid();


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);




  await SecureStorage().save(
    key: StorageKeys.kToken,
    value:
    "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJiNjhiYjdlNjcxZGI5MDk4YzkyODIwNzI2YzFlMzNmMyIsInN1YiI6IjY1OTI5OTU5NjUxZmNmNWYxMzhlYjg3MSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.pdqI_L93K4mexvxfX3KxhY43wEH6bCybCYHhuR1PaOw",
  );

  setup();

  runApp(
    EasyLocalization(
        supportedLocales:const [Locale('en'), Locale('ru')],
        path: 'assets/translations/',
        fallbackLocale: const Locale('ru'),
        child: const Application()
    ),
  );
}
