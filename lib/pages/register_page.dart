import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:inventory_management/pages/navigate_page.dart';
import 'package:inventory_management/themes.dart';
import 'package:sizer/sizer.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //const RegisterPage({Key? key}) : super(key: key);
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  late String nUsername, nPassword;

  final _formKey = GlobalKey<FormState>();

  bool isLoading = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future signUp() async {
    setState(() {
      isLoading = true;
    });

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      print(e);
    }

    setState(() {
      isLoading = false;
    });
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (builder) => NavigatePage()));
  }

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
                    //key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.pushReplacementNamed(
                                    context, '/login');
                              },
                              child: Text(
                                'Login',
                                style: TitleStyle.copyWith(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 24,
                            ),
                            Text(
                              'Register',
                              style: TitleStyle,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please Input Email';
                            }
                            return null;
                          },
                          controller: emailController,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 12,
                              horizontal: 18,
                            ),
                            hintText: 'Masukkan email',
                            labelText: 'Email',
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
                        isLoading
                            ? Center(
                                child: CircularProgressIndicator(),
                              )
                            : ElevatedButton(
                                onPressed: () {
                                  signUp();
                                },
                                child: Text('Register'),
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
