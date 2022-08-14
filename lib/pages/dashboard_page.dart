import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:inventory_management/themes.dart';
import 'package:sizer/sizer.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  String greeting() {
    var jam = DateTime.now().hour;
    if (jam < 12) {
      return 'Pagi';
    }
    if (jam < 15) {
      return 'Siang';
    }
    if (jam < 18) {
      return 'Sore';
    }
    return 'Malam';
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;

    return Scaffold(
        appBar: AppBar(
          title: Text('Dashboard'),
        ),
        body: Sizer(builder: (context, orientation, deviceType) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 24,
                ),
                Container(
                  child: Text(
                    'Selamat ' + greeting() + ', ' + user.email.toString(),
                    style: greetStyle,
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                Container(
                  child: Text(
                    'Analisis Stok',
                    style: TitleStyle,
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    Container(
                      height: 102,
                      width: 42.w,
                      decoration: BoxDecoration(
                        color: Color(0xff0F52BA),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              'assets/iconproductin.png',
                              height: 24,
                              width: 24,
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              '3000',
                              style: jumlahStyle,
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              'Product In',
                              style: judulCardStyle,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      height: 102,
                      width: 42.w,
                      decoration: BoxDecoration(
                        color: Color(0xffFFB830),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              'assets/iconproductout.png',
                              height: 24,
                              width: 24,
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              '2600',
                              style: jumlahStyle,
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              'Product Out',
                              style: judulCardStyle,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 76,
                  width: 90.w,
                  decoration: BoxDecoration(
                    color: Color(0xff3DB2FF),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 15),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 18,
                        ),
                        Icon(
                          Icons.inventory_2,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '400',
                              style: jumlahStyle,
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              'Total Product',
                              style: judulCardStyle,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 34,
                ),
                Container(
                  height: 44,
                  width: 90.w,
                  decoration: BoxDecoration(
                    color: Color(0xff0F52BA),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/qrscan');
                    },
                    child: Text(
                      'Add Product',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          );
        }));
  }
}
