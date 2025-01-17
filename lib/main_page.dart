import 'package:flutter/material.dart';
import 'data_uang_keluar.dart';
import 'data_uang_masuk.dart';
import 'home.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<Widget> _childern  = [Home(), DataUangKeluar(), UangMasuk()];
  int currentIndex = 0;

  void onTapTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        onTapTapped(0);
      },
       backgroundColor: Colors.blue, 
       child: const Icon(Icons.home),
       ),
       body: _childern[currentIndex],
       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
       bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
        IconButton(onPressed: () {
          onTapTapped(2);
        }, icon: Icon(Icons.arrow_circle_down)),
        SizedBox(
          width: 20,
          ),
        IconButton(onPressed: () {
          onTapTapped(1);
        }, icon: Icon(Icons.arrow_circle_up)),
        ]),
      ));
  }
}