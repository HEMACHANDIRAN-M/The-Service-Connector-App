import 'package:connectorapp/Service_Display_pages/service_display.dart';
import 'package:connectorapp/language_related_cards/english_card.dart';
import 'package:connectorapp/language_related_cards/hindi_card.dart';
import 'package:connectorapp/language_related_cards/tamil_card.dart';
import 'package:flutter/material.dart';

class LanguageRelatedServices extends StatefulWidget {
  const LanguageRelatedServices({super.key});

  @override
  State<LanguageRelatedServices> createState() =>
      _LanguageRelatedServicesState();
}

class _LanguageRelatedServicesState extends State<LanguageRelatedServices> {
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
            "All Language Catogories",
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
                    child: TamilCard(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: EnglishCard(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: HindiCard(),
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
