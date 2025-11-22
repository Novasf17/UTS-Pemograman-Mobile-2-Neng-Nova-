import 'package:flutter/material.dart';

class JuzItem {
  final String title;
  final String description;

  JuzItem({required this.title, required this.description});
}

class ListInfoScreen extends StatelessWidget {
  ListInfoScreen({super.key});

  // Data Juz 1–5 contoh, bisa ditambah sampai Juz 30
  final List<JuzItem> juzList = [
    JuzItem(
        title: "Juz 1",
        description: "Al-Fatihah & Al-Baqarah ayat 1–141"),
    JuzItem(
        title: "Juz 2",
        description: "Al-Baqarah ayat 142–252"),
    JuzItem(
        title: "Juz 3",
        description: "Al-Baqarah ayat 253–286, Ali Imran ayat 1–92"),
    JuzItem(
        title: "Juz 4",
        description: "Ali Imran ayat 93–200, An-Nisa ayat 1–23"),
    JuzItem(
        title: "Juz 5",
        description: "An-Nisa ayat 24–147"),
    // Bisa diteruskan sampai Juz 30
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Daftar Juz Al-Qur'an"),
      ),
      body: ListView.builder(
        itemCount: juzList.length,
        itemBuilder: (context, index) {
          final item = juzList[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: ListTile(
              title: Text(item.title, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(item.description),
              leading: const Icon(Icons.book),
              onTap: () {
                // Bisa ditambah navigasi ke detail Juz
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text(item.title),
                    content: Text(item.description),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text("Tutup"),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}


