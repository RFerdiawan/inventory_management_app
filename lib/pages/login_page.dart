import 'package:flutter/material.dart';
import 'package:inventory_management/pages/navigate_page.dart';
import 'package:inventory_management/themes.dart';
import 'package:sizer/sizer.dart';

class LoginPage extends StatelessWidget {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  late String nUsername, nPassword;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 12),
                  child: Center(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 32,
                        ),
                        Image.asset(
                          'assets/loginilustrasi.gif',
                          height: 50.w,
                          width: 50.w,
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                          'Permudah mencatat barang',
                          style: TitleStyle,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                          'Sekarang kamu dapat mempermudah mencatat produk dengan sekali scan',
                          style: DescStyle,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 28,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 18),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Login',
                          style: TitleStyle,
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please Input Username';
                            }
                            return null;
                          },
                          controller: usernameController,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 12,
                              horizontal: 18,
                            ),
                            hintText: 'Masukkan username',
                            labelText: 'Username',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)),
                          ),
                        ),
                        SizedBox(
                          height: 18,
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please Input Password';
                            } else if (nPassword.length < 5) {
                              return 'Wrong Password';
                            }
                            return null;
                          },
                          controller: passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 12,
                              horizontal: 18,
                            ),
                            hintText: 'Masukkan password',
                            labelText: 'Password',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)),
                          ),
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            nUsername = usernameController.text;
                            nPassword = passwordController.text;

                            if (_formKey.currentState!.validate()) {
                              if (nPassword.length < 5) {
                                print("password tidak sesuai");
                              } else {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => NavigatePage()));
                              }
                            }
                          },
                          child: Text('Login'),
                          style: ElevatedButton.styleFrom(
                            fixedSize: Size(95.w, 40),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            primary: Color(0xff3DB2FF),
                          ),
                        ),
                        SizedBox(
                          height: 24,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
