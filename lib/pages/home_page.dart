import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:readerscann/models/scan_model.dart';
import 'package:readerscann/pages/direcciones-_page.dart';
import 'package:readerscann/pages/mapas_page.dart';
import 'package:readerscann/provider/scan_list_provider.dart';
import 'package:readerscann/widgets/custom_navigatorbar.dart';
import 'package:readerscann/widgets/scan_button.dart';

import '../provider/ui_provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Center(
          child: Text('Historial'),
        ),
        actions: [
          IconButton(
              onPressed: () {
                final scanListProvider =
                    Provider.of<ScanListProvider>(context, listen: false);
                scanListProvider.borrarTodos();
              },
              icon: const Icon(Icons.delete_forever))
        ],
      ),
      body: _HomePageBody(),
      bottomNavigationBar: CustomNavigationBar(),
      floatingActionButton: ScanButtom(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

// ignore: unused_element
class _HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);
    final currentIndex = uiProvider.selectedMenuOpt;

    final scanListProvider =
        Provider.of<ScanListProvider>(context, listen: false);

    switch (currentIndex) {
      case 0:
        scanListProvider.cargarScanPorTipo('geo');
        return const MapasPage();

      case 1:
        scanListProvider.cargarScanPorTipo('http');
        return DireccionesPage();

      default:
        return const MapasPage();
    }
  }
}
