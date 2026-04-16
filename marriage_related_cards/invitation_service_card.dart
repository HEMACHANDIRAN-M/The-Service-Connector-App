import 'package:connectorapp/Marriage%20Related%20Add%20Page/invitation.dart';
import 'package:flutter/material.dart';

class InvitationServiceCard extends StatefulWidget {
  const InvitationServiceCard({super.key});

  @override
  State<InvitationServiceCard> createState() => _InvitationServiceCardState();
}

class _InvitationServiceCardState extends State<InvitationServiceCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Invitation()),
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
              Icon(Icons.insert_invitation, size: 54),
              SizedBox(height: 5),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 7),
                  child: Text(
                    'Invitation',
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: "Poppins",
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
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
