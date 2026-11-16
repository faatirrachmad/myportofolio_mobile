import 'package:flutter/material.dart';

class ActionCardData {
  const ActionCardData({required this.title, required this.icon, required this.color});

  final String title;
  final IconData icon;
  final Color color;
}

class ActionCard extends StatelessWidget {
  const ActionCard({super.key, required this.data});

  final ActionCardData data;

  @override
  Widget build(BuildContext context) => Card(
        clipBehavior: Clip.antiAlias,
        color: data.color,
        child: InkWell(
          onTap: () => ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(content: Text('Kamu memilih ${data.title}.'))),
          child: Semantics(
            button: true,
            child: Center(child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                Icon(data.icon, color: Colors.white, size: 34),
                const SizedBox(height: 10),
                Text(data.title, textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
              ]),
            )),
          ),
        ),
      );
}
