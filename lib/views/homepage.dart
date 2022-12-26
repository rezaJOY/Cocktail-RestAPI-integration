import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:rest_api_integration/controllers/cocktail_controller.dart';
import 'package:rest_api_integration/models/cocktail_model.dart';
import 'package:rest_api_integration/views/details_page.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 60.0),
          child: const Text(
            'Cocktail App'),
        ),
        backgroundColor: Colors.deepPurple,
        elevation: 0,
      ),
      body: GetBuilder<CocktailController>(
        init: CocktailController(),
        builder: (controller){
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              FutureBuilder<List<CocktailModel>>(
                  future: controller.getCocktails(),
                  builder: (context, snapshot){
                    if (!snapshot.hasData)
                      {
                        //error = circular indicator
                      return const Center(
                        child: CircularProgressIndicator(
                        color: Colors.deepPurple,
                        ),
                        );

                      }
                    else {
                      return Expanded(child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: controller.cocktails.length,
                      itemBuilder: (context, index) {
                        final cocktail = snapshot.data![index].drinks[index];
                       return InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailsPage(
                            title: cocktail.strDrink,
                            image: cocktail.strDrinkThumb,
                          )));
                        },
                          child: Card(
                            elevation: 2,
                            color: Colors.deepPurple,
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                                  child: Image.network(cocktail.strDrinkThumb, height: 110,),

                                ),
                                const SizedBox(width: 10,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Id: ${cocktail.idDrink}", style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                    ),
                                    const SizedBox(height: 10,),
                                    Text(
                                      cocktail.strDrink,
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.white54,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        );


          }

          ),
          );
          }

          },
              )

            ],
          );

        },
      ),
    );
  }
}
