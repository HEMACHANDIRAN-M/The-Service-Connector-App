import 'package:connectorapp/Marriage%20Related%20Add%20Page/chairs.dart';
import 'package:flutter/material.dart';

class ChairsCard extends StatefulWidget {
  const ChairsCard({super.key});

  @override
  State<ChairsCard> createState() => _ChairsCardState();
}

class _ChairsCardState extends State<ChairsCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: (){
         Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Chairs()),
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
              Icon(Icons.chair, size: 50),
      
              Center(child: Text('Chairs')),
            ],
          ),
        ),
      ),
    );
  }
}
