import 'package:flutter/material.dart';
import 'package:inventory_management/pages/add_product_page.dart';
import 'package:inventory_management/themes.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:sizer/sizer.dart';

class QRScanPage extends StatefulWidget {
  const QRScanPage({Key? key}) : super(key: key);

  @override
  _QRScanPageState createState() => _QRScanPageState();
}

class _QRScanPageState extends State<QRScanPage> {
  final GlobalKey qrKey = GlobalKey();
  String result = '';

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scan'),
      ),
      body: Column(
        children: [
          Expanded(
            child: QRView(
              key: qrKey,
              overlay: QrScannerOverlayShape(
                cutOutSize: MediaQuery.of(context).size.width * 0.8,
                borderWidth: 10,
                borderRadius: 15,
                borderLength: 20,
                borderColor: Colors.white,
              ),
              onQRViewCreated: (controller) {
                controller.scannedDataStream.listen((value) {
                  setState(() {
                    result = value.code;
                  });
                });
              },
            ),
          ),
          Container(
            height: 35.h,
            child: Column(
              children: [
                SizedBox(
                  height: 12,
                ),
                Center(
                  child: Text(
                    'Scan QR code untuk \nmenambahkan produk',
                    textAlign: TextAlign.center,
                    style: DescStyle,
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Center(
                  child: Text('Result: $result'),
                ),
                SizedBox(
                  height: 12,
                ),
                Container(
                  height: 38,
                  width: 90.w,
                  decoration: BoxDecoration(
                    color: Color(0xff03db2ff),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddProductPage(result)),
                      );
                    },
                    child: Text(
                      'Add Product',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
