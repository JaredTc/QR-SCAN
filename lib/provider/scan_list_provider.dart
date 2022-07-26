import 'package:flutter/material.dart';
import 'package:readerscann/models/scan_model.dart';
import 'package:readerscann/provider/db_provider.dart';

class ScanListProvider extends ChangeNotifier {
  List<ScanModel> scans = [];
  String tipoSeleccionado = 'http';

  Future<ScanModel> nuevoSan(String valor) async {
    final nuevoScan = ScanModel(valor: valor);
    final id = await DBProvider.db.nuevoScan(nuevoScan);

    //Asignar id a la bd al modelo
    nuevoScan.id = id;

    if (tipoSeleccionado == nuevoScan.tipo) {
      scans.add(nuevoScan);
    }
    notifyListeners();
    return nuevoScan;
  }

  cargarScans() async {
    final scans = await DBProvider.db.getTodosLosScans();
    this.scans = [...?scans];
    notifyListeners();
  }

  cargarScanPorTipo(String tipo) async {
    final scans = await DBProvider.db.getScansPorTipo(tipo);
    this.scans = [...?scans];
    notifyListeners();
  }

  borrarTodos() async {
    await DBProvider.db.deleteScans();
    scans = [];
    notifyListeners();
  }

  borrarScanPorId(int id) async {
  await DBProvider.db.deleteScan(id);
    

  }
}
