import 'package:flutter/material.dart';

class ListInfoScreen extends StatelessWidget {
  final List<Map<String, String>> items = List.generate(
    10,
        (index) => {
      'title': 'Informasi ${index + 1}',
      'subtitle': 'Deskripsi singkat ${index + 1}',
      'icon': '📌'
    },
  );

  ListInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('List Informasi')),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: GridView.builder(
          itemCount: items.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 3/2,
          ),
          itemBuilder: (context, index) {
            final item = items[index];
            return Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(item['icon']!, style: const TextStyle(fontSize: 40)),
                    const SizedBox(height: 10),
                    Text(item['title']!, style: const TextStyle(fontWeight: FontWeight.bold)),
                    Text(item['subtitle']!, textAlign: TextAlign.center),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

