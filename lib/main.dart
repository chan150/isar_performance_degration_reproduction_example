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

  isar.write((isar) => isar.simpleRecords.clear());
  final newRecords = List.generate(100, (_) => SimpleRecord());
  isar.write((isar) => isar.simpleRecords.putAll(newRecords));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
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
            child: Column(
              children: [
                const Text('Original watch'),
                for (var i = 0; i < 10; i++)
                  Expanded(
                    child: StreamBuilder(
                      stream: isar.simpleRecords.where().watch(fireImmediately: true),
                      builder: (context, snapshot) {
                        final list = snapshot.data ?? [];
                        return Text(list.length.toString());
                      },
                    ),
                  ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                const Text('Improved watch'),
                for (var i = 0; i < 10; i++)
                  Expanded(
                    child: StreamBuilder(
                      stream: isar.simpleRecords.where().watchX(fireImmediately: true),
                      builder: (context, snapshot) {
                        final list = snapshot.data ?? [];
                        return Text(list.length.toString());
                      },
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: () {
              final newRecords = List.generate(100, (_) => SimpleRecord());
              isar.write((isar) => isar.simpleRecords.putAll(newRecords));
            },
            child: const Icon(Icons.exposure_plus_1),
          ),
          const SizedBox(height: 100),
          FloatingActionButton(
            onPressed: () {
              isar.write((isar) => isar.simpleRecords.clear());
            },
            child: const Icon(Icons.exposure_minus_1),
          ),
        ],
      ),
    );
  }
}
