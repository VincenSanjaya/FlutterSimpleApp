import 'package:belajar_flutter/pertemuan1/FormRegristation.dart';
import 'package:flutter/material.dart';


class SecondRoute extends StatefulWidget {
  const SecondRoute({Key? key}) : super(key: key);

  @override
  State<SecondRoute> createState() => _SecondRouteState();
}

class _SecondRouteState extends State<SecondRoute> {
  TextEditingController ctrPhone = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Route'),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: ctrPhone,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Input Phone Number",
              ),
            ),

            SizedBox(height: 20),

            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, ctrPhone.text);
                },
                child: Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}
