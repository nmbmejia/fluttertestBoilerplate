import 'dart:convert';

import 'package:boilerplate/components/GameCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:boilerplate/services/networking.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';


class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var listOfDeals;
  bool isLoaded = false;

  void getListOfGames() async {
    var apiBodyObj = {};
    await NetworkHelper.getRequest("https://www.cheapshark.com/api/1.0/deals?storeID=1&upperPrice=15").then((response) {
      EasyLoading.dismiss();
      isLoaded = true;
      setState(() {
        listOfDeals = response;
      });

    });
  }

  @override
  Widget build(BuildContext context) {

    if(!isLoaded) {
      EasyLoading.show(status: 'Getting latest deals...');
      getListOfGames();
    }




    return Scaffold(
      appBar: AppBar(
        title: Text("Steam Deals"),
      ),
      backgroundColor: Color(0xFF24253C),
        body: Center(
          child: Visibility(
            visible: (listOfDeals != null) ? true : false,
            child: ListView.builder(
              itemCount: 20,
              itemBuilder: (context, i){
                return GameCard(data: listOfDeals[i]);
              },
            ),
          ),
        )

    );
  }
}
