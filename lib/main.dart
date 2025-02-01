import 'dart:developer';
import 'dart:typed_data';

import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Excel Import',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Import Excel File'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isLoading = false;
  Map<String, Excel>? importedData;

  Future<void> _importExcelFile() async {
    setState(() {
      isLoading = true; // Start loading
    });

    var data = await importData(context, doneFunction: () {
      setState(() {
        isLoading = false; // Stop loading when done
      });
    });

    setState(() {
      importedData = data;
      isLoading = false; // Ensure loading stops even if doneFunction fails
    });

    if (importedData != null) {
      log('File imported successfully: ${importedData!.keys.first}');
    } else {
      log('No file was imported.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (isLoading)
              const CircularProgressIndicator(), // Show loading spinner
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: isLoading ? null : _importExcelFile,
              child: const Text('Import Excel File'),
            ),
            const SizedBox(height: 20),
            if (importedData != null)
              Text('Imported: ${importedData!.keys.first}', style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}

Future<Map<String, Excel>?> importData(BuildContext context, {Function? doneFunction}) async {
  String fileName = '';
  late Excel excel;
  Map<String, Excel> map = {};

  var file = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['xlsx', 'xls'],
      withReadStream: true,
      withData: true,
      onFileLoading: (status) {
        if (status == FilePickerStatus.done && doneFunction != null) {
          doneFunction.call();
        }
      });

  if ((file?.count ?? 0) > 0) {
    file!.files.first.readStream!.listen((event) {
      var excelEnd = Excel.decodeBytes(Uint8List.fromList(event));
      if (excelEnd.sheets.isNotEmpty) {
        fileName = file.files.single.name;
        excel = excelEnd;
        map.putIfAbsent(fileName, () => excel);
      } else {
        log('Error: Unsupported file. Please try again.');
      }
    });

    await Future.delayed(const Duration(milliseconds: 100));
  }

  return (file?.count == null || file?.count == 0) ? null : map;
}
