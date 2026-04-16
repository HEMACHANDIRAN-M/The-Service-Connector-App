import 'package:flutter/material.dart';

class SkillBasedCard extends StatefulWidget {
  const SkillBasedCard({super.key});

  @override
  State<SkillBasedCard> createState() => _SkillBasedCardState();
}

class _SkillBasedCardState extends State<SkillBasedCard> {
  @override
  Widget build(BuildContext context) {
    return  Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: InkWell(
                        onTap: (){
                           Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => SkillBasedCard()),
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
                                Icon(Icons.train, size: 50),
                        
                                Center(child: Text('Skill')),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
  }
}