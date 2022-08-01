import 'package:flutter/material.dart';
import 'SecondRoute.dart';

class FormRegristation extends StatefulWidget {
  const FormRegristation({Key? key}) : super(key: key);

  @override
  State<FormRegristation> createState() => _FormRegristationState();
}


class _FormRegristationState extends State<FormRegristation> {
  TextEditingController crtUsername = new TextEditingController();
  TextEditingController crtPassword = new TextEditingController();
  int id = 1;
  String myPhone = "-";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Registrasi'),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Username',
              ),
            ),
            SizedBox(height: 20),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Pilih Jenis Kelamin",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Radio(
                  value: 1,
                  groupValue: id,
                  onChanged: (val) {
                    setState(() {
                      id = 1;
                    });
                  },
                ),
                Text("Laki-laki"),
              ],
            ),
            Row(
              children: [
                Radio(
                  value: 2,
                  groupValue: id,
                  onChanged: (val) {
                    setState(() {
                      id = 2;
                    });
                  },
                ),
                Text("Perempuan"),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [Text("Phone Number : " + myPhone)],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
               ElevatedButton(
                  onPressed: () async {
                    final result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SecondRoute(),
                      ),
                    );
                    print("Hasil input phone number : " + result.toString());
                    setState(() {
                      myPhone = result.toString();
                    });
                  },

                  child: Text("Phone Number"),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Center(
                child: Container(
              height: 35,
              width: 200,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      // padding: EdgeInsets.symmetric(horizontal: 60, vertical: 10),
                      ),
                  onPressed: () {},
                  child: Text(
                    "Submit",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  )),
            ))
          ],
        ),
      ),
    );
  }

  Future<void> _navigateAndDisplaySelection(BuildContext context) async {

  final result = await Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const SecondRoute()),
  );

  if (!mounted) return;

  ScaffoldMessenger.of(context)
    ..removeCurrentSnackBar()
    ..showSnackBar(SnackBar(content: Text('$result')));
}

}

