import 'package:isar/isar.dart';

extension QueryExecuteX<OBJ, R> on QueryBuilder<OBJ, R, QOperations> {
  Stream<List<R>> watchX({bool fireImmediately = false, int? offset, int? limit}) {
    return watchLazy(fireImmediately: fireImmediately).map((_) => findAll(offset: offset, limit: limit));
  }
}
