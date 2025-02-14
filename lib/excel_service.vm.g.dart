// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// Generator: WorkerGenerator 6.2.0
// **************************************************************************

import 'package:squadron/squadron.dart';

import 'excel_service.dart';

void _start$ExcelFileRepository(WorkerRequest command) {
  /// VM entry point for ExcelFileRepository
  run($ExcelFileRepositoryInitializer, command);
}

EntryPoint $getExcelFileRepositoryActivator(SquadronPlatformType platform) {
  if (platform.isVm) {
    return _start$ExcelFileRepository;
  } else {
    throw UnsupportedError('${platform.label} not supported.');
  }
}
