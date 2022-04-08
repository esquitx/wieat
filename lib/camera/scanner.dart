import 'package:flutter/material.dart';

// SHARED
import 'package:wieat/shared/shared.dart';
import 'package:wieat/services/services.dart';

// CAMERA
import 'package:camera/camera.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'dart:async';

class Scanner extends StatefulWidget {
  Scanner({Key? key}) : super(key: key);

  @override
  State<Scanner> createState() => _ScannerState();
}

class _ScannerState extends State<Scanner> {

  @override
  void initState() {
    super.initState();
  }

  Future<void> startBarcodeScan() async {
    FlutterBarcodeScanner.getBarcodeStreamReceiver(
      '#ff6666', 'Cancel', true, ScanMode.BARCODE)!
      .listen((barcode) => print(barcode));
    )
  }

  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.BARCODE);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(builder: (BuildContext context) {
        return Container(
          alignment: Alignment.Center,

          
        )
      })
    );
  }
}