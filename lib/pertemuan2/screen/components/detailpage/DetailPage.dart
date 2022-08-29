import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../../TeamPLModel.dart';

class DetailPage extends StatefulWidget {
  DetailPage({Key? key, required this.teams}) : super(key: key);
  Teams teams;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  Future<void> _launchInBrowser(String url) async {
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.teal,
        title: Text(widget.teams.strTeam.toString(),),
      ),
      body: Container(
        color: Colors.black45,
        padding: EdgeInsets.all(20),
        child: Column(
          children:<Widget> [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget> [
                Image.network(widget.teams.strTeamBadge.toString(),
                  height: 160,
                  width: 160,),
                Image.network(widget.teams.strTeamJersey.toString(),
                  height: 160,
                  width: 160,),
              ],
            ),

            Column(
              children: <Widget> [
                Image.network(widget.teams.strTeamLogo.toString()),
                SizedBox(height: 20,),
                Text(widget.teams.strCountry.toString(),style: TextStyle(
                    color: Colors.white,
                    fontSize: 18
                ),),
                SizedBox(height: 10,),
                Text(widget.teams.strStadium.toString(),style: TextStyle(
                    color: Colors.white,
                    fontSize: 18
                ),),
                InkWell(
                    onTap: () {
                      var myUrl =
                          "https://" + widget.teams.strYoutube.toString();
                      _launchInBrowser(myUrl);
                    },
                    child: Icon(Icons.play_arrow))
              ],
            )
          ],
        ),
      ),
    );
  }
}