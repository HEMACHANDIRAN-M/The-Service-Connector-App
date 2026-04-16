import 'package:flutter/material.dart';

class PainterCard extends StatefulWidget {
  const PainterCard({super.key});

  @override
  State<PainterCard> createState() => _PainterCardState();
}

class _PainterCardState extends State<PainterCard> {
  @override
  Widget build(BuildContext context) {
    return   Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: InkWell(
                        onTap: (){
                           Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => PainterCard()),
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
                                Icon(Icons.brush_rounded, size: 50),
                        
                                Center(child: Text('Painter')),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
  }
}