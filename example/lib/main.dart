import 'package:another_brother/printer_info.dart' as brother;
import 'package:another_brother_example/label_printer.dart';
import 'package:another_brother_example/labels.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Column(
          children: [
            ElevatedButton(
              onPressed: () async {
                if (!await LabelPrinter.checkPermission()) {
                  return;
                }
                LabelPrinter.printAll(
                  [
                    ExampleLabel('Hello! Page1'),
                    ExampleLabel('Hello! Page2'),
                  ],
                  model: brother.Model.TD_4550DNWB,
                  customPaperInfo: CustomPaper.w80h115,
                  isPeelMode: true,
                );
              },
              child: Text('Print'),
            ),
          ],
        ),
      ),
    );
  }
}
