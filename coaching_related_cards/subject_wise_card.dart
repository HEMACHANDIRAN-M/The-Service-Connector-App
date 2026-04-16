import 'package:flutter/material.dart';

class SubjectWiseCard extends StatefulWidget {
  const SubjectWiseCard({super.key});

  @override
  State<SubjectWiseCard> createState() => _SubjectWiseCardState();
}

class _SubjectWiseCardState extends State<SubjectWiseCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
                   padding: const EdgeInsets.only(left: 10),
                    child: InkWell(
                      onTap: (){
                         Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => SubjectWiseCard()),
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
                              Icon(Icons.mode_of_travel, size: 50),
                      
                              Center(child: Text('Subject Wise')),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
  }
}