import 'package:isar/isar.dart';

import 'main.dart';

part 'simple_record.g.dart';

@collection
class SimpleRecord {
  late int id = isar.simpleRecords.autoIncrement();

  List<int> data = List.generate(1, (i) => i);
}
