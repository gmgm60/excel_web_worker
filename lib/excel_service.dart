import 'dart:async';
import 'dart:developer';
import 'dart:typed_data';
import 'package:excel/excel.dart';
import 'package:squadron/squadron.dart';

import 'excel_service.activator.g.dart';

part 'excel_service.worker.g.dart';

// //dart compile js ".\lib\excel_service.web.g.dart" -o "..\web\workers\excel_service.web.g.dart.js"
// @SquadronService(
//     baseUrl: '~/workers',
//     targetPlatform: TargetPlatform.vm | TargetPlatform.web)
// class ExcelService {
//   /// If [Excel.decodeBytes] returns a complex object that isn’t transferable between isolates,
//   /// consider processing only the data you need into a simpler structure (like a Map or List).
//   @SquadronMethod()
//   Future<Map<String, Sheet>> decodeExcelFromBytes(List<int> bytes) async {
//     // This heavy work is now offloaded
//     print("decoding bytes");
//     final excel = Excel.decodeBytes(bytes);
//     print("Worker Number of sheets:  ${excel.sheets.length} ");
//     return excel.sheets;
//   }
// }

// Abstract class following Dependency Inversion Principle
abstract class ExcelRepository {
  ExcelRepository();

  Future<void> init(List<int> bytes);

  FutureOr<int> getColumnCount();

  FutureOr<String> getFileName();

  FutureOr<List<List<CellValue?>>> getData();

// List<DataRow> convertToDataRows(List<List<CellValue?>> excelData);
}

// Implementation class that processes the Excel file
@SquadronService(
    baseUrl: '~/workers',
    targetPlatform: TargetPlatform.vm | TargetPlatform.web)
class ExcelFileRepository implements ExcelRepository {
  @ExcelMarshaler()
  Excel? excel;

  ExcelFileRepository([this.excel]);

  @override
  @SquadronMethod()
  Future<void> init(List<int> bytes) async {
    // final bytes = await file.readStream!.single;
    print("Worker init");
    excel = Excel.decodeBytes(bytes);

    print("Worker Number of sheets:  ${excel!.sheets.length} ");
    // this.excel = excel;
  }

  @override
  @SquadronMethod()
  FutureOr<int> getColumnCount() {
    final Sheet? sheet = excel!.sheets[excel!.sheets.keys.first];
    if (sheet == null || sheet.rows.isEmpty) return 0;
    return sheet.maxColumns;
  }

  @override
  @SquadronMethod()
  FutureOr<String> getFileName() {
    return excel!.sheets.keys.first;
  }

  @override
  @SquadronMethod()
  FutureOr<List<List<CellValue?>>> getData() {
    final Sheet? sheet = excel!.sheets[excel!.sheets.keys.first];
    if (sheet == null) return [];

    return sheet.rows
        .map((row) => row.map((cell) => cell?.value).toList())
        .toList();
  }

// @override
// @SquadronMethod()
// List<DataRow> convertToDataRows(List<List<CellValue?>> excelData) {
//   return excelData.map((row) {
//     return DataRow(
//       cells: row.map((cell) {
//         return DataCell(
//             Text(cell?.toString() ?? '')); // Convert CellValue to String
//       }).toList(),
//     );
//   }).toList();
// }
}

class ExcelMarshaler implements SquadronMarshaler<Excel, List<int>> {
  const ExcelMarshaler();

  @override
  List<int> marshal(Excel data) => data.encode()!;

  @override
  Excel unmarshal(List<int> data) => Excel.decodeBytes(data);
}
