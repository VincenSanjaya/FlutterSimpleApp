import 'package:belajar_flutter/pertemuan2/screen/TeamPLModel.dart';
import 'package:belajar_flutter/pertemuan2/screen/components/detailpage/DetailPage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ListTeamPL extends StatefulWidget {
  const ListTeamPL({Key? key}) : super(key: key);

  @override
  State<ListTeamPL> createState() => _ListTeamPLState();
}

class _ListTeamPLState extends State<ListTeamPL> {

  TeamPLModel? teamPLModel;
  bool isloaded = true;

  @override
  void initState() {
    super.initState();
    getAllListPL();
  }

  void getAllListPL() async {
    setState(() {
      isloaded = false;
    });

    final res = await http.get(
      Uri.parse(
          "https://www.thesportsdb.com/api/v1/json/2/search_all_teams.php?l=English%20Premier%20League"),
    );
    print("Status code " + res.statusCode.toString());

    teamPLModel = TeamPLModel.fromJson((json.decode(res.body.toString())));
    print("team 0 : " + teamPLModel!.teams![0].strTeam.toString());

    setState(() {
      isloaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Container(
          child: isloaded
              ? ListView.builder(
                  itemCount: teamPLModel!.teams!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(teams: teamPLModel!.teams![index])),);
                      },

                        child: Card(
                          color: Color.fromRGBO(63, 16, 82, 1),
                          child: Container(

                            margin: EdgeInsets.only(left: 7, top: 5, bottom: 5, right: 10),
                            child: Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right: 20),
                                  width: 30,
                                  height: 40,
                              child: FadeInImage.assetNetwork(
                                  placeholder: 'Assets/premier_logo_small.png', height: 50, width: 40,
                                  image:teamPLModel!.teams![index].strTeamLogo.toString(),),
                              ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [

                                    Text(teamPLModel!.teams![index].strTeam.toString(), style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 11
                                    ),),
                                    SizedBox(height: 5,),
                                    Text(teamPLModel!.teams![index].strCountry.toString() + " - " + teamPLModel!.teams![index].intFormedYear.toString(),style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10))
                                  ],
                                ),
                                Spacer(),
                                IconButton(
                                  icon: Icon(
                                    Icons.keyboard_double_arrow_right_rounded,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(teams: teamPLModel!.teams![index])),);
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                    );
                  })
              : CircularProgressIndicator(),
        ),
      ),
    );
  }
}

