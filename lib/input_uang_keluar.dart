import 'package:flutter/material.dart';
import 'data_uang_keluar.dart';
import 'database_keuangan.dart';
import 'model_uang_keluar.dart'; // Import model UangKeluar

class InputUangKeluar extends StatefulWidget {
  const InputUangKeluar({Key? key}) : super(key: key);

  @override
  _InputUangKeluarState createState() => _InputUangKeluarState();
}

class _InputUangKeluarState extends State<InputUangKeluar> {
  final TextEditingController keteranganController = TextEditingController();
  final TextEditingController nominalController = TextEditingController();
  final TextEditingController jenisController = TextEditingController(); // Optional, jika diperlukan

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
              TextFormField(
                controller: keteranganController,
                decoration: const InputDecoration(
                  labelText: "Keterangan",
                ),
              ),
              TextFormField(
                controller: nominalController,
                decoration: const InputDecoration(labelText: "Nominal"),
                keyboardType: TextInputType.number,
              ),
              // Optional: Add drop-down or text input for "jenis" (keluar or masuk)
              TextFormField(
                controller: jenisController,
                decoration: const InputDecoration(labelText: "Jenis (keluar/masuk)"),
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
                    MaterialPageRoute(builder: (context) => DataUangKeluar()),
                    (Route<dynamic> route) => false,
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
