import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/secure_storage.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<bool> {
  final SecureStorage secureStorage;
  ThemeCubit(this.secureStorage) : super(false) {
    load();
  }

  load() async {
    final response = await secureStorage.get(key: "isDark");

    print("response $response");
    if (response == null) {
      emit(false);
    } else {
      emit(response == "true");
    }
  }

  isDark(bool theme) async {
    await secureStorage.save(key: "isDark", value: theme.toString());

    emit(theme);
  }
}
