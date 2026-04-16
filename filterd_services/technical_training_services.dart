import 'package:connectorapp/Service_Display_pages/service_display.dart';
import 'package:connectorapp/technical_related_cards/technical_barrel_file.dart';
import 'package:flutter/material.dart';

class TechnicalTrainingServices extends StatefulWidget {
  const TechnicalTrainingServices({super.key});

  @override
  State<TechnicalTrainingServices> createState() =>
      _TechnicalTrainingServicesState();
}

class _TechnicalTrainingServicesState extends State<TechnicalTrainingServices> {
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
            "All Training Catogories",
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
                    child: TypewritingClassCard(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: WebsiteCard(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: AppCard(),
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
                    child: ComCourseCard(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: FullStackCard(),
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
