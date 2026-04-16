import 'package:connectorapp/Service_Display_pages/service_display.dart';
import 'package:connectorapp/travel_related_cards/travel_barrel_file.dart';
import 'package:flutter/material.dart';

class TravelRelatedService extends StatefulWidget {
  const TravelRelatedService({super.key});

  @override
  State<TravelRelatedService> createState() => _TravelRelatedServiceState();
}

class _TravelRelatedServiceState extends State<TravelRelatedService> {
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
            "All Travel Catogories",
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
                    child: TouristBusCard(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: CarRentalCard(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: VanRentalCard(),
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
                    child: TempoBookingCard(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: AirportPickupCard(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: OutstationCabCard(),
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
                    child: DrivingSchoolCard(),
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
