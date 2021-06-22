import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swipe_cards/swipe_cards.dart';
import 'package:tinder_card/Constants/color.dart';
import 'package:tinder_card/Controlller/landing_controller.dart';
import 'package:tinder_card/Screens/favourite.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  LandingCntroller getLandingCon = Get.put(LandingCntroller());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(
            title: Text("NOnStop Io",style: TextStyle(
              color: NColour.green,
            ),),
            backgroundColor: Colors.white,
          ),
          body: getLandingCon.isLoading.value
              ? Center(child: CircularProgressIndicator())
              : Container(
                  child: Column(children: [
                  Container(
                    height: 550,
                    child: SwipeCards(
                      matchEngine: getLandingCon.matchEngine,
                      itemBuilder: (BuildContext context, int index) {
                        if (!getLandingCon.pressed.value)
                          getLandingCon.str.value = ("Name : " +
                              getLandingCon.swipeItems[index].content.name
                                  .toString());
                        return Container(
                          height: 400,
                          width: 400,
                          // color: Colors.white,
                          child: Card(
                            child: Stack(
                              children: [
                                Container(
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 115,
                                        width: 400,
                                        color: Colors.grey,
                                      ),
                                      Container(
                                        height: 250,
                                        width: 400,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                ),
                                Column(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(top: 7),
                                      child: CircleAvatar(
                                        radius: 88,
                                        backgroundColor: Colors.white,
                                        child: ClipOval(
                                          child: Image.network(
                                            getLandingCon.swipeItems[index]
                                                .content.picture,
                                            height: 170,
                                            width: 170,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 75),
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 60,
                                            child: Center(
                                                child: Text(getLandingCon.str
                                                    .toString())),
                                          ),
                                          Container(
                                            width: 400,
                                            height: 50,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      print("pressed");
                                                      getLandingCon.str.value =
                                                          ("Name : " +
                                                              getLandingCon
                                                                  .swipeItems[
                                                                      index]
                                                                  .content
                                                                  .name
                                                                  .toString());
                                                      getLandingCon
                                                          .pressed(true);
                                                      //pressed = true;
                                                    });
                                                  },
                                                  child: Container(
                                                    width: 50,
                                                    height: 50,
                                                    child: Center(
                                                        child:
                                                            Icon(Icons.person)),
                                                  ),
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      getLandingCon.str.value =
                                                          ("DOB : " +
                                                              getLandingCon
                                                                  .swipeItems[
                                                                      index]
                                                                  .content
                                                                  .dob
                                                                  .toString());
                                                      getLandingCon
                                                          .pressed(true);
                                                      //pressed = true;
                                                    });
                                                  },
                                                  child: Container(
                                                    width: 50,
                                                    height: 50,
                                                    child: Center(
                                                        child: Icon(Icons
                                                            .calendar_today_sharp)),
                                                  ),
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      print("location pressed");
                                                      getLandingCon.str.value =
                                                          ("Location : " +
                                                              getLandingCon
                                                                  .swipeItems[
                                                                      index]
                                                                  .content
                                                                  .location
                                                                  .toString());
                                                      getLandingCon
                                                          .pressed(true);
                                                      //pressed = true;
                                                    });
                                                  },
                                                  child: Container(
                                                    width: 50,
                                                    height: 50,
                                                    child: Center(
                                                        child: Icon(
                                                            Icons.location_on)),
                                                  ),
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      getLandingCon.str.value =
                                                          ("Cell No. : " +
                                                              getLandingCon
                                                                  .swipeItems[
                                                                      index]
                                                                  .content
                                                                  .cell
                                                                  .toString());
                                                      getLandingCon
                                                          .pressed(true);
                                                      //pressed = true;
                                                    });
                                                  },
                                                  child: Container(
                                                    width: 50,
                                                    height: 50,
                                                    child: Center(
                                                        child:
                                                            Icon(Icons.phone)),
                                                  ),
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      getLandingCon.str.value =
                                                          ("Email : " +
                                                              getLandingCon
                                                                  .swipeItems[
                                                                      index]
                                                                  .content
                                                                  .email
                                                                  .toString());
                                                      getLandingCon
                                                          .pressed(true);
                                                      //pressed = true;
                                                    });
                                                  },
                                                  child: Container(
                                                    width: 50,
                                                    height: 50,
                                                    child: Center(
                                                        child:
                                                            Icon(Icons.lock)),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      onStackFinished: () async {
                        //await addData();
                        getLandingCon.addData();
                        _scaffoldKey.currentState.showSnackBar(SnackBar(
                          content: Text("Stack Finished"),
                          duration: Duration(milliseconds: 500),
                        ));
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [

                      RaisedButton(
                          onPressed: () {

                            getLandingCon.goToFavouriteScreen(context);
                          },
                          color: Colors.white,
                          child: Icon(Icons.bookmark, color: NColour.green,)),

                    ],
                  )
                ])));
    });
  }
}
