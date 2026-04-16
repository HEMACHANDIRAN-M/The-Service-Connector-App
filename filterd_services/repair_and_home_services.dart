import 'package:connectorapp/Service_Display_pages/service_display.dart';
import 'package:connectorapp/repair_and_home_related_add_page/tv_repair.dart';
import 'package:connectorapp/repair_and_home_services_cards/repair_barrel_file.dart';
import 'package:flutter/material.dart';

class RepairAndHomeServices extends StatefulWidget {
  const RepairAndHomeServices({super.key});

  @override
  State<RepairAndHomeServices> createState() => _RepairAndHomeServicesState();
}

class _RepairAndHomeServicesState extends State<RepairAndHomeServices> {
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
            "All Repair Catogories",
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
                    child: TvRepair(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: WashingMachineCard(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: FridgeCard(),
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
                    child: AcCard(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: CleaningServicesCard(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: ElectrianCard(),
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
                    child: PlumberCard(),
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