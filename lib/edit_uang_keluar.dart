import 'package:flutter/material.dart';
import 'database_keuangan.dart';
import 'model_uang_keluar.dart'; // Model UangKeluar
// import 'data_uang_keluar.dart';
import 'main_page.dart';
class EditUangKeluar extends StatefulWidget {
   int? id; // ID untuk mengidentifikasi data yang akan diedit
   String? keterangan;
   String? nominal;
   String? jenis;

  EditUangKeluar({
    Key? key,
    required this.id,
    required this.keterangan,
    required this.nominal,
    required this.jenis,
  }) : super(key: key);

  @override
  _EditUangKeluarState createState() => _EditUangKeluarState();
}

class _EditUangKeluarState extends State<EditUangKeluar> {
  final TextEditingController keteranganController = TextEditingController();
  final TextEditingController nominalController = TextEditingController();
  final TextEditingController jenisController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Mengisi controller dengan data yang sudah ada
    keteranganController.text = widget.keterangan!;
    nominalController.text = widget.nominal!;
    jenisController.text = widget.jenis!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Uang Keluar"),
        backgroundColor: const Color.fromARGB(255, 250, 30, 34),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
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
                // Update data uang keluar di database
                await DatabaseKeuanganHelper.instance.updateUangKeluar(
                  UangKeluar(
                    id: widget.id,
                    keterangan: keteranganController.text,
                    nominal: nominalController.text,
                    jenis: jenisController.text,
                  ),
                );
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => MainPage()),
                  (Route<dynamic> route) => false,
                  
                ); 
              },
              child: const Text("Simpan Perubahan"),
            ),
          ],
        ),
      ),
    );
  }
}
