import 'package:flutter/material.dart';

class GovExamCard extends StatefulWidget {
  const GovExamCard({super.key});

  @override
  State<GovExamCard> createState() => _GovExamCardState();
}

class _GovExamCardState extends State<GovExamCard> {
  @override
  Widget build(BuildContext context) {
    return           InkWell(
      onTap: (){
         Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => GovExamCard()),
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
                              Icon(Icons.drive_eta, size: 50),
                              Center(child: Text('Gov Exams')),
                            ],
                          ),
                        ),
                      ),
    );
  }
}