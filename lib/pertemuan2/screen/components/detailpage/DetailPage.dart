import 'package:belajar_flutter/pertemuan2/screen/ListTeamPL.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';
import '../../TeamPLModel.dart';

// ignore: must_be_immutable
class DetailPage extends StatefulWidget {
  DetailPage({Key? key, required this.teams}) : super(key: key);
  Teams teams;


  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                alignment: Alignment.topCenter,
                child: Stack(children: <Widget>[
                  Container(
                    child: Image(
                      fit: BoxFit.fill,
                      width: double.infinity,
                      image: NetworkImage(
                        widget.teams.strTeamFanart2.toString(),

                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    height: 360,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      stops: [
                        0.1,
                        0.4,
                        0.6,
                        0.9,
                      ],
                      colors: [
                        HexColor(widget.teams.strKitColour1.toString()),
                        HexColor(widget.teams.strKitColour1.toString()),
                        HexColor(widget.teams.strKitColour1.toString()),
                        Colors.transparent,
                      ],
                    )),
                  ),
                  Container(
                    alignment: Alignment.topCenter,
                    child: Image(
                      height: 168,
                      width: 125,
                      image: NetworkImage(widget.teams.strTeamBadge.toString()),
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    height: 175,
                    child: Text(
                      widget.teams.strTeam.toString(),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    height: 195,
                    child: Text(
                      "Country : " + widget.teams.strCountry.toString(),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 200),
                    alignment: Alignment.bottomCenter,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.only(
                              top: 15, bottom: 15, left: 109, right: 110),
                          primary: Color(0xFFFEE000),
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(15.0),
                          ),
                          alignment: Alignment.center),
                      onPressed: () {
                        // Respond to button press
                      },
                      child: Text(
                        'See More Info',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 16),
                      ),
                    ),
                  ),
                  Container(
                    child: IconButton(
                      icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                      onPressed: ()
                      => Navigator.of(context).pop(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 270),
                    child: Container(
                      padding: EdgeInsets.only(top: 36, left: 15, right: 15),
                      alignment: Alignment.bottomCenter,
                      height: 500,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50),
                          )),
                      child: Column(
                        children: [
                          Text(
                            "The Official of " +
                                widget.teams.strTeam.toString(),
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Image.network(
                                widget.teams.strTeamJersey.toString(),
                                width: 160,
                                height: 160,
                              ),
                              Image.network(
                                widget.teams.strTeamLogo.toString(),
                                width: 199,
                                height: 77,
                              )
                            ],
                          ),
                          SizedBox(height: 35,),
                          Text(
                            "Team Social Media",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                                fontSize: 16),
                            textAlign: TextAlign.start,
                          ),
                          SizedBox(height: 50,),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 35),
                            child: Row(

                              children: [
                                InkWell(
                                  onTap: () async {
                                    await launchUrl(Uri.parse("https://" + widget.teams.strWebsite.toString()));
                                  },
                                  child: Container(
                                    child: Image.network("https://i.ibb.co/fk55ZTy/web.png", width: 36, height: 36,),
                                  ),
                                ),
                                Spacer(),
                                InkWell(
                                  onTap: () async {
                                    await launchUrl(Uri.parse("https://" + widget.teams.strInstagram.toString()));
                                  },
                                  child: Container(
                                    child: Image.network("https://i.ibb.co/61h5Wnb/instagram.png", width: 36, height: 36,),
                                  ),
                                ),

                                Spacer(),
                                InkWell(
                                  onTap: () async {
                                    await launchUrl(Uri.parse("https://" + widget.teams.strFacebook.toString()));
                                  },
                                  child: Container(
                                    child: Image.network("https://i.ibb.co/MgH7gRd/facebook.png", width: 36, height: 36,),
                                  ),
                                ),

                                Spacer(),
                                InkWell(
                                  onTap: () async {
                                    await launchUrl(Uri.parse("https://" + widget.teams.strTwitter.toString()));
                                  },
                                  child: Container(
                                    child: Image.network("https://i.ibb.co/WG1VwcZ/twitter.png", width: 36, height: 36,),
                                  ),
                                ),
                                Spacer(),
                                InkWell(
                                  onTap: () async {
                                    await launchUrl(Uri.parse("https://" + widget.teams.strYoutube.toString()));
                                  },
                                  child: Container(
                                    child: Image.network("https://i.ibb.co/XWrBh7r/youtube.png", width: 36, height: 36,),
                                  ),
                                ),

                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                      margin: const EdgeInsets.only(top: 720),
                      alignment: Alignment.bottomCenter,
                      child: Image.network(widget.teams.strTeamBanner.toString(),fit: BoxFit.fill)
                  )

                ]
                ),
              ),
            ],
          ),
        ));
  }
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
