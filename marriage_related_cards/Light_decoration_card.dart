import 'package:connectorapp/Marriage%20Related%20Add%20Page/light_decoration.dart';
import 'package:flutter/material.dart';

class LightDecorationCard extends StatefulWidget {
  const LightDecorationCard({super.key});

  @override
  State<LightDecorationCard> createState() => _LightDecorationCardState();
}

class _LightDecorationCardState extends State<LightDecorationCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LightDecoration()),
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
              Icon(Icons.light, size: 60),
              Padding(
                padding: const EdgeInsets.only(left: 2, bottom: 5),
                child: Center(
                  child: Text(
                    'Light Deco',
                    style: TextStyle(
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
