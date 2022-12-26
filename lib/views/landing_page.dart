import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:rest_api_integration/views/homepage.dart';

class LandingPage extends StatelessWidget {

  const LandingPage({Key? key}) : super(key: key);


  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Image(image: AssetImage('images/landingimg.png'),
            ),
          ),
          SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 300,
              width: 350,
              decoration: BoxDecoration(
                color: Colors.white10,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Column(
                  children: [
                    Text(
                      'Make your summer more cool with Cocktail App', style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                      fontSize: 35,

                    ),
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(height: 30,),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Container(
                        height: 50,
                        width: 200,
                        decoration: BoxDecoration(
                            color: Colors.deepPurple,
                            borderRadius: BorderRadius.all(Radius.circular(20),)
                        ),
                        child: Center(
                          child: GestureDetector(
                            onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));},
                            child: Text(
                              "Get Started",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),

                      ),
                    ),
                  ],
                ),
              ),

            ),
          )
        ],
      ),

    );
  }
}
