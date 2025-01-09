import 'dart:async';
import 'dart:math';

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
    engine: IsarEngine.isar,
  );
  isar.write((isar) => isar.simpleRecords.clear());
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
  final _original = Stopwatch();
  final _improved = Stopwatch();
  final _originalResult = <int>[];
  final _improvedResult = <int>[];

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
                        if (_original.elapsed.inMilliseconds != 0) {
                          _originalResult.add(_original.elapsed.inMilliseconds);
                        }
                        if (_originalResult.length == 10) {
                          print('Original watch (ms.): ${_originalResult.reduce(max)}');
                          _originalResult.clear();
                        }
                        final list = snapshot.data ?? [];
                        return Text(list.length.toString());
                      },
                    ),
                  ),
              ],
            ),
          ),
          Container(width: 1, color: Colors.black),
          Expanded(
            child: Column(
              children: [
                const Text('Improved watch'),
                for (var i = 0; i < 10; i++)
                  Expanded(
                    child: StreamBuilder(
                      stream: isar.simpleRecords.where().watchX(fireImmediately: true),
                      builder: (context, snapshot) {
                        if (_improved.elapsed.inMilliseconds != 0) {
                          _improvedResult.add(_improved.elapsed.inMilliseconds);
                        }
                        if (_improvedResult.length == 10) {
                          print('Improved watch (ms.): ${_improvedResult.reduce(max)}');
                          _improvedResult.clear();
                        }
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
              _original.stop();
              _original.reset();
              _original.start();
              _improved.stop();
              _improved.reset();
              _improved.start();
            },
            child: const Icon(Icons.exposure_plus_1),
          ),
          const SizedBox(height: 100),
          FloatingActionButton(
            onPressed: () {
              isar.write((isar) => isar.simpleRecords.clear());
              _original.stop();
              _original.reset();
              _original.start();
              _improved.stop();
              _improved.reset();
              _improved.start();
            },
            child: const Icon(Icons.exposure_minus_1),
          ),
        ],
      ),
    );
  }
}
