import 'package:flutter/material.dart';

class ParlourCard extends StatefulWidget {
  const ParlourCard({super.key});

  @override
  State<ParlourCard> createState() => _ParlourCardState();
}

class _ParlourCardState extends State<ParlourCard> {
  @override
  Widget build(BuildContext context) {
    return  Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: InkWell(
                        onTap: (){
                           Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => ParlourCard()),
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
                                Icon(Icons.face_2, size: 60),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 10,
                                    bottom: 1,
                                  ),
                                  child: Center(child: Text('Parlour')),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );

  }
}