import 'package:connectorapp/marriage_related_forms/welcome_drums_form.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class WelcomeDrums extends StatefulWidget {
  const WelcomeDrums({super.key});

  @override
  State<WelcomeDrums> createState() => _WelcomeDrumsState();
}

class _WelcomeDrumsState extends State<WelcomeDrums> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        child: Icon(Icons.add, size: 20, color: Colors.white),
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => WelcomeDrumsForm()),
          );
        },
      ),
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent,
        toolbarHeight: 110,

        title: Text("Welcome Drums Form"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: LottieBuilder.asset("assets/animations/drum roll.json"),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 110),
              child: Center(
                child: Card(
                  elevation: 50,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    'Just clicking the below  "+"  Add Button You can Post Your Welcome Drums Service, By the way of Filling the Form with Your  Original Details ',
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
