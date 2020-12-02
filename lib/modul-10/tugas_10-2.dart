import 'package:flutter/material.dart';
import 'package:wpi/modul-10/tugas_10-3.dart';

class Restoran2 extends StatefulWidget {
  Restoran2({
    Key key,
    this.nama,
    this.alamat,
    this.makanan,
  }) : super(key: key);
  final String nama;
  final String alamat;
  final String makanan;
  @override
  _Restoran2State createState() => _Restoran2State();
}

class _Restoran2State extends State<Restoran2> {
  TextEditingController minumanController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman 2'),
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
            SizedBox(height: 20),
            Text(
              'Jenis Minuman',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: minumanController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Minuman',
              ),
              autofocus: false,
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Restoran3(
                      nama: widget.nama,
                      alamat: widget.alamat,
                      makanan: widget.makanan,
                      minuman: minumanController.text.toString(),
                    ),
                  ),
                );
                FocusScope.of(context).requestFocus(new FocusNode());
              },
              child: Container(
                padding: EdgeInsets.all(10),
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                alignment: Alignment.center,
                child: Text(
                  'Proses',
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
