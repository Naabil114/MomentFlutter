import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

import 'model_uang_keluar.dart';

class DatabaseKeuanganHelper {
  DatabaseKeuanganHelper._privateConstructor();
  static final DatabaseKeuanganHelper instance =
      DatabaseKeuanganHelper._privateConstructor();

  static Database? _database;
  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'keuangan.db');
    return await openDatabase(
      path,
      version: 2, // Tingkatkan versi database ke 2
      onCreate: _onCreate,
      onUpgrade: _onUpgrade, // Tambahkan logika upgrade
    );
  }

  Future _onCreate(Database db, int version) async {
    // Tabel uang masuk
    await db.execute('''
      CREATE TABLE uang_masuk(
          id INTEGER PRIMARY KEY,
          keterangan TEXT,
          nominal TEXT,
          jenis TEXT
      )
    ''');

    // Tabel uang keluar
    await db.execute('''
      CREATE TABLE uang_keluar(
          id INTEGER PRIMARY KEY,
          keterangan TEXT,
          nominal TEXT,
          jenis TEXT
      )
    ''');
  }

  Future _onUpgrade(Database db, int oldVersion, int newVersion) async {
    // Upgrade logika jika perlu
    if (oldVersion < 2) {
      // Misalnya, menambahkan kolom jika versi sebelumnya kurang dari 2
      await db.execute('''
        ALTER TABLE uang_masuk ADD COLUMN jenis TEXT;
      ''');
      await db.execute('''
        ALTER TABLE uang_keluar ADD COLUMN jenis TEXT;
      ''');
    }
  }

  
  

  // Ambil semua data uang keluar
  Future<List<UangKeluar>> getAllUangKeluar() async {
    Database db = await instance.database;
    var uangKeluar = await db.query('uang_keluar', orderBy: 'id');
    List<UangKeluar> uangKeluarList = uangKeluar.isNotEmpty
        ? uangKeluar.map((c) => UangKeluar.fromMap(c)).toList()
        : [];
    return uangKeluarList;
  }

  Future<List<UangKeluar>> getUangKeluarById(int id) async {
    Database db = await instance.database;
    var uangKeluar =
        await db.query('uang_Keluar', where: 'id = ?', whereArgs: [id]);
    List<UangKeluar> uangKeluarList = uangKeluar.isNotEmpty
        ? uangKeluar.map((c) => UangKeluar.fromMap(c)).toList()
        : [];
    return uangKeluarList;
  }
  Future<int> addUangKeluar(UangKeluar uangKeluar) async {
    Database db = await instance.database;
    return await db.insert('uang_keluar', uangKeluar.toMap());
  }

  Future<int> updateUangKeluar(UangKeluar uangKeluar) async {
    Database db = await instance.database;
    return await db.update('uang_keluar', uangKeluar.toMap(),
        where: "id = ?", whereArgs: [uangKeluar.id]);
  }

  Future<int> removeUangKeluar(int id) async {
    Database db = await instance.database;
    return await db.delete('uang_keluar', where: 'id = ?', whereArgs: [id]);
  }

  // Menambahkan transaksi uang masuk
  Future<int> addUangMasuk(Map<String, dynamic> uangMasuk) async {
    Database db = await instance.database;
    return await db.insert('uang_masuk', uangMasuk);
  }

  
  

  // Menghapus transaksi uang masuk berdasarkan ID
  Future<int> removeUangMasuk(int id) async {
    Database db = await instance.database;
    return await db.delete('uang_masuk', where: 'id = ?', whereArgs: [id]);
  }

  

  // Mengupdate transaksi uang masuk
  Future<int> updateUangMasuk(Map<String, dynamic> uangMasuk, int id) async {
    Database db = await instance.database;
    return await db.update('uang_masuk', uangMasuk,
        where: "id = ?", whereArgs: [id]);
  }

  
}
