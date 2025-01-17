import 'package:flutter/material.dart';
import 'database_keuangan.dart';
import 'input_uang_keluar.dart';
import 'model_uang_keluar.dart';
import 'edit_uang_keluar.dart';

class DataUangKeluar extends StatefulWidget {
  const DataUangKeluar({Key? key}) : super(key: key);

  @override
  State<DataUangKeluar> createState() => _DataUangKeluarState();
}

class _DataUangKeluarState extends State<DataUangKeluar> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Uang Keluar"),
        backgroundColor: const Color.fromARGB(255, 250, 30, 34),
      ),
      body: SafeArea(
        child: FutureBuilder<List<UangKeluar>>(
          future: DatabaseKeuanganHelper.instance.getAllUangKeluar(), // Fetch data from database
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: Text("Loading..."),
              );
            }
            final data = snapshot.data!;
            return data.isEmpty
                ? const Center(
                    child: Text("Tidak ada data uang keluar."),
                  )
                : ListView(
                    padding: const EdgeInsets.all(16),
                    children: data.map((uangKeluar) {
                      return Center(
                        child: Card(
                          color: Colors.white70,
                          child: ListTile(
                            leading: const Icon(
                              Icons.upload,
                              color: Colors.red,
                            ),
                            title: Text("Rp. ${uangKeluar.nominal ?? 'Nominal tidak tersedia'}"),
                            subtitle: Text(uangKeluar.keterangan ?? 'Keterangan tidak tersedia'),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                InkWell(
                                  child: const Icon(
                                    Icons.edit,
                                    size: 30,
                                    color: Colors.blue,
                                  ),
                                  onTap: () {
                                    // Edit functionality here
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => (EditUangKeluar(
                                        id: uangKeluar.id,
                                        keterangan: uangKeluar.keterangan,
                                        nominal: uangKeluar.nominal,
                                        jenis: uangKeluar.jenis,

                                      )),
                                      ),
                                    );
                                  },
                                ),
                                const SizedBox(width: 10),
                                InkWell(
                                  child: const Icon(
                                    Icons.delete_forever_rounded,
                                    size: 30,
                                    color: Colors.red,
                                  ),
                                  onTap: () async {
                                    // Delete functionality
                                    await DatabaseKeuanganHelper.instance.removeUangKeluar(uangKeluar.id!);
                                    setState(() {
                                      // Refresh the list after deletion
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to the input page to add new "uang keluar"
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => InputUangKeluar(), // Navigate to input form
            ),
          );
        },
        backgroundColor: Colors.blue[800],
        child: const Icon(Icons.add),
      ),
    );
  }
}
