import 'dart:ui';

import 'package:flutter/material.dart';

class Permasalahan1 extends StatefulWidget {
  @override
  _Permasalahan1State createState() => _Permasalahan1State();
}

class _Permasalahan1State extends State<Permasalahan1> {
  TextEditingController namaController = TextEditingController();
  TextEditingController nrpController = TextEditingController();
  String radioText;
  bool hasil = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Permasalahan 1'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Text(
                'Data Mahasiswa PENS',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: nrpController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'NRP',
                ),
                autofocus: false,
              ),
              SizedBox(height: 10),
              TextField(
                controller: namaController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Nama',
                ),
                autofocus: false,
              ),
              SizedBox(height: 20),
              Text(
                'Jurusan',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              ListTile(
                title: const Text('Teknik Informatika'),
                leading: Radio(
                  value: 'Teknik Informatika',
                  groupValue: radioText,
                  onChanged: (value) {
                    setState(() {
                      radioText = value;
                    });
                  },
                ),
                contentPadding: EdgeInsets.all(0),
              ),
              ListTile(
                title: const Text('Teknik Telekomunikasi'),
                leading: Radio(
                  value: 'Teknik Telekomunikasi',
                  groupValue: radioText,
                  onChanged: (value) {
                    setState(() {
                      radioText = value;
                    });
                  },
                ),
                contentPadding: EdgeInsets.all(0),
              ),
              ListTile(
                title: const Text('Teknik Mekatronika'),
                leading: Radio(
                  value: 'Teknik Mekatronika',
                  groupValue: radioText,
                  onChanged: (value) {
                    setState(() {
                      radioText = value;
                    });
                  },
                ),
                contentPadding: EdgeInsets.all(0),
              ),
              ListTile(
                title: const Text('Teknik Elektronika'),
                leading: Radio(
                  value: 'Teknik Elektronika',
                  groupValue: radioText,
                  onChanged: (value) {
                    setState(() {
                      radioText = value;
                    });
                  },
                ),
                contentPadding: EdgeInsets.all(0),
              ),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          hasil = true;
                        });
                        FocusScope.of(context).requestFocus(new FocusNode());
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
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
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          radioText = '';
                          namaController.clear();
                          nrpController.clear();
                          hasil = false;
                        });
                        FocusScope.of(context).requestFocus(new FocusNode());
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.red,
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          'Reset',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              if (hasil) ...[
                SizedBox(height: 20),
                Text(
                  'Hasil',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Nama: ${namaController.text.toString()}',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'NRP: ${nrpController.text.toString()}',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Jurusan: $radioText',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ]
            ],
          ),
        ),
      ),
    );
  }
}
