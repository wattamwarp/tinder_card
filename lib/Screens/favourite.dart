import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tinder_card/Controlller/favourite_controller.dart';
import '../Model/favourite_model.dart';
import '../Service/database_service.dart';

class Favourite extends StatefulWidget  {
  @override
  _FavouriteState createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {

  FavouriteController getfavouriteCon = Get.put(FavouriteController());

  @override
  void initState(){
    getfavouriteCon.favouriteList.clear();
    getfavouriteCon.fetchFavourite();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _height= MediaQuery.of(context).size.height;
    var _width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: _height,
          width: _width,
          child:Column(
            children: [
              Container(
                width: _width,
                height: 40,
                child: Center(child: Text("Favourite People List"),),
              ),
              Container(
                height: _height - 70,
                child: favouriteList(_width, _height),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget favouriteList(var _width, var _height){
    return  Obx(() {
      print("the fronedn is"+getfavouriteCon.favouriteList.length.toString());
      return getfavouriteCon.isLoading.value ? Center(child: CircularProgressIndicator()):

        ListView.builder(
        itemCount:getfavouriteCon.favouriteList.length,// favouriteList.length,
        itemBuilder: (context, i) {
          return Card(
            child: Container(
              height: 50,
              width: _width,
              child: Column(
                children: [
                  Text(getfavouriteCon.favouriteList[i].title.toString() +" "+getfavouriteCon.favouriteList[i].name.toString()),
                  Text(getfavouriteCon.favouriteList[i].registered.toString()),
                  Text(getfavouriteCon.favouriteList[i].location.toString())
                ],
              ),
            ),
          );
        },
      );
    });
  }
}
