import 'dart:convert';

import 'package:get/state_manager.dart';
import 'package:http/http.dart' as http;
import 'package:rest_api_integration/models/cocktail_model.dart';

//https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=cocktail

class CocktailController extends GetxController{
  // variables
  List<CocktailModel> cocktails = [];
  var isLoading = false.obs;

  Future<List<CocktailModel>> getCocktails() async{
    isLoading.value = true;
    var response = await http.get(Uri.parse("https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=cocktail"));
    isLoading.value = false;
    var json = jsonDecode(response.body);
    cocktails.add(CocktailModel.fromJson(json));
    update();
    return cocktails;


  }//need model file for our data management

@override
  void onInit() {
    //initialize our data
   getCocktails();
    super.onInit();
  }

}

