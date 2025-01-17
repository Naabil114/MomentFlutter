import 'package:flutter/material.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // dashboard total keluar masuk uang
          Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Row(children: [
                  Container(
                    child: Icon(Icons.download, color: Colors.green),
                    decoration: BoxDecoration(
                      color: Colors.white, 
                      borderRadius: BorderRadius.circular(8)),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                   Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Uang Masuk"), 
                      SizedBox(height: 10,),
                      Text("Rp. 1.000.000")
                    ],
                  )
                ],
                ),

                Row(children: [
                  Container(
                    child: Icon(Icons.upload, color: Colors.red),
                    decoration: BoxDecoration(
                      color: Colors.white, 
                      borderRadius: BorderRadius.circular(8)),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                   Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Uang Keluar"), 
                      SizedBox(height: 10,),
                      Text("Rp. 1.000.000")
                    ],
                  )
                ],
                )

              ],),
              width: double.infinity,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.blue[800],
                borderRadius: BorderRadius.circular(16)),
            ),
          ),

        // Transaksi
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text("Transaksi"
            ),
          ),

          // list transaksi
          Padding(
            padding: const EdgeInsets.all(16),
            child: Card(
              elevation: 10,
              child: ListTile(
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.edit),
                    SizedBox(width: 10,),
                     Icon(Icons.delete)
                  ],
                ),
                title: Text("Rp.20.000"),
                subtitle: Text("Makan siang"),
                leading: Container(
                        child: Icon(Icons.upload, color: Colors.red),
                        decoration: BoxDecoration(
                          color: Colors.white, 
                          borderRadius: BorderRadius.circular(8)),
                      ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Card(
              elevation: 10,
              child: ListTile(
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.edit),
                    SizedBox(width: 10,),
                     Icon(Icons.delete)
                  ],
                ),
                title: Text("Rp.200.000"),
                subtitle: Text("Gaji harian"),
                leading: Container(
                        child: Icon(Icons.download, color: Colors.green),
                        decoration: BoxDecoration(
                          color: Colors.white, 
                          borderRadius: BorderRadius.circular(8)),
                      ),
              ),
            ),
          )
        ],
        )),
    );
  }
}