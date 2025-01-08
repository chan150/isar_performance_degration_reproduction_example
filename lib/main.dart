import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:isar_performance_degration_reproduction_example/extension.dart';
import 'package:isar_performance_degration_reproduction_example/simple_record.dart';
import 'package:path_provider/path_provider.dart';

late final Isar isar;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  isar = Isar.open(
    schemas: [SimpleRecordSchema],
    directory: (await getTemporaryDirectory()).path,
    engine: kIsWeb ? IsarEngine.sqlite : IsarEngine.isar,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: StreamBuilder(
              stream: isar.simpleRecords.where().watch(fireImmediately: true),
              builder: (context, snapshot) {
                final list = snapshot.data ?? [];
                return ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    return Text(list[index].toString());
                  },
                );
              },
            ),
          ),
          Expanded(
            child: StreamBuilder(
              stream: isar.simpleRecords.where().watchX(fireImmediately: true),
              builder: (context, snapshot) {
                final list = snapshot.data ?? [];
                return ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    return Text(list[index].toString());
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: () {
              final newRecord = SimpleRecord();
              isar.write((isar) => isar.simpleRecords.put(newRecord));
            },
            child: const Icon(Icons.exposure_plus_1),
          ),
          const SizedBox(height: 100),
          FloatingActionButton(
            onPressed: () {
              final ids = isar.simpleRecords.where().findAll().map((e) => e.id);
              isar.write((isar) => isar.simpleRecords.deleteAll([...ids]));
            },
            child: const Icon(Icons.exposure_minus_1),
          ),
        ],
      ),
    );
  }
}
