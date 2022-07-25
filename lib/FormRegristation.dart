import 'package:flutter/material.dart';

class FormRegristation extends StatefulWidget {
  const FormRegristation({Key? key}) : super(key: key);

  @override
  State<FormRegristation> createState() => _FormRegristationState();
}

class _FormRegristationState extends State<FormRegristation> {
  TextEditingController crtUsername = new TextEditingController();
  TextEditingController crtPassword = new TextEditingController();
  int id = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Registrasi'),),
      body: Container(
        margin: EdgeInsets.all(20),
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
            Text("Pilih Jenis Kelamin", style: TextStyle(fontSize: 16,),),
            SizedBox(height: 20),
            Row(
              children: [
                Radio(
                  value: 1,
                  groupValue: id,
                  onChanged: (val) {
                    setState((){
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
                    setState((){
                      id = 2;
                    });
                  },
                ),
                Text("Perempuan"),
              ],
            ),
            SizedBox(height: 20,),
           Center(
             child: Container(
               height: 30,
               width: 200,
             child:  ElevatedButton(
                 style: ElevatedButton.styleFrom(

                   // padding: EdgeInsets.symmetric(horizontal: 60, vertical: 10),
                 ),
                 onPressed: () {},
                 child: Text("Submit", style: TextStyle(fontSize: 16, color: Colors.white,),

                 )
             ),
             )
           )
          ],
        ),
      ),
    );
  }
}




