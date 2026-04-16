import 'package:connectorapp/Marriage%20Related%20Add%20Page/catering.dart';
import 'package:flutter/material.dart';

class CateringCard extends StatefulWidget {
  const CateringCard({super.key});

  @override
  State<CateringCard> createState() => _CateringCardState();
}

class _CateringCardState extends State<CateringCard> {
  @override
  Widget build(BuildContext context) {
    return 
                  InkWell(
                      onTap: (){
         Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Catering()),
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
                            Icon(Icons.food_bank, size: 50),
                    
                            Center(child: Text('Catering')),
                          ],
                        ),
                      ),
                    ),
                  );
  }
}