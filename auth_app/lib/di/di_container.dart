import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'di_container.config.dart';

/// Экземпляр DI контейнера
final GetIt getIt = GetIt.instance;

@InjectableInit(
  preferRelativeImports: false,
)
void initDi() {
  $initGetIt(
    getIt,
  );
}
