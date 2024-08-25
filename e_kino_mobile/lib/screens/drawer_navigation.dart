import 'package:e_kino_mobile/screens/profile/profile.dart';
import 'package:e_kino_mobile/screens/user_profile/login_screen.dart';
import 'package:flutter/material.dart';
import '../screens/recommender/recommender_screen.dart';
import 'reservations/reservation_list_screen.dart';

class DrawerNavigation extends StatefulWidget {
  const DrawerNavigation({
    super.key,
  });

  @override
  State<DrawerNavigation> createState() => _DrawerNavigationState();
}

class _DrawerNavigationState extends State<DrawerNavigation> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const SizedBox(
            height: 64,
          ),
          ListTile(
            title: const Text("Rezervacije"),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const ReservationsListScreen(),
              ));
            },
          ),
          const Divider(),
          ListTile(
            title: const Text("Preporuke"),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const PreporukeScreen(),
              ));
            },
          ),
          const Divider(),
          ListTile(
            title: const Text("Profil"),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const UserProfileScreen(),
              ));
            },
          ),
          const Divider(),
          const SizedBox(
            height: 64,
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: ListTile(
                title: const Text("Odjava"),
                onTap: () {
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ),
                    ModalRoute.withName('/'),
                  );
                },
              ),
            ),
          ),
          const SizedBox(
            height: 124,
          ),
        ],
      ),
    );
  }
}
