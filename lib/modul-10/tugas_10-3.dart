import 'package:flutter/material.dart';

import 'tugas_10-1.dart';

class Restoran3 extends StatefulWidget {
  Restoran3({
    Key key,
    this.nama,
    this.alamat,
    this.makanan,
    this.minuman,
  }) : super(key: key);
  final String nama;
  final String alamat;
  final String makanan;
  final String minuman;
  @override
  _Restoran3State createState() => _Restoran3State();
}

class _Restoran3State extends State<Restoran3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman 3'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Text(
              'Daftar Pesanan',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Nama: ${widget.nama}',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Alamat: ${widget.alamat}',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Makanan: ${widget.makanan}',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Minuman: ${widget.minuman}',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => Restoran()),
                  ModalRoute.withName('/'),
                );
              },
              child: Container(
                padding: EdgeInsets.all(10),
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                alignment: Alignment.center,
                child: Text(
                  'Kembali',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
