import 'package:flutter/material.dart';

class ArrearPaperCard extends StatefulWidget {
  const ArrearPaperCard({super.key});

  @override
  State<ArrearPaperCard> createState() => _ArrearPaperCardState();
}

class _ArrearPaperCardState extends State<ArrearPaperCard> {
  @override
  Widget build(BuildContext context) {
    return  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: InkWell(
                      onTap: (){
                         Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => ArrearPaperCard()),
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
                              Center(child: Text('Arrer Paper')),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
  }
}