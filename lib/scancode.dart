
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class scanQr extends StatefulWidget {
  @override
  State<scanQr> createState() => _scanQrState();
}

class _scanQrState extends State<scanQr> {
final qrkey= GlobalKey(debugLabel: 'QR');
Barcode? barcode;
QRViewController? controller;
@override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
  @override
  void reassemble()async {
    super.reassemble();
   if(Platform.isAndroid){
     await controller!.pauseCamera();
   }
   controller!.resumeCamera();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children:[ QRView(key: qrkey, onQRViewCreated: onQRViewCreated,
        overlay: QrScannerOverlayShape(
          cutOutSize: MediaQuery.of(context).size.width * 0.8,
          borderWidth: 10,
          borderLength: 20,
          borderRadius: 10,
          borderColor: Colors.green,
        ),),
        Positioned(child: Container(padding: EdgeInsets.all(12),decoration:BoxDecoration(borderRadius: BorderRadius.circular(8),color: Colors.white),child: Text(barcode!=null?'Result : ${barcode!.code}':'scan a code',maxLines: 3,)),bottom: 10,)]
      ),
    );
  }

void onQRViewCreated(QRViewController controller){
setState((){this.controller=controller;});
controller.scannedDataStream.listen((barcode)=> setState(()=>this.barcode=barcode));
}
}