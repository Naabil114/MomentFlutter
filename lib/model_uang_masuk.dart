class UangKeluar {
  final int? id;
  final String? keterangan;
  final String? nominal;
  final String? jenis;

  UangKeluar({this.id ,this.keterangan, this.nominal, this.jenis});

  factory UangKeluar.fromMap(Map<String, dynamic> json) => UangKeluar(
        id: json['id'],
        keterangan: json['keterangan'],
        nominal: json['nominal'],
        jenis: json['jenis'],
      );
      

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'keterangan': keterangan,
      'nominal': nominal,
      'jenis': jenis,
    };
  }
}
