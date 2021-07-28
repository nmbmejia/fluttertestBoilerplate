import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:url_launcher/url_launcher.dart';

class GameCard extends StatefulWidget {
  var data;
  GameCard({Key key, @required this.data=""}) : super(key: key);
  _GameCardState createState() => _GameCardState();
}

class _GameCardState extends State<GameCard> {


  launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url, forceWebView: true);
    } else {
      throw 'Could not launch $url';
    }
  }


  @override
  Widget build(BuildContext context) {
    print("TEST");
    print(widget.data.toString());

    return Card(
      clipBehavior: Clip.antiAlias,
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Hero(
              tag: widget.data['gameID'] ?? "test",
              child: SizedBox(
                width: 150,
                height: 100,
                child: ClipRect(
                  child: Image.network(widget.data['thumb'], fit: BoxFit.fill,),
                ),
              ),
            ),
            Expanded(
              child:  Column(
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                    title: Text(widget.data['title'] ?? "test"),
                    subtitle: Text.rich(
                      TextSpan(
                        text: '',
                        children: <TextSpan>[
                          new TextSpan(
                            text: "\$" + widget.data['normalPrice'],
                            style: new TextStyle(
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                          new TextSpan(
                            text: ' \$' + widget.data['salePrice'],
                          ),
                        ],
                      ),
                    ),
                  ),
                  ElevatedButton(
                    child: Text("Check deal on Steam"),
                    onPressed: () {
                      launchURL("http://store.steampowered.com/app/"+widget.data['steamAppID']);
                      },
                    style: ElevatedButton.styleFrom(
                        shape: StadiumBorder(),
                        primary: Colors.blueAccent  ,
                        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 7),
                        textStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.normal)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}