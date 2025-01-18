import 'package:flutter/material.dart';
import 'database_keuangan.dart';
import 'model_uang_keluar.dart';
import 'main_page.dart';

class InputUangKeluar extends StatefulWidget {
  const InputUangKeluar({Key? key}) : super(key: key);

  @override
  _InputUangKeluarState createState() => _InputUangKeluarState();
}

class _InputUangKeluarState extends State<InputUangKeluar> {
  final TextEditingController keteranganController = TextEditingController();
  final TextEditingController nominalController = TextEditingController();
  final TextEditingController jenisController =
      TextEditingController(); // Optional, jika diperlukan

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Input Uang Keluar"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: Column(
            children: [
              TextField(
                controller: keteranganController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Keterangan',
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              TextField(
                controller: nominalController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Nominal',
                    prefixText: '\Rp.',
                    suffixText: 'Rupiah',
                    suffixStyle: TextStyle(color: Colors.green)),
              ),
              const SizedBox(
                height: 25,
              ),
              TextField(
                controller:jenisController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Jenis (Keluar/Masuk)',
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              ElevatedButton(
                onPressed: () async {
                  // Add uang keluar to the database
                  await DatabaseKeuanganHelper.instance.addUangKeluar(
                    UangKeluar(
                        keterangan: keteranganController.text,
                        nominal: nominalController.text,
                        jenis: jenisController.text),
                  );

                  // Navigate back to the home screen
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MainPage(),
                    ),
                    (route) => false,
                  );
                },
                child: const Text("Simpan"),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
