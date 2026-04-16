import 'package:connectorapp/Marriage%20Related%20Add%20Page/stage_setup.dart';
import 'package:flutter/material.dart';

class StageSetupCard extends StatefulWidget {
  const StageSetupCard({super.key});

  @override
  State<StageSetupCard> createState() => _StageSetupCardState();
}

class _StageSetupCardState extends State<StageSetupCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 7),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => StageSetup()),
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
                Icon(Icons.deck, size: 50),
                Center(child: Text('Stage Setup')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
