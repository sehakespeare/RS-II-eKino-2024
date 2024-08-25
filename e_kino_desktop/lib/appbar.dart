import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

final selectedIndexStream = BehaviorSubject<int>.seeded(0);

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    late List menuItems = [
      'Users',
      'Auditoriums',
      'Genres',
      'Direktors',
      'Movies',
      'Projections',
      'Reservations',
      'Reports |',
      'Reports ||'
    ];
    return StreamBuilder<Object>(
        stream: selectedIndexStream,
        builder: (context, selectedIndexSnapshot) {
          return ListView.builder(
              itemCount: menuItems.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    Navigator.pushReplacementNamed(
                      context,
                      "/${menuItems[index]}",
                    );

                    selectedIndexStream.add(index);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '${menuItems[index]}',
                      style: TextStyle(
                          color: index == selectedIndexSnapshot.data
                              ? Colors.white
                              : Colors.black),
                    ),
                  ),
                );
              });
        });
  }
}
