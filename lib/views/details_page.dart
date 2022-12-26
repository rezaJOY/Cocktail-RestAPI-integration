import 'package:flutter/material.dart';


class DetailsPage extends StatelessWidget {
  const DetailsPage(
      {
        Key? key,
        required this.title,
        // required this.description,
        required this.image})
      : super(key: key);
 final String image;
 final String title;
 // final String description;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      body: SingleChildScrollView(
        child:  Column(
          children: [
            const SizedBox(height: 20*2,), // 20*2 means 40
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 45,
                      width: 55,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(8),
                        ),
                      ),
                      child: Icon(Icons.arrow_back, color: Colors.deepPurple,),


                    ),

                  )
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Center(
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10),
                ),
                child: Image.network(image,height: 250,
                fit: BoxFit.cover),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(title, style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
              color: Colors.white
            ),),
            const SizedBox(height: 10,),
            Text(title, style: TextStyle(
              color: Colors.white60,
              fontSize: 16,
            ),),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book" ,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
                textAlign: TextAlign.justify,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 45,
              width: MediaQuery.of(context).size.width / 1.1,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10),)
              ),
              child: Center(
                child: Text(
                  "Add to cart",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
