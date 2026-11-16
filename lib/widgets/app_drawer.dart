import 'package:flutter/material.dart';
import '../screens/project_form_page.dart';

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
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Home'),
            onTap: () {
              final navigator = Navigator.of(context);
              navigator.pop();
              if (navigator.canPop()) {
                navigator.popUntil((route) => route.isFirst);
              }
            },
          ),
          ListTile(leading: const Icon(Icons.add_box_outlined), title: const Text('Tambah Proyek'),
            onTap: () {
              final navigator = Navigator.of(context);
              navigator.pop();
              navigator.push(MaterialPageRoute<void>(builder: (_) => const ProjectFormPage()));
            }),
        ])),
      );
}
