import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:readerscann/provider/ui_provider.dart';

// ignore: use_key_in_widget_constructors
class CustomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);
    final currentIndex = uiProvider.selectedMenuOpt;
    return BottomNavigationBar(
        onTap: (int i) => uiProvider.selectedMenuOpt = i,
        fixedColor: Colors.deepPurple,
        currentIndex: currentIndex,
        elevation: 0,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(
                Icons.map,
              ),
              label: 'Mapa'),
          BottomNavigationBarItem(
              icon: Icon(Icons.compass_calibration), label: 'Direcciones'),
        ]);
  }
}
