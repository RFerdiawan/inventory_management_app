class BarangModel {
  int? id;
  String? nama;
  String? lokasi;
  int? jumlah;
  String? deskripsi;
  DateTime? createdAt;
  DateTime? updatedAt;

  BarangModel({
    this.id,
    this.nama,
    this.lokasi,
    this.jumlah,
    this.deskripsi,
    this.createdAt,
    this.updatedAt,
  });

  BarangModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nama = json['nama'];
    lokasi = json['lokasi'];
    jumlah = json['jumlah'];
    deskripsi = json['deskripsi'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nama': nama,
      'lokasi': lokasi,
      'jumlah': jumlah,
      'deskripsi': deskripsi,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }
}
