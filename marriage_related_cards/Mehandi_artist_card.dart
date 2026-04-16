import 'package:connectorapp/Marriage%20Related%20Add%20Page/mehandi.dart';
import 'package:flutter/material.dart';

class MehandiArtistCard extends StatefulWidget {
  const MehandiArtistCard({super.key});

  @override
  State<MehandiArtistCard> createState() => _MehandiArtistCardState();
}

class _MehandiArtistCardState extends State<MehandiArtistCard> {
  @override
  Widget build(BuildContext context) {
    return           Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: InkWell(
                        onTap: () {
                           Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MehandiArtist()),
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
                                Icon(Icons.front_hand, size: 50),
                        
                                Center(child: Text('Mehandi Artist')),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
  }
}