import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swipe_cards/swipe_cards.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:tinder_card/Model/UserDetailsModel.dart';
import 'package:tinder_card/Model/content_model.dart';
import 'package:tinder_card/Model/favourite_model.dart';
import 'package:tinder_card/Service/database_service.dart';

class LandingCntroller extends GetxController{

  List<SwipeItem> swipeItems = <SwipeItem>[].obs;
  var matchEngine;
  UserDetailsModel a = UserDetailsModel();
  DatabaseService dbService = new DatabaseService();
  var str = ''.obs;

  var pressed = true.obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    matchEngine = MatchEngine(swipeItems: swipeItems);
    getData();
    super.onInit();
  }

  getData() async {
    for (int i = 0; i < 3; i++) {
      var uri = Uri.parse("https://randomuser.me/api/0.4/?randomapi");

      var response = await http.get(uri);
      print(response.body.toString());
      if (response.statusCode == 200) {
        var jsonResponse =
        convert.jsonDecode(response.body) as Map<String, dynamic>;
        var itemCount = jsonResponse['user'];
        a = UserDetailsModel.fromJson(jsonResponse);

        print(a.results[0].user.name.first.toString());
        print('Number of books about http: $i.');
      } else {
        print('Request failed with status: $i.');
      }
      swipeItems.add(SwipeItem(
          content: Content(
              a.results[0].user.name.title,
              ( a.results[0].user.name.first +"  "+ a.results[0].user.name.last) ,
              (a.results[0].user.location.street+","+
                  a.results[0].user.location.city+","+
                  a.results[0].user.location.state+","+
                  a.results[0].user.location.zip+"."),
              a.results[0].user.email,
              a.results[0].user.registered,
              a.results[0].user.dob,
              a.results[0].user.cell,
              a.results[0].user.picture),
          likeAction: () async {
            _save(matchEngine.currentItem.content.title,(matchEngine.currentItem.content.name ),matchEngine.currentItem.content.location,matchEngine.currentItem.content.cell,matchEngine.currentItem.content.dob);
            pressed(false);
            await addData();
          },
          nopeAction: () async {
            pressed(false);
            await addData();
          },
          superlikeAction: () async {
            pressed(false);

            await addData();
          }));
    }

    isLoading(false);

  }

  addData() async {
    var uri = Uri.parse("https://randomuser.me/api/0.4/?randomapi");

    var response = await http.get(uri);
    print(response.body.toString());
    if (response.statusCode == 200) {
      var jsonResponse =
      convert.jsonDecode(response.body) as Map<String, dynamic>;

      a = UserDetailsModel.fromJson(jsonResponse);
    }

    swipeItems.add(SwipeItem(
        content: Content(
            a.results[0].user.name.title,
            ( a.results[0].user.name.first +"  "+ a.results[0].user.name.last) ,
            a.results[0].user.location.street+","+
                a.results[0].user.location.city+","+
                a.results[0].user.location.state+","+
                a.results[0].user.location.zip+".",
            a.results[0].user.email,
            a.results[0].user.registered,
            a.results[0].user.dob,
            a.results[0].user.cell,
            a.results[0].user.picture),
        likeAction: () async {
          _save(matchEngine.currentItem.content.title,(matchEngine.currentItem.content.name ),matchEngine.currentItem.content.location,matchEngine.currentItem.content.cell,matchEngine.currentItem.content.dob);

          pressed(false);

          await addData();
        },
        nopeAction: () async {
          pressed(false);
          await addData();
        },
        superlikeAction: () async {
          pressed(false);
          await addData();
        }));


  }

  void _save( String gender,String name,String location,String registred,String dob) async {
    FavouriteModel note= FavouriteModel(gender,name,location,registred,dob,0);
    int result;
    result = await dbService.insertFavourite(note);
    if (result != 0) {
      print("USER IS CREATED");
    } else {

    }

  }

  goToFavouriteScreen(BuildContext context){

    Navigator.pushNamed(
      context,
      '/favouriteScreen',
    );

  }

}