import 'package:flutter/material.dart';

class DigitalStudioCard extends StatefulWidget {
  const DigitalStudioCard({super.key});

  @override
  State<DigitalStudioCard> createState() => _DigitalStudioCardState();
}

class _DigitalStudioCardState extends State<DigitalStudioCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
         Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => DigitalStudioCard()),
                );
      },
      child: Card(elevation: 10,
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
                              Icon(Icons.camera, size: 50),
                              Center(child: Text('Digital Studio')),
                            ],
                          ),
                        ),
                      ),
    );
  }
}