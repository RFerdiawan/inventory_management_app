import 'package:flutter/material.dart';
import 'package:inventory_management/models/barang_model.dart';
import 'package:inventory_management/providers/barang_provider.dart';
import 'package:inventory_management/themes.dart';
import 'package:inventory_management/widgets/card_barang.dart';
import 'package:provider/provider.dart';

class ListBarangPage extends StatelessWidget {
  const ListBarangPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var barangProvider = Provider.of<BarangProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/qrscan');
        },
        child: Icon(Icons.add),
      ),
      body: FutureBuilder<List<BarangModel>>(
          future: barangProvider.getBarangs(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return ListView(
                children: [
                  Column(
                    children: snapshot.data!
                        .map((barang) => CardBarang(barang))
                        .toList(),
                  )
                ],
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
