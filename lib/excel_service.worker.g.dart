// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'excel_service.dart';

// **************************************************************************
// Generator: WorkerGenerator 6.2.0
// **************************************************************************

/// WorkerService class for ExcelFileRepository
class _$ExcelFileRepositoryWorkerService extends ExcelFileRepository
    implements WorkerService {
  _$ExcelFileRepositoryWorkerService([super.excel]) : super();

  @override
  late final Map<int, CommandHandler> operations =
      Map.unmodifiable(<int, CommandHandler>{
    _$getColumnCountId: ($) => getColumnCount(),
    _$getDataId: ($) async => _$X.$impl.$sr1(await getData()),
    _$getFileNameId: ($) => getFileName(),
    _$initId: ($) => init(_$X.$impl.$dsr3($.args[0])),
  });

  static const int _$getColumnCountId = 1;
  static const int _$getDataId = 2;
  static const int _$getFileNameId = 3;
  static const int _$initId = 4;
}

/// Service initializer for ExcelFileRepository
WorkerService $ExcelFileRepositoryInitializer(WorkerRequest $$) =>
    _$ExcelFileRepositoryWorkerService(_$X.$impl.$dsr5($$.args[0]));

/// Worker for ExcelFileRepository
base class ExcelFileRepositoryWorker extends Worker
    implements ExcelFileRepository {
  ExcelFileRepositoryWorker(
      [this.excel,
      PlatformThreadHook? threadHook,
      ExceptionManager? exceptionManager])
      : super($ExcelFileRepositoryActivator(Squadron.platformType),
            args: [excel]);

  ExcelFileRepositoryWorker.vm(
      [this.excel,
      PlatformThreadHook? threadHook,
      ExceptionManager? exceptionManager])
      : super($ExcelFileRepositoryActivator(SquadronPlatformType.vm),
            args: [excel]);

  ExcelFileRepositoryWorker.js(
      [this.excel,
      PlatformThreadHook? threadHook,
      ExceptionManager? exceptionManager])
      : super($ExcelFileRepositoryActivator(SquadronPlatformType.js),
            args: [excel],
            threadHook: threadHook,
            exceptionManager: exceptionManager);

  ExcelFileRepositoryWorker.wasm(
      [this.excel,
      PlatformThreadHook? threadHook,
      ExceptionManager? exceptionManager])
      : super($ExcelFileRepositoryActivator(SquadronPlatformType.wasm),
            args: [excel]);

  @override
  Excel? excel;

  @override
  Future<int> getColumnCount() =>
      send(_$ExcelFileRepositoryWorkerService._$getColumnCountId)
          .then(_$X.$impl.$dsr2);

  @override
  Future<List<List<CellValue?>>> getData() =>
      send(_$ExcelFileRepositoryWorkerService._$getDataId)
          .then(_$X.$impl.$dsr9);

  @override
  Future<String> getFileName() =>
      send(_$ExcelFileRepositoryWorkerService._$getFileNameId)
          .then(_$X.$impl.$dsr10);

  @override
  Future<void> init(List<int> bytes) =>
      send(_$ExcelFileRepositoryWorkerService._$initId,
          args: [_$X.$impl.$sr0(bytes)]);
}

/// Worker pool for ExcelFileRepository
base class ExcelFileRepositoryWorkerPool
    extends WorkerPool<ExcelFileRepositoryWorker>
    implements ExcelFileRepository {
  ExcelFileRepositoryWorkerPool(
      [this.excel,
      ConcurrencySettings? concurrencySettings,
      PlatformThreadHook? threadHook,
      ExceptionManager? exceptionManager])
      : super(
          (ExceptionManager exceptionManager) =>
              ExcelFileRepositoryWorker(excel, threadHook, exceptionManager),
          concurrencySettings: concurrencySettings,
        );

  ExcelFileRepositoryWorkerPool.vm(
      [this.excel,
      ConcurrencySettings? concurrencySettings,
      PlatformThreadHook? threadHook,
      ExceptionManager? exceptionManager])
      : super(
          (ExceptionManager exceptionManager) =>
              ExcelFileRepositoryWorker.vm(excel, threadHook, exceptionManager),
          concurrencySettings: concurrencySettings,
        );

  ExcelFileRepositoryWorkerPool.js(
      [this.excel,
      ConcurrencySettings? concurrencySettings,
      PlatformThreadHook? threadHook,
      ExceptionManager? exceptionManager])
      : super(
          (ExceptionManager exceptionManager) =>
              ExcelFileRepositoryWorker.js(excel, threadHook, exceptionManager),
          concurrencySettings: concurrencySettings,
        );

  ExcelFileRepositoryWorkerPool.wasm(
      [this.excel,
      ConcurrencySettings? concurrencySettings,
      PlatformThreadHook? threadHook,
      ExceptionManager? exceptionManager])
      : super(
          (ExceptionManager exceptionManager) => ExcelFileRepositoryWorker.wasm(
              excel, threadHook, exceptionManager),
          concurrencySettings: concurrencySettings,
        );

  @override
  Excel? excel;

  @override
  Future<int> getColumnCount() => execute((w) => w.getColumnCount());

  @override
  Future<List<List<CellValue?>>> getData() => execute((w) => w.getData());

  @override
  Future<String> getFileName() => execute((w) => w.getFileName());

  @override
  Future<void> init(List<int> bytes) => execute((w) => w.init(bytes));
}

final class _$X {
  _$X._();

  static _$X? _impl;

  static _$X get $impl {
    if (_impl == null) {
      Squadron.onConverterChanged(() => _impl = _$X._());
      _impl = _$X._();
    }
    return _impl!;
  }

  late final $sr0 = Squadron.converter.list();
  late final $sr1 = Squadron.converter.list($sr0);
  late final $dsr2 = Squadron.converter.value<int>();
  late final $dsr3 = Squadron.converter.list<int>($dsr2);
  late final $dsr4 = Squadron.converter.value<Excel>();
  late final $dsr5 = Squadron.converter.nullable($dsr4);
  late final $dsr6 = Squadron.converter.value<CellValue>();
  late final $dsr7 = Squadron.converter.nullable($dsr6);
  late final $dsr8 = Squadron.converter.list<CellValue?>($dsr7);
  late final $dsr9 = Squadron.converter.list<List<CellValue?>>($dsr8);
  late final $dsr10 = Squadron.converter.value<String>();
}
