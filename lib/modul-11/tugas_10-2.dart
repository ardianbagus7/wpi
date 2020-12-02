import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Berita extends StatefulWidget {
  @override
  _BeritaState createState() => _BeritaState();
}

class _BeritaState extends State<Berita> {
  String baseUrl = 'http://192.168.43.27/wpi/minggu-11/';

  String radioText;

  bool hasil = false;
  bool loading = false;

  String respon = '';

  void fetchData() async {
    loading = true;
    setState(() {});

    String url = baseUrl + 'berita.php?berita=$radioText';
    final response = await http.get(url);
    respon = response.body;

    loading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Permasalahan 2'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            ListTile(
              title: const Text('Ekonomi'),
              leading: Radio(
                value: 'Ekonomi',
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
              title: const Text('Teknologi'),
              leading: Radio(
                value: 'Teknologi',
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
              title: const Text('Sepakbola'),
              leading: Radio(
                value: 'Sepakbola',
                groupValue: radioText,
                onChanged: (value) {
                  setState(() {
                    radioText = value;
                  });
                },
              ),
              contentPadding: EdgeInsets.all(0),
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
                        radioText = '';
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
