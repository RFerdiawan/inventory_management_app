import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:inventory_management/pages/login_page.dart';
import 'package:inventory_management/themes.dart';
import 'package:sizer/sizer.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;

    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          children: [
            SizedBox(
              height: 24,
            ),
            InkWell(
              onTap: () {},
              child: Container(
                width: 95.w,
                height: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        //spreadRadius: 1,
                        blurRadius: 15,
                        offset: Offset.fromDirection(3),
                      )
                    ]),
                child: Row(
                  children: [
                    SizedBox(
                      width: 24,
                    ),
                    Icon(
                      Icons.account_circle,
                      size: 80,
                      color: Color(0xff838383),
                    ),
                    SizedBox(
                      width: 18,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          user.email.toString(),
                        ),
                        SizedBox(
                          height: 18,
                        ),
                        Text('Procurement Staff')
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 18,
            ),
            InkWell(
              onTap: () {},
              child: Container(
                child: Row(
                  children: [
                    Container(
                      height: 48,
                      width: 48,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color(0xffffedda),
                      ),
                      child: Icon(Icons.help_outline_rounded),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Text(
                      'Help',
                      style: regularStyle,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 14,
            ),
            InkWell(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return Padding(
                      padding: const EdgeInsets.all(24),
                      child: Container(
                          height: 250,
                          color: Colors.white,
                          child: Center(
                              child: Column(
                            children: [
                              Image.asset(
                                'assets/logosplash.png',
                                width: 60,
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              Text(
                                'About App',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w700),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              Text(
                                'Aplikasi ini dibuat oleh Randy Ferdiawan',
                                textAlign: TextAlign.center,
                              )
                            ],
                          ))),
                    );
                  },
                );
              },
              child: Container(
                child: Row(
                  children: [
                    Container(
                      height: 48,
                      width: 48,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color(0xffffedda),
                      ),
                      child: Icon(Icons.privacy_tip_outlined),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Text(
                      'About App',
                      style: regularStyle,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 14,
            ),
            InkWell(
              onTap: () {},
              child: Container(
                child: Row(
                  children: [
                    Container(
                      height: 48,
                      width: 48,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color(0xffffedda),
                      ),
                      child: Icon(Icons.feedback_outlined),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Text(
                      'Feedback',
                      style: regularStyle,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 14,
            ),
            InkWell(
              onTap: () => FirebaseAuth.instance.signOut(),
              child: Container(
                child: Row(
                  children: [
                    Container(
                      height: 48,
                      width: 48,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color(0xffffedda),
                      ),
                      child: Icon(Icons.logout_outlined),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Text(
                      'Logout',
                      style: regularStyle,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 14,
            ),
          ],
        ),
      ),
    );
  }
}
