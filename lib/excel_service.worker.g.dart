// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'excel_service.dart';

// **************************************************************************
// Generator: WorkerGenerator 6.2.0
// **************************************************************************

/// WorkerService class for ExcelFileRepository
class _$ExcelFileRepositoryWorkerService extends ExcelFileRepository
    implements WorkerService {
  _$ExcelFileRepositoryWorkerService() : super();

  @override
  late final Map<int, CommandHandler> operations =
      Map.unmodifiable(<int, CommandHandler>{
    _$getColumnCountId: ($) => getColumnCount(),
    _$getDataId: ($) async => _$X.$impl.$sr1(await getData()),
    _$getFileNameId: ($) => getFileName(),
  });

  static const int _$getColumnCountId = 1;
  static const int _$getDataId = 2;
  static const int _$getFileNameId = 3;
}

/// Service initializer for ExcelFileRepository
WorkerService $ExcelFileRepositoryInitializer(WorkerRequest $$) =>
    _$ExcelFileRepositoryWorkerService();

/// Worker for ExcelFileRepository
base class ExcelFileRepositoryWorker extends Worker
    implements ExcelFileRepository {
  ExcelFileRepositoryWorker(
      {PlatformThreadHook? threadHook, ExceptionManager? exceptionManager})
      : super($ExcelFileRepositoryActivator(Squadron.platformType));

  ExcelFileRepositoryWorker.vm(
      {PlatformThreadHook? threadHook, ExceptionManager? exceptionManager})
      : super($ExcelFileRepositoryActivator(SquadronPlatformType.vm));

  ExcelFileRepositoryWorker.js(
      {PlatformThreadHook? threadHook, ExceptionManager? exceptionManager})
      : super($ExcelFileRepositoryActivator(SquadronPlatformType.js),
            threadHook: threadHook, exceptionManager: exceptionManager);

  ExcelFileRepositoryWorker.wasm(
      {PlatformThreadHook? threadHook, ExceptionManager? exceptionManager})
      : super($ExcelFileRepositoryActivator(SquadronPlatformType.wasm));

  @override
  Future<int> getColumnCount() =>
      send(_$ExcelFileRepositoryWorkerService._$getColumnCountId)
          .then(_$X.$impl.$dsr2);

  @override
  Future<List<List<CellValue?>>> getData() =>
      send(_$ExcelFileRepositoryWorkerService._$getDataId)
          .then(_$X.$impl.$dsr6);

  @override
  Future<String> getFileName() =>
      send(_$ExcelFileRepositoryWorkerService._$getFileNameId)
          .then(_$X.$impl.$dsr7);

  @override
  Future<void> init(List<int> bytes) => throw UnimplementedError();

  @override
  // ignore: unused_element
  Excel get excel => throw UnimplementedError();

  @override
  // ignore: unused_element
  set excel(void value) => throw UnimplementedError();
}

/// Worker pool for ExcelFileRepository
base class ExcelFileRepositoryWorkerPool
    extends WorkerPool<ExcelFileRepositoryWorker>
    implements ExcelFileRepository {
  ExcelFileRepositoryWorkerPool(
      {ConcurrencySettings? concurrencySettings,
      PlatformThreadHook? threadHook,
      ExceptionManager? exceptionManager})
      : super(
          (ExceptionManager exceptionManager) => ExcelFileRepositoryWorker(
              threadHook: threadHook, exceptionManager: exceptionManager),
          concurrencySettings: concurrencySettings,
        );

  ExcelFileRepositoryWorkerPool.vm(
      {ConcurrencySettings? concurrencySettings,
      PlatformThreadHook? threadHook,
      ExceptionManager? exceptionManager})
      : super(
          (ExceptionManager exceptionManager) => ExcelFileRepositoryWorker.vm(
              threadHook: threadHook, exceptionManager: exceptionManager),
          concurrencySettings: concurrencySettings,
        );

  ExcelFileRepositoryWorkerPool.js(
      {ConcurrencySettings? concurrencySettings,
      PlatformThreadHook? threadHook,
      ExceptionManager? exceptionManager})
      : super(
          (ExceptionManager exceptionManager) => ExcelFileRepositoryWorker.js(
              threadHook: threadHook, exceptionManager: exceptionManager),
          concurrencySettings: concurrencySettings,
        );

  ExcelFileRepositoryWorkerPool.wasm(
      {ConcurrencySettings? concurrencySettings,
      PlatformThreadHook? threadHook,
      ExceptionManager? exceptionManager})
      : super(
          (ExceptionManager exceptionManager) => ExcelFileRepositoryWorker.wasm(
              threadHook: threadHook, exceptionManager: exceptionManager),
          concurrencySettings: concurrencySettings,
        );

  @override
  Future<int> getColumnCount() => execute((w) => w.getColumnCount());

  @override
  Future<List<List<CellValue?>>> getData() => execute((w) => w.getData());

  @override
  Future<String> getFileName() => execute((w) => w.getFileName());

  @override
  Future<void> init(List<int> bytes) => throw UnimplementedError();

  @override
  // ignore: unused_element
  Excel get excel => throw UnimplementedError();

  @override
  // ignore: unused_element
  set excel(void value) => throw UnimplementedError();
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
  late final $dsr3 = Squadron.converter.value<CellValue>();
  late final $dsr4 = Squadron.converter.nullable($dsr3);
  late final $dsr5 = Squadron.converter.list<CellValue?>($dsr4);
  late final $dsr6 = Squadron.converter.list<List<CellValue?>>($dsr5);
  late final $dsr7 = Squadron.converter.value<String>();
}
