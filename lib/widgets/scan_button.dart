import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'package:readerscann/provider/scan_list_provider.dart';
import 'package:readerscann/utils/utils.dart';

class ScanButtom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      child: const Icon(Icons.filter_center_focus),
      onPressed: () async {
        String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode('#3D8BEF', 'Cancelar', false, ScanMode.QR);
 
       // ignore: use_build_context_synchronously
       final scanListProvider = Provider.of<ScanListProvider>(context, listen:false);
      final nuevoScan = await scanListProvider.nuevoSan(barcodeScanRes);
        // ignore: use_build_context_synchronously
        launchURL(context,  nuevoScan);


      },
    );
  }
}
