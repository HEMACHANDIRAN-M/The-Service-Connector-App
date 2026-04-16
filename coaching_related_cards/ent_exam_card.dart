import 'package:flutter/material.dart';

class EntExamCard extends StatefulWidget {
  const EntExamCard({super.key});

  @override
  State<EntExamCard> createState() => _EntExamCardState();
}

class _EntExamCardState extends State<EntExamCard> {
  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: (){
         Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => EntExamCard()),
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
                              Center(child: Text('Entra Exams')),
                            ],
                          ),
                        ),
                      ),
    );
  }
}