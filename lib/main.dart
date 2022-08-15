import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:inventory_management/pages/dashboard_page.dart';
import 'package:inventory_management/pages/detail_barang_page.dart';
import 'package:inventory_management/pages/list_barang_page.dart';
import 'package:inventory_management/pages/login_page.dart';
import 'package:inventory_management/pages/navigate_page.dart';
import 'package:inventory_management/pages/profile_page.dart';
import 'package:inventory_management/pages/qrscan_page.dart';
import 'package:inventory_management/pages/register_page.dart';
import 'package:inventory_management/pages/splash_page.dart';
import 'package:inventory_management/providers/barang_provider.dart';
import 'package:provider/provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<BarangProvider>(
          create: (context) => BarangProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Inventory Management',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: SplashPage(),
        routes: {
          '/home': (context) => DashboardPage(),
          //'/nav': (context) => NavigatePage(),
          '/barang': (context) => ListBarangPage(),
          '/profile': (context) => ProfilePage(),
          '/qrscan': (context) => QRScanPage(),
          '/register': (context) => RegisterPage(),
          '/login': (context) => LoginPage(),
          //'/detail': (context) => DetailBarangPage(),
        },
      ),
    );
  }
}
