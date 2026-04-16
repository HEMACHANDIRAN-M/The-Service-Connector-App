import 'package:connectorapp/Service_Display_pages/service_display.dart';
import 'package:connectorapp/marriage_related_cards/invitation_service_card.dart';
import 'package:connectorapp/marriage_related_cards/marriage_barrel_file.dart';
import 'package:flutter/material.dart';

class MarriageRelatedServices extends StatefulWidget {
  const MarriageRelatedServices({super.key});

  @override
  State<MarriageRelatedServices> createState() =>
      _MarriageRelatedServicesState();
}

class _MarriageRelatedServicesState extends State<MarriageRelatedServices> {
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
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            "All Marriage Catogories",
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
                    child: BridalMakeupCard(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: MahalBookingCard(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: CateringCard(),
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
                    child: ChairsCard(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: DjSetupCard(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: LightDecorationCard(),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  MehandiArtistCard(),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: PhotographyCard(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: StageSetupCard(),
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
                    child: VideographyCard(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: WelcomeDrumsCard(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: InvitationServiceCard(),
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
