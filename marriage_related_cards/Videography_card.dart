import 'package:connectorapp/Marriage%20Related%20Add%20Page/videography.dart';
import 'package:flutter/material.dart';

class VideographyCard extends StatefulWidget {
  const VideographyCard({super.key});

  @override
  State<VideographyCard> createState() => _VideographyCardState();
}

class _VideographyCardState extends State<VideographyCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
         Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Videography()),
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
              Icon(Icons.video_call, size: 50),
              Padding(
                padding: const EdgeInsets.only(left: 10, bottom: 5),
                child: Center(child: Text('Videography')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
