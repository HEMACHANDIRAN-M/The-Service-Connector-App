import 'package:connectorapp/Marriage%20Related%20Add%20Page/dj_setup.dart';
import 'package:flutter/material.dart';

class DjSetupCard extends StatefulWidget {
  const DjSetupCard({super.key});

  @override
  State<DjSetupCard> createState() => _DjSetupCardState();
}

class _DjSetupCardState extends State<DjSetupCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DjSetup()),
        );
      },
      child: Card(
        elevation: 10,

        child: Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Color(0xFFECECFC),
          ),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.speaker_outlined, size: 55),
              SizedBox(height: 5),
              Center(
                child: Text(
                  'Dj Setup',
                  style: TextStyle(
                    fontFamily: "Poppins",
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
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
