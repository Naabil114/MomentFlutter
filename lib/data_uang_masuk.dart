import 'package:flutter/material.dart';

class UangMasuk extends StatefulWidget {
  const UangMasuk({super.key});

  @override
  State<UangMasuk> createState() => _UangMasukState();
}

class _UangMasukState extends State<UangMasuk> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Uang Masuk"),
        backgroundColor: Colors.green[800],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Dashboard total keluar masuk uang
                
                const SizedBox(height: 20),

                // Transaksi section
                const Text(
                  "Uang Masuk",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),

                // List transaksi
                Card(
                  elevation: 10,
                  child: ListTile(
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(Icons.edit),
                        SizedBox(width: 10),
                        Icon(Icons.delete),
                      ],
                    ),
                    title: const Text("Rp.20.000"),
                    subtitle: const Text("Makan siang"),
                    leading: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(Icons.upload, color: Colors.red),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Card(
                  elevation: 10,
                  child: ListTile(
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(Icons.edit),
                        SizedBox(width: 10),
                        Icon(Icons.delete),
                      ],
                    ),
                    title: const Text("Rp.200.000"),
                    subtitle: const Text("Gaji harian"),
                    leading: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(Icons.download, color: Colors.green),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Aksi ketika tombol tambah ditekan
          print("Tambah Transaksi");
        },
        backgroundColor: Colors.blue[800],
        child: const Icon(Icons.add),
      ),
    );
  }
}
