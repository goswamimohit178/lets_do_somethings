import 'dart:developer';
import 'dart:io';

import 'package:collabact/Screens/Qrcode_aadharcard/pan_card_details.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QRViewPancard extends StatefulWidget {
  const QRViewPancard({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QRViewPancardState();
}

class _QRViewPancardState extends State<QRViewPancard> {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Expanded(flex: 2, child: _buildQrView(context)),
            Expanded(
              flex: 2,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    if (result != null)
                      //    PanCardDetails(result!.code),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Center(
                              child: Text(
                                'Barcode Type: ${describeEnum(result!.format)}   User Details: ${result!.code}',
                              ),
                            ),
                            Container(
                                margin: const EdgeInsets.all(8),
                                child: ElevatedButton(
                                  onPressed: () async {
                                    controller?.dispose();
                                    final SharedPreferences pref =
                                        await SharedPreferences.getInstance();
                                    pref.setString(
                                        'PanCardNo',
                                        result!.code!
                                            .split(":")
                                            .elementAt(4)
                                            .toString());
                                    pref.setString(
                                        'FatherName',
                                        result!.code!
                                            .split(":")
                                            .elementAt(2)
                                            .toString());
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text("Save Details",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white)),
                                )),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 150.0
        : 300.0;
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: Colors.lightBlue,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
        print("HELLO ${result!.code}");
        print(scanData);
      });
    });
  }

  _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() async {
    controller?.dispose();
    super.dispose();
  }
}
