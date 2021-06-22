

import 'package:get/get.dart';
import 'package:tinder_card/Model/favourite_model.dart';
import 'package:tinder_card/Service/database_service.dart';

import '../Model/UserDetailsModel.dart';

class FavouriteController extends GetxController  {

  DatabaseService databaseService= new DatabaseService();

  List<FavouriteModel> favouriteList = <FavouriteModel>[].obs;
  var a = 0.obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    //favouriteList.clear();
    fetchFavourite();
    super.onInit();
  }


  void fetchFavourite() async {
    try {
      isLoading(true);
      var list = await databaseService.getFavouriteList();
      if (list != null) {
        favouriteList.clear();
        favouriteList.addAll(list);// = list;
        print("the lebgth is"+favouriteList.length.toString());
      }
    } finally {
      isLoading(false);
    }
  }


}