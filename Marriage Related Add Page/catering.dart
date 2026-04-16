import 'package:connectorapp/marriage_related_forms/catering_form.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Catering extends StatefulWidget {
  const Catering({super.key});

  @override
  State<Catering> createState() => _CateringState();
}

class _CateringState extends State<Catering> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        child: Icon(Icons.add, size: 20, color: Colors.white),
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => CateringForm()),
          );
        },
      ),
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent,
        toolbarHeight: 110,

        title: Text("Catering Form"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 1),
              child: LottieBuilder.asset(
                "assets/animations/Man serving catering food.json",
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Center(
                child: Card(
                  elevation: 50,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    'Just clicking the below  "+"  Add Button You can Post Your Service, By the way of Filling the Form with Your  Original Details ',
                    style: TextStyle(
                      shadows: [
                        Shadow(color: Colors.indigoAccent, blurRadius: 40),
                      ],
                      fontWeight: FontWeight.bold,
                      color: Colors.indigoAccent,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
