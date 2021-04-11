import 'package:injectable/injectable.dart';

import '../auth_app.dart';

/// Класс для подключения к базе данных, используя переменные
/// окружения
@module
abstract class DbHelper {
  /// Возвращает объект контекста соединения с БД
  /// на котором выполняются запросы
  ManagedContext createManagedContext() {
    final dataModel = ManagedDataModel.fromCurrentMirrorSystem();
    final _env = Platform.environment;
    final psc = PostgreSQLPersistentStore.fromConnectionInfo(
      _env['POSTGRES_USER'],
      _env['POSTGRES_PASSWORD'],
      _env['DB_HOST'],
      int.tryParse(_env['DB_PORT'] ?? '5432'),
      _env['POSTGRES_DB'],
    );

    return ManagedContext(dataModel, psc);
  }
}
