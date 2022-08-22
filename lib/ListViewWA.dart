import 'package:flutter/material.dart';

class ListViewWA extends StatefulWidget {
  const ListViewWA({Key? key}) : super(key: key);

  @override
  State<ListViewWA> createState() => _ListViewWAState();
}

class _ListViewWAState extends State<ListViewWA> {
  List<User> users = [
    const User(
        name: "Mama",
        text: "Halo Test",
        urlImage:
            "https://i.ibb.co/QMvq464/stefan-stefancik-QXev-Dflbl8-A-unsplash.jpg"),
    const User(
        name: "Papa",
        text: "Ini Papa Ko",
        urlImage:
            "https://i.ibb.co/YtsnWDf/vicky-hladynets-C8-Ta0gw-Pb-Qg-unsplash.jpg"),
    const User(
      name: "Putra",
      text: "p OSIS gimana banh",
      urlImage:
          "https://i.ibb.co/YZZVjg7/philip-martin-5a-GUy-CW-PJw-unsplash.jpg",
    ),
    const User(
      name: "Rangga",
      text: "Lojin cepat",
      urlImage:
          "https://i.ibb.co/xSPNGz5/jonas-kakaroto-mj-Rwhvq-EC0-U-unsplash.jpg",
    ),
    const User(
      name: "William",
      text: "Anak mangsud satu ini",
      urlImage:
          "https://i.ibb.co/N3v1CD3/ethan-hoover-0-YHIlxe-Cuhg-unsplash.jpg",
    ),
    const User(
      name: "Mavis",
      text: "Banh, donlod TOF banh",
      urlImage:
          "https://i.ibb.co/kmHXKRh/joseph-gonzalez-i-Fg-Rcq-Hznqg-unsplash.jpg",
    ),
    const User(
      name: "Nadhif",
      text: "Janji ga full senyum bang?",
      urlImage:
          "https://i.ibb.co/wWqs23Z/samsung-memory-k5e-Fm1f2es-Q-unsplash.jpg",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) => Card(
          child: ListTile(
            leading: CircleAvatar(
              radius: 28,
              backgroundImage: NetworkImage(
                users[index].urlImage,
              ),
            ),
            title: Text(users[index].name),
            subtitle: Text(users[index].text),
          ),
        ),
      ),
    );
  }
}

class User {
  final String name;
  final String text;
  final String urlImage;

  const User({required this.name, required this.text, required this.urlImage});
}
