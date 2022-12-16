import 'package:another_brother/printer_info.dart' as brother;

class LabelPrintException with Exception {
  const LabelPrintException();

  @override
  String toString() => 'LabelPrintException';
}

class MissingPrintPermissionException extends LabelPrintException {
  const MissingPrintPermissionException();

  @override
  String toString() => 'MissingPrintPermissionException';
}

class LabelPrinterNotFoundException extends LabelPrintException {
  const LabelPrinterNotFoundException();

  @override
  String toString() => 'LabelPrinterNotFoundException';
}

class InvalidPrintSettingsException extends LabelPrintException {
  const InvalidPrintSettingsException();

  @override
  String toString() => 'InvalidPrintSettingsException';
}

class LabelPrintExecutionException extends LabelPrintException {
  const LabelPrintExecutionException(this.errorCode);

  final brother.ErrorCode errorCode;

  @override
  String toString() =>
      'LabelPrintExecutionException(errorCode=${errorCode.name})';
}
