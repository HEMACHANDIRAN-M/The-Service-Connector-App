import 'package:connectorapp/Service_Display_pages/service_display.dart';
import 'package:connectorapp/coaching_related_cards/coaching_barrel_file.dart';
import 'package:flutter/material.dart';

class CoachingTrainingServices extends StatefulWidget {
  const CoachingTrainingServices({super.key});

  @override
  State<CoachingTrainingServices> createState() =>
      _CoachingTrainingServicesState();
}

class _CoachingTrainingServicesState extends State<CoachingTrainingServices> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => ServiceDisplay()),
            );
          },
          icon: Icon(Icons.exit_to_app, color: Colors.white),
        ),
        backgroundColor: Colors.black,
        title: Padding(
          padding: const EdgeInsets.only(left: 60),
          child: Text(
            "All Coaching Catogories",
            style: TextStyle(
              fontFamily: "Poppins",
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: ArrearPaperCard(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: EntExamCard(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: SkillBasedCard(),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: GovExamCard(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: SubjectWiseCard(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: SpecialClassCard(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
