import 'package:connectorapp/daily_related_services_card.dart/digital_studio_card.dart';
import 'package:connectorapp/daily_related_services_card.dart/painter_card.dart';
import 'package:connectorapp/daily_related_services_card.dart/parlour_card.dart';
import 'package:connectorapp/filterd_services/coaching_training_services.dart';
import 'package:connectorapp/filterd_services/daily_business_services.dart';
import 'package:connectorapp/filterd_services/language_related_services.dart';
import 'package:connectorapp/filterd_services/marriage_related_services.dart';
import 'package:connectorapp/filterd_services/repair_and_home_services.dart';
import 'package:connectorapp/filterd_services/technical_training_services.dart';
import 'package:connectorapp/filterd_services/travel_related_service.dart';
import 'package:connectorapp/language_related_cards/english_card.dart';
import 'package:connectorapp/language_related_cards/hindi_card.dart';
import 'package:connectorapp/language_related_cards/tamil_card.dart';
import 'package:connectorapp/marriage_related_cards/Balloon_decoration_card.dart';
import 'package:connectorapp/marriage_related_cards/Bridal_makeup_card.dart';
import 'package:connectorapp/marriage_related_cards/Dj_setup_card.dart';
import 'package:connectorapp/marriage_related_cards/Light_decoration_card.dart';
import 'package:connectorapp/marriage_related_cards/mahal_booking_card.dart';
import 'package:connectorapp/marriage_related_cards/marriage_show_more.dart';
import 'package:connectorapp/repair_and_home_services_cards/Ac_card.dart';
import 'package:connectorapp/repair_and_home_services_cards/Carpenters_card.dart';
import 'package:connectorapp/repair_and_home_services_cards/Cleaning_services_card.dart';
import 'package:connectorapp/repair_and_home_services_cards/Electrian_card.dart';
import 'package:connectorapp/repair_and_home_services_cards/Washing_machine_card.dart';
import 'package:connectorapp/repair_and_home_services_cards/repair_show_more.dart';
import 'package:connectorapp/technical_related_cards/app_card.dart';
import 'package:connectorapp/technical_related_cards/com_course_card.dart';
import 'package:connectorapp/technical_related_cards/full_stack_card.dart';
import 'package:connectorapp/technical_related_cards/typewriting_class_card.dart';
import 'package:connectorapp/technical_related_cards/website_card.dart';
import 'package:connectorapp/travel_related_cards/travel_barrel_file.dart';
import 'package:flutter/material.dart';

class UserServiceDisplay extends StatefulWidget {
  const UserServiceDisplay({super.key});

  @override
  State<UserServiceDisplay> createState() => _UserServiceDisplayState();
}

class _UserServiceDisplayState extends State<UserServiceDisplay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigoAccent,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          PopupMenuButton(
            color: Colors.black,
            iconColor: Colors.white,
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TravelRelatedService(),
                        ),
                      );
                    },
                    child: Text(
                      "Travel Related Services",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),

                PopupMenuItem(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DailyBusinessServices(),
                        ),
                      );
                    },
                    child: Text(
                      "Daily Business Services",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),

                PopupMenuItem(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CoachingTrainingServices(),
                        ),
                      );
                    },
                    child: Text(
                      "Coaching & Training",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                PopupMenuItem(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TechnicalTrainingServices(),
                        ),
                      );
                    },
                    child: Text(
                      "Technical Training",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),

                PopupMenuItem(
                  child: InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LanguageRelatedServices(),
                        ),
                      );
                    },
                    child: Text(
                      "Language Teaching",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                PopupMenuItem(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RepairAndHomeServices(),
                        ),
                      );
                    },
                    child: Text(
                      "Repair & Home Services",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                PopupMenuItem(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MarriageRelatedServices(),
                        ),
                      );
                    },
                    child: Text(
                      "Marriage Related Services",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ];
            },
          ),
        ],

        backgroundColor: Colors.black,
        title: Center(
          child: Text(
            'Select your Catogory',
            style: TextStyle(
              fontFamily: "Poppins",
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 10),
                    child: Text(
                      "Marriage Related Services :",
                      style: TextStyle(
                        fontSize: 17,
                        fontFamily: "Poppins",
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MarriageShowMore(),
                          ),
                        );
                      },
                      child: Text(
                        "Show more",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,

                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: BridalMakeupCard(),
                  ),
                  MahalBookingCard(),

                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: DjSetupCard(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: BalloonDecorationCard(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: LightDecorationCard(),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Divider(thickness: 0.9, color: Colors.black),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 10),
                    child: Text(
                      "Repair & Home Services :",
                      style: TextStyle(
                        fontSize: 17,
                        fontFamily: "Poppins",
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RepairShowMore(),
                          ),
                        );
                      },
                      child: Text(
                        "Show more",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: AcCard(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: WashingMachineCard(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: CarpentersCard(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: CleaningServicesCard(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: ElectrianCard(),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Divider(thickness: 0.9, color: Colors.black),
            ),

            SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 10),
                    child: Text(
                      "Travel Related Services :",
                      style: TextStyle(
                        fontSize: 17,
                        fontFamily: "Poppins",
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TravelRelatedService(),
                          ),
                        );
                      },
                      child: Text(
                        "Show more",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: TouristBusCard(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: VanRentalCard(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: AirportPickupCard(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: DrivingSchoolCard(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: TempoBookingCard(),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Divider(thickness: 0.9, color: Colors.black),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 10),
                    child: Text(
                      "Technical Related Training :",
                      style: TextStyle(
                        fontSize: 17,
                        fontFamily: "Poppins",
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.only(left: 1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: TypewritingClassCard(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: ComCourseCard(),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: WebsiteCard(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: AppCard(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: FullStackCard(),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Divider(thickness: 0.9, color: Colors.black),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 10),
                    child: Text(
                      "Daily Working Services",
                      style: TextStyle(
                        fontSize: 17,
                        fontFamily: "Poppins",
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: DigitalStudioCard(),
                ),
                ParlourCard(),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: PainterCard(),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 10),
                    child: Text(
                      "Language Related Teaching :",
                      style: TextStyle(
                        fontSize: 17,
                        fontFamily: "Poppins",
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  TamilCard(),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: EnglishCard(),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: HindiCard(),
                  ),
                ],
              ),
            ),

            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Divider(thickness: 0.9, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
