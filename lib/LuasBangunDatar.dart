import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LuasBangunDatar extends StatefulWidget {
  const LuasBangunDatar({Key? key}) : super(key: key);

  @override
  State<LuasBangunDatar> createState() => _LuasBangunDatarState();
}

class _LuasBangunDatarState extends State<LuasBangunDatar> {
  TextEditingController crtPanjang = new TextEditingController();
  TextEditingController crtLebar = new TextEditingController();
  int result = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Luas Bangun Datar Persegi Panjang'),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Masukan Panjang Persegi Panjang",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 20),
            TextField(
                controller: crtPanjang,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Input Panjang',
                ),
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ]),
            SizedBox(height: 20),
            Text(
              "Masukan Lebar Persegi Panjang",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
              controller: crtLebar,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Input Lebar',
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Container(
                height: 50,
                width: 100,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      LuasPersegiPanjang();
                    });

                  },
                    child: Text("Submit")),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Luas Persegi Panjang :  ${result.toString()}",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
  void LuasPersegiPanjang () {
    if (crtPanjang.text.isEmpty || crtLebar.text.isEmpty) {
      Alert(
        context: context,
        title: "Error",
        type: AlertType.error,
        desc: "Please fill all the fields",
        buttons: [
          DialogButton(
            child: Text(
              "Kembali",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ).show();
    } else {
      setState(() {
        result = int.parse(crtPanjang.text) * int.parse(crtLebar.text);
      });
    }
  }
  }