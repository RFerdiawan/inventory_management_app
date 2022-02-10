import 'package:flutter/material.dart';
import 'package:inventory_management/models/barang_model.dart';
import 'package:inventory_management/pages/edit_product_page.dart';
import 'package:inventory_management/pages/navigate_page.dart';
import 'package:inventory_management/providers/barang_provider.dart';
import 'package:inventory_management/themes.dart';
import 'package:sizer/sizer.dart';

class DetailBarangPage extends StatefulWidget {
  late final BarangModel barang;
  DetailBarangPage(this.barang);

  @override
  State<DetailBarangPage> createState() => _DetailBarangPageState();
}

class _DetailBarangPageState extends State<DetailBarangPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Product'),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 24,
            ),
            Text(
              widget.barang.nama.toString(),
              style: detailNamaStyle,
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Lokasi',
                      style: detailTitleStyle,
                    ),
                    Text(
                      widget.barang.lokasi.toString(),
                      style: cardListDescStyle,
                    ),
                  ],
                ),
                SizedBox(
                  width: 45.w,
                ),
                Column(
                  children: [
                    Text(
                      'Jumlah',
                      style: detailTitleStyle,
                    ),
                    Text(
                      widget.barang.jumlah.toString(),
                      style: cardListDescStyle,
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Deskripsi',
                  style: detailTitleStyle,
                ),
                Text(
                  widget.barang.deskripsi.toString(),
                  style: cardListDescStyle,
                ),
              ],
            ),
            SizedBox(
              height: 34,
            ),
            Container(
              height: 38,
              width: 95.w,
              decoration: BoxDecoration(
                color: Color(0xff3db2ff),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              EditProductPage(widget.barang)));
                },
                child: Text(
                  'Edit',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              height: 38,
              width: 95.w,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color(0xffff2442),
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextButton(
                onPressed: () async {
                  BarangModel? barang =
                      await BarangProvider.delete(widget.barang.id.toString());
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => NavigatePage()),
                      (route) => false);
                },
                child: Text(
                  'Delete',
                  style: TextStyle(color: Color(0xffff2442)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
