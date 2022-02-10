import 'package:flutter/material.dart';
import 'package:inventory_management/models/barang_model.dart';
import 'package:inventory_management/pages/detail_barang_page.dart';
import 'package:inventory_management/themes.dart';

class CardBarang extends StatelessWidget {
  final BarangModel barang;

  const CardBarang(this.barang);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => DetailBarangPage(barang)));
      },
      child: Container(
        margin: EdgeInsets.only(left: 18, right: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 16,
            ),
            Container(
              height: 67,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 15,
                    offset: Offset(0, 4), // changes position of shadow
                  ),
                ],
                color: Colors.white,
              ),
              padding: EdgeInsets.symmetric(horizontal: 18, vertical: 9),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        barang.nama.toString(),
                        style: cardListTitleStyle,
                      ),
                      Text(
                        barang.jumlah.toString() + ' Unit',
                        style: cardListDescStyle,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    barang.lokasi.toString(),
                    style: cardListDescStyle,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
