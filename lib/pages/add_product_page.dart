import 'package:flutter/material.dart';
import 'package:inventory_management/models/barang_model.dart';
import 'package:inventory_management/pages/navigate_page.dart';
import 'package:inventory_management/providers/barang_provider.dart';
import 'package:inventory_management/themes.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class AddProductPage extends StatefulWidget {
  final result;
  AddProductPage(this.result);

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  TextEditingController namaController = TextEditingController(text: '');
  TextEditingController lokasiController = TextEditingController(text: '');
  TextEditingController jumlahController = TextEditingController(text: '');
  TextEditingController deskripsiController = TextEditingController(text: '');
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    var barangProvider = Provider.of<BarangProvider>(context);

    void showError(String message) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text(message),
        ),
      );
    }

    void showSuccess(String message) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.green,
          content: Text(message),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Add Product'),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 24,
              ),
              Text(
                'Masukkan detail produk yang akan \ndicatat',
                style: addProductDescStyle,
              ),
              SizedBox(
                height: 14,
              ),
              TextFormField(
                controller: namaController,
                //initialValue: widget.result,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 18,
                  ),
                  hintText: 'Masukkan nama produk',
                  labelText: 'Nama Produk',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              TextFormField(
                controller: lokasiController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 18,
                  ),
                  hintText: 'Masukkan lokasi produk',
                  labelText: 'Lokasi Produk',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              TextFormField(
                controller: jumlahController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 18,
                  ),
                  hintText: 'Masukkan jumlah produk',
                  labelText: 'Jumlah Produk',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              TextFormField(
                controller: deskripsiController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 18,
                  ),
                  hintText: 'Masukkan deskripsi produk',
                  labelText: 'Deskripsi Produk',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Container(
                height: 38,
                width: 95.w,
                decoration: BoxDecoration(
                  color: Color(0xff03db2ff),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: isLoading
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : TextButton(
                        onPressed: () async {
                          if (namaController.text.isEmpty ||
                              lokasiController.text.isEmpty ||
                              jumlahController.text.isEmpty ||
                              deskripsiController.text.isEmpty) {
                            showError('semua field harus diisi');
                          } else {
                            setState(() {
                              isLoading = true;
                            });
                            BarangModel? barang =
                                await barangProvider.postBarang(
                                    namaController.text,
                                    lokasiController.text,
                                    jumlahController.text,
                                    deskripsiController.text);

                            setState(() {
                              isLoading = false;
                            });

                            if (barang == null) {
                              showSuccess('Barang berhasil didaftarkan');
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => NavigatePage()),
                                  (route) => false);
                            } else {
                              barangProvider.barang = barang;
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => NavigatePage()),
                                  (route) => false);
                            }
                          }
                        },
                        child: Text(
                          'Add',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
