import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) => Drawer(
        child: SafeArea(child: Column(children: [
          const UserAccountsDrawerHeader(
            accountName: Text('Faatir Wibowo Rachmad'),
            accountEmail: Text('2506595146 • PBP C'),
            currentAccountPicture: CircleAvatar(child: Icon(Icons.person)),
          ),
          ListTile(leading: const Icon(Icons.home_outlined), title: const Text('Home'),
            onTap: () => Navigator.pop(context)),
          ListTile(leading: const Icon(Icons.add_box_outlined), title: const Text('Tambah Proyek'),
            onTap: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Form tambah proyek akan segera tersedia.')),
              );
            }),
        ])),
      );
}
