import 'package:connectorapp/marriage_related_forms/balloon_decoration_form.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class BalloonDecoration extends StatefulWidget {
  const BalloonDecoration({super.key});

  @override
  State<BalloonDecoration> createState() => _EventManagementState();
}

class _EventManagementState extends State<BalloonDecoration> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        child: Icon(Icons.add, size: 20, color: Colors.white),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => BalloonDecorationForm()),
          );
        },
      ),
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent,
        toolbarHeight: 110,
       
        title: Text(
          "Balloon Decoration Form",
          style: TextStyle(
            color: Colors.white70,
            fontFamily: "Poppins",
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 1),
              child: LottieBuilder.network(
                "https://lottie.host/0963cc70-b7b3-477d-a9f2-dc2c4a03534d/sTiiM5R0dv.json",
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 0),
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
