import 'package:flutter/material.dart';

class SpecialClassCard extends StatefulWidget {
  const SpecialClassCard({super.key});

  @override
  State<SpecialClassCard> createState() => _SpecialClassCardState();
}

class _SpecialClassCardState extends State<SpecialClassCard> {
  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: (){
         Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => SpecialClassCard()),
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
                            Icon(Icons.speaker_outlined, size: 50),
      
                            Center(child: Text('Spe-classes')),
                          ],
                        ),
                      ),
                    ),
    );
  }
}