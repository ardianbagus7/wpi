import 'package:flutter/material.dart';

class Permasalahan2 extends StatefulWidget {
  @override
  _Permasalahan2State createState() => _Permasalahan2State();
}

class _Permasalahan2State extends State<Permasalahan2> {
  TextEditingController namaController = TextEditingController();
  TextEditingController alamatController = TextEditingController();

  bool value1 = false;
  bool value2 = false;
  bool value3 = false;
  bool hasil = false;

  List<String> makanan = [];
  String hasilMakanan = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Permasalahan 2'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Text(
                'Restoran Farina',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
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
              SizedBox(height: 10),
              TextField(
                controller: alamatController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Alamat',
                ),
                autofocus: false,
              ),
              SizedBox(height: 20),
              Text(
                'Jenis Makanan',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              CheckboxListTile(
                title: Text("Pecel Kediri"),
                value: value1,
                contentPadding: EdgeInsets.all(0),
                onChanged: (newValue) {
                  setState(() {
                    value1 = newValue;
                    if (value1) {
                      makanan.add('Pecel Kediri');
                    } else {
                      makanan.remove('Pecel Kediri');
                    }
                  });

                  print(makanan.length);
                },
                controlAffinity: ListTileControlAffinity.leading,
              ),
              CheckboxListTile(
                title: Text("Rawon Yogya"),
                value: value2,
                contentPadding: EdgeInsets.all(0),
                onChanged: (newValue) {
                  setState(() {
                    value2 = newValue;
                    if (value2) {
                      makanan.add('Rawon Yogya');
                    } else {
                      makanan.remove('Rawon Yogya');
                    }
                  });

                  print(makanan.length);
                },
                controlAffinity: ListTileControlAffinity.leading,
              ),
              CheckboxListTile(
                title: Text("Lontong Kupang Surabaya"),
                value: value3,
                contentPadding: EdgeInsets.all(0),
                onChanged: (newValue) {
                  setState(() {
                    value3 = newValue;
                    if (value3) {
                      makanan.add('Lontong Kupang Surabaya');
                    } else {
                      makanan.remove('Lontong Kupang Surabaya');
                    }
                  });
                  print(makanan.length);
                },
                controlAffinity: ListTileControlAffinity.leading,
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        hasilMakanan = makanan.join(' ,');
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
                          namaController.clear();
                          alamatController.clear();
                          makanan = [];
                          value1 = false;
                          value2 = false;
                          value3 = false;
                          hasil = false;
                          hasilMakanan = '';
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
                  'Alamat: ${alamatController.text.toString()}',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Makanan: $hasilMakanan',
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
