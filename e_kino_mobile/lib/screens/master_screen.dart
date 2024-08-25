import 'package:e_kino_mobile/screens/cart/cart_screen.dart';
import 'package:e_kino_mobile/screens/projections/projekcije_screen.dart';

import 'package:flutter/material.dart';

final globalNavigationKey = GlobalKey();

class MasterScreenWidget extends StatefulWidget {
  final Widget? titleWidget;
  final Widget? child;
  const MasterScreenWidget({
    super.key,
    this.child,
    this.titleWidget,
  });

  @override
  State<MasterScreenWidget> createState() => _MasterScreenWidgetState();
}

class _MasterScreenWidgetState extends State<MasterScreenWidget> {
  int currentIndex = 0;
  final List<Widget> _pages = <Widget>[
    const ProjekcijeScreen(),
    const CartScreen(),
  ];
  void _onItemTapped(int index) async {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages.elementAt(currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        key: globalNavigationKey,
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.movie),
            label: 'Projekcije',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.table_bar),
            label: 'Karte',
          ),
        ],
        selectedItemColor: Colors.amber[800],
        currentIndex: currentIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
