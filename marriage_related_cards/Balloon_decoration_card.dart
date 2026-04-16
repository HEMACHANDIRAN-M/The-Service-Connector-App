import 'package:connectorapp/Marriage%20Related%20Add%20Page/bridal_makeup.dart';
import 'package:flutter/material.dart';

class BalloonDecorationCard extends StatefulWidget {
  const BalloonDecorationCard({super.key});

  @override
  State<BalloonDecorationCard> createState() => _BalloonDecorationCardState();
}

class _BalloonDecorationCardState extends State<BalloonDecorationCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BridalMakeup()),
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
              Icon(Icons.circle_rounded, size: 60),

              Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 5, bottom: 1),
                  child: Text(
                    'Balloon Deco',
                    style: TextStyle(
                      fontSize: 12.5,
                      fontFamily: "Poppins",
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
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
