import 'package:connectorapp/Marriage%20Related%20Add%20Page/welcome_drums.dart';
import 'package:flutter/material.dart';

class WelcomeDrumsCard extends StatefulWidget {
  const WelcomeDrumsCard({super.key});

  @override
  State<WelcomeDrumsCard> createState() => _WelcomeDrumsCardState();
}

class _WelcomeDrumsCardState extends State<WelcomeDrumsCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => WelcomeDrums()),
        );
      },
      child: Card(
        elevation: 10,

        child: Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            color: Color(0xFFECECFC),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.celebration, size: 50),
              Padding(
                padding: const EdgeInsets.only(left: 10, bottom: 5),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      'Welcome Drums',
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: "Poppins",
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
