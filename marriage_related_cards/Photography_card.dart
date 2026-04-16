import 'package:connectorapp/Marriage%20Related%20Add%20Page/photography.dart';
import 'package:flutter/material.dart';

class PhotographyCard extends StatefulWidget {
  const PhotographyCard({super.key});

  @override
  State<PhotographyCard> createState() => _PhotographyCardState();
}

class _PhotographyCardState extends State<PhotographyCard> {
  @override
  Widget build(BuildContext context) {
    return 
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: InkWell(
                      onTap: () {
                         Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Photograpy()),
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
                              Icon(Icons.camera_alt, size: 50),
                              Center(child: Text('Photograpy')),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
}
}