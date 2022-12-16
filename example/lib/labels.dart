import 'dart:async';
import 'dart:ui' as ui;

import 'package:another_brother_example/label_printer.dart';
import 'package:flutter/material.dart';

class ExampleLabel extends Label {
  const ExampleLabel(this.text);

  static const _padding = 40.0;

  final String text;

  @override
  FutureOr<void> draw(Canvas canvas, Size size) {
    final bodyWidth = size.width - _padding * 2;

    // background
    final backgroundPaint = ui.Paint()
      ..color = Colors.white
      ..style = ui.PaintingStyle.fill;
    canvas.drawPaint(backgroundPaint);

    // text
    _textPainter()
      ..layout(maxWidth: bodyWidth)
      ..paint(canvas, const Offset(_padding, _padding));
  }

  TextPainter _textPainter() {
    return TextPainter(
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.left,
      text: TextSpan(
        style: const TextStyle(
          color: Colors.black,
          fontSize: 64,
          fontWeight: FontWeight.bold,
          locale: ui.Locale('ja_JP'),
        ),
        text: text,
      ),
    );
  }
}
