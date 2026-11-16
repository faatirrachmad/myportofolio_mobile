import 'package:flutter/material.dart';
import '../widgets/action_card.dart';
import '../widgets/app_drawer.dart';
import '../widgets/info_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const _actions = [
    ActionCardData(title: 'Lihat Proyek', icon: Icons.folder_open, color: Color(0xFFF59E0B)),
    ActionCardData(title: 'Tambah Proyek', icon: Icons.add_circle_outline, color: Color(0xFF4F46E5)),
    ActionCardData(title: 'Logout', icon: Icons.logout, color: Color(0xFF0F766E)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('MyPortfolio')),
      drawer: const AppDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            const Text('Profil Mahasiswa', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            const Wrap(spacing: 8, runSpacing: 8, children: [
              InfoCard(title: 'NPM', content: '2506595146'),
              InfoCard(title: 'Nama', content: 'Faatir Wibowo Rachmad'),
              InfoCard(title: 'Kelas', content: 'PBP C'),
            ]),
            const SizedBox(height: 28),
            const Text('Selamat datang di MyPortfolio Mobile!', textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            const SizedBox(height: 8),
            Text('Kelola perjalanan dan karya profesionalmu dalam satu tempat.',
                textAlign: TextAlign.center, style: TextStyle(color: Theme.of(context).colorScheme.onSurfaceVariant)),
            const SizedBox(height: 22),
            LayoutBuilder(builder: (context, constraints) {
              final columns = constraints.maxWidth > 600 ? 3 : 2;
              return GridView.count(
                primary: false,
                shrinkWrap: true,
                crossAxisCount: columns,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1.15,
                children: _actions.map((action) => ActionCard(data: action)).toList(),
              );
            }),
          ]),
        ),
      ),
    );
  }
}
