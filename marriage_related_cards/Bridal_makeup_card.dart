import 'package:connectorapp/All_Marriage_Posts/only_bridal_posts.dart';
import 'package:flutter/material.dart';

class BridalMakeupCard extends StatefulWidget {
  const BridalMakeupCard({super.key});

  @override
  State<BridalMakeupCard> createState() => _BridalMakeupCardState();
}

class _BridalMakeupCardState extends State<BridalMakeupCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => OnlyBridalPosts()),
        );
      },
      child: Card(
        elevation: 10,

        child: Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Color(0xFFECECFC),
          ),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.face_2, size: 54),
              SizedBox(height: 5),
              Center(
                child: Text(
                  'Bridal Makeup',
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: "Poppins",
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
