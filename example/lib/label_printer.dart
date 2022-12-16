import 'dart:async';
import 'dart:io';
import 'dart:ui' as ui;

import 'package:another_brother/printer_info.dart' as brother;
import 'package:another_brother_example/print_exceptions.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:uuid/uuid.dart';

class LabelPrinter {
  const LabelPrinter._();

  static const port = brother.Port.BLUETOOTH;
  static const _uuid = Uuid();
  static const _defaultPageWidth = 1200.0;

  static Future<bool> checkPermission() async => _checkPermission();

  static Future<bool> isPairedPrinterExist(brother.Model model) async =>
      brother.Printer().getBluetoothPrinters([model.getName()]).then(
        (value) => value.isNotEmpty,
      );

  static Future<void> printAll(
    Iterable<Label> labels, {
    required brother.Model model,
    required brother.CustomPaperInfo customPaperInfo,
    required bool isPeelMode,
  }) async {
    final printer = await _configurePrinter(
      model: model,
      customPaperInfo: customPaperInfo,
      isPeelMode: isPeelMode,
      pageCount: labels.length,
    );

    final dir = await getTemporaryDirectory();
    final tempDir = await dir.createTemp('label_printer');

    final files = await Future.wait(
      labels.map((label) async {
        final image = await label.toImage(
          Size(
            _defaultPageWidth,
            _defaultPageWidth * customPaperInfo.tapeLengthRatio,
          ),
        );
        final imageByteData =
            await image.toByteData(format: ui.ImageByteFormat.png);
        final imageBytes = imageByteData!.buffer.asUint8List();
        return File('${tempDir.absolute.path}/${_uuid.v4()}.png')
            .writeAsBytes(imageBytes);
      }),
    );

    final result =
        await printer.printFileList(files.map((file) => file.path).toList());

    await Future.wait(files.map((file) => file.delete()));

    if (result.errorCode != brother.ErrorCode.noError) {
      throw LabelPrintExecutionException(result.errorCode);
    }
  }

  static Future<bool> _checkPermission() async {
    if (Platform.isIOS) {
      // iOS の権限要調査
      return true;
    } else if (Platform.isAndroid) {
      return ((await Permission.bluetoothScan.request()).isGranted) &&
          ((await Permission.bluetoothConnect.request()).isGranted);
    }
    return true;
  }

  static Future<brother.Printer> _configurePrinter({
    required brother.Model model,
    brother.CustomPaperInfo? customPaperInfo,
    bool isPeelMode = false,
    int? pageCount,
  }) async {
    final printer = brother.Printer();

    final bluetoothPrinters = await printer.getBluetoothPrinters([
      model.getName(),
    ]);

    if (bluetoothPrinters.isEmpty) {
      throw const LabelPrinterNotFoundException();
    }

    final bluetoothPrinter = bluetoothPrinters.first;
    final printerInfo = brother.PrinterInfo()
      ..printerModel = model
      ..port = port
      ..macAddress = bluetoothPrinter.macAddress
      ..printMode = brother.PrintMode.FIT_TO_PAGE
      ..isCutAtEnd = true
      ..isAutoCut = true
      ..peelMode = isPeelMode
      ..orientation = brother.Orientation.LANDSCAPE
      ..align = brother.Align.CENTER
      ..valign = brother.VAlign.MIDDLE
      ..printQuality = brother.PrintQuality.NORMAL
      ..timeout = brother.TimeoutSetting(sendTimeoutSec: 1)
      ..customPaperInfo = customPaperInfo;

    if (pageCount != null) {
      printerInfo.autoCutForEachPageCount = pageCount;
    }

    if (!await printer.setPrinterInfo(printerInfo)) {
      throw const InvalidPrintSettingsException();
    }

    return printer;
  }
}

abstract class Label {
  const Label();

  FutureOr<void> draw(Canvas canvas, Size size);

  Future<ui.Image> toImage(Size size) async {
    final recorder = ui.PictureRecorder();
    final canvas = Canvas(recorder);
    await draw(canvas, size);
    final picture = recorder.endRecording();

    return picture.toImage(size.width.toInt(), size.height.toInt());
  }
}

class CustomPaper {
  const CustomPaper._();

  // RD-M09J1
  static final w80h115 = brother.CustomPaperInfo.newCustomDiaCutPaper(
    brother.Model.TD_4550DNWB,
    brother.Unit.Mm,
    80,
    115,
    0,
    0,
    0,
    0,
    3,
  );

  // ユポサーマル紙
  static final w60h60 = brother.CustomPaperInfo.newCustomDiaCutPaper(
    brother.Model.TD_4550DNWB,
    brother.Unit.Mm,
    60,
    60,
    0,
    0,
    0,
    0,
    3,
  );

  static final w60h92 = brother.CustomPaperInfo.newCustomDiaCutPaper(
    brother.Model.TD_4550DNWB,
    brother.Unit.Mm,
    60,
    92,
    0,
    0,
    0,
    0,
    5,
  );

  static final w76 = brother.CustomPaperInfo.newCustomRollPaper(
    brother.Model.TD_4550DNWB,
    brother.Unit.Mm,
    76,
    0,
    0,
    0,
  );
}

extension CustomPaperInfoExt on brother.CustomPaperInfo {
  double get tapeLengthRatio => tapeWidth / tapeLength;

  String get displayName {
    return '${paperKind.toMap()['name']}-'
        'W${tapeWidth}H$tapeLength'
        'M($leftMargin,$topMargin,'
        '$rightMargin,$bottomMargin)'
        'LP$labelPitch';
  }
}
