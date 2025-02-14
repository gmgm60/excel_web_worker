// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// Generator: WorkerGenerator 6.2.0
// **************************************************************************

import 'package:squadron/squadron.dart';

import 'excel_service.dart';

void main() {
  /// Web entry point for ExcelFileRepository
  run($ExcelFileRepositoryInitializer);
}

EntryPoint $getExcelFileRepositoryActivator(SquadronPlatformType platform) {
  if (platform.isJs) {
    return Squadron.uri('~/workers/excel_service.web.g.dart.js');
  } else if (platform.isWasm) {
    return Squadron.uri('~/workers/excel_service.web.g.dart.wasm');
  } else {
    throw UnsupportedError('${platform.label} not supported.');
  }
}
