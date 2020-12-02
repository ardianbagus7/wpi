import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ClientServer1 extends StatefulWidget {
  @override
  _ClientServer1State createState() => _ClientServer1State();
}

class _ClientServer1State extends State<ClientServer1> {
  String baseUrl = 'http://192.168.43.27/wpi/minggu-11/';

  TextEditingController namaController = TextEditingController();
  TextEditingController alamatController = TextEditingController();

  bool hasil = false;
  bool loading = false;

  String respon = '';

  void fetchData() async {
    loading = true;
    setState(() {});

    String url = baseUrl +
        'proses.php?nama=${namaController.text.toString()}&alamat=${alamatController.text.toString()}';
    final response = await http.get(url);
    respon = response.body;

    loading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Permasalahan 1'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      FocusScope.of(context).requestFocus(new FocusNode());
                      if (!loading) {
                        fetchData();
                      }
                    },
                    child: Container(
                      height: 50,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                      ),
                      alignment: Alignment.center,
                      child: (!loading)
                          ? Text(
                              'Proses',
                              style: TextStyle(color: Colors.white),
                            )
                          : CircularProgressIndicator(
                              backgroundColor: Colors.white,
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
                        respon = '';
                      });
                      FocusScope.of(context).requestFocus(new FocusNode());
                    },
                    child: Container(
                      height: 50,
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
              '$respon',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
