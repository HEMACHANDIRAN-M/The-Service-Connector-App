import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectorapp/success_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class BalloonDecorationForm extends StatefulWidget {
  const BalloonDecorationForm({super.key});

  @override
  State<BalloonDecorationForm> createState() => _BalloonDecorationFormState();
}

class _BalloonDecorationFormState extends State<BalloonDecorationForm> {
  List<String> selectedballoonTypes = [];

  List<String> YearOfexperince = [
    "New To the Field",
    "1 - 5 Years",
    "5-10 Years",
    "More than 10 Years",
  ];
  List<String> AvailableStatus = ["Available Now", "Currently Unavailable"];
  List<String> FuntionType = [
    "Marriage",
    "Engagement",
    "Reception",
    "Housewarming",
    "Shop Opening",
    "Baby Shower",
    "School/Clg Events",
    "Naming Ceramony",
    "Birthday Party",
    "Puperty Funtion",
    "Festival Celebration",
    "All Type of functions",
  ];
  List<String> TravelChargesIncluded = ["Yes", "No"];
  List<String> ProvideCustomThemeSetup = ["Yes", "No"];
  List<String> DecorationType = [
    "Balloon Arch",
    "Balloon Wall",
    "Balloon Stand/Pillars"
        "Themed Decoration",
    "LED Balloon Decoration",
    "Ceiling Balloon Hanging",
    "Outdoor Balloon Setup",
    "Customized Name/Number Balloons"
        "All Type of Ballon Decoration",
  ];
  List<String> AdvancebookingDays = [
    "2 Days",
    "3 Days",
    "4 Days",
    "5 Days",
    "6 Days",
    "7 days",
    "8 days",
    "9 days",
    "10 days",
  ];

  List<String> Locations = [
    "Tindivanam",
    "Villupuram",
    "Pondichery",
    "Chennai",
    "Cudalore",
    "Kanchipuram",
    "Madras",
    "Salem",
    "Gingy",
    "Coimbatore",
    'Neiveli',
    "Bangalore",
    "Trichy ",
    "Thirunelveli",
    "Thuthukudi",
    "Mailapore",
    "Vellore",
  ];

  final db = FirebaseFirestore.instance;

  var promoterId = FirebaseAuth.instance.currentUser!.uid;

  void submitForm() async {
    Map<String, dynamic> data = {
      "name": name.text,
      "serviceType": serviceType.text,

      "location": location.text,
      "imageUrl": imageurl.text,
      "address": address.text,
      "phoneNumber": phoneNumber.text,
      "advancebookingDays": advancebookingDays.text,
      "DecorationType": decorationType.text,
      "ProvideCustomThemeSetup": provideCustomThemeSetup.text,
      "description": description.text,
      "companyName": companyName.text,
      "travelChargesIncluded": travelChargesIncluded.text,
      "fuctiontype": funtionType.text,
      "AvailableTimings": availableTimings.text,
      "timestamp": FieldValue.serverTimestamp(),
      "promoterId": promoterId,
    };
    try {
      await db.collection("posts").add(data);
    } catch (e) {
      print(e);
    }
  }

  TextEditingController name = TextEditingController();
  TextEditingController serviceType = TextEditingController(
    text: "Balloon Decoration",
  );

  TextEditingController location = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController imageurl = TextEditingController();
  TextEditingController amount = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController availableTimings = TextEditingController();
  TextEditingController companyName = TextEditingController();
  TextEditingController chairsAvailable = TextEditingController();
  TextEditingController advancebookingDays = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController provideCustomThemeSetup = TextEditingController();
  TextEditingController decorationType = TextEditingController();
  TextEditingController travelChargesIncluded = TextEditingController();
  TextEditingController funtionType = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent,
        title: Text("Fill the Form"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              color: Colors.black,
              elevation: 10,
              child: Center(
                child: Text(
                  "Disclaimer: Don't Try to fool any customer by uploading Fake Post.Please make sure that The details are original,Otherwise Your Account will be blocked Permanantly",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: name,
              decoration: InputDecoration(
                labelText: "Enter Your Name",
                border: OutlineInputBorder(),
                prefix: Icon(Icons.star, color: Colors.red),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: serviceType,
              enabled: false,
              decoration: InputDecoration(
                labelText: "This is Your Service Type",
                border: OutlineInputBorder(),
                prefix: Icon(Icons.star, color: Colors.red),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: companyName,
              decoration: InputDecoration(
                labelText: "Enter Your Company Name",
                border: OutlineInputBorder(),
                prefix: Icon(Icons.star, color: Colors.red),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: location,
              decoration: InputDecoration(
                prefix: Icon(Icons.star, color: Colors.red),
                suffixIcon: PopupMenuButton<String>(
                  onSelected: (String value) {
                    location.text = value;
                  },
                  itemBuilder: (BuildContext context) {
                    return Locations.map((String loc) {
                      return PopupMenuItem<String>(
                        value: loc,
                        child: Text(loc),
                      );
                    }).toList();
                  },
                ),
                labelText: "Select Your Location",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),

            TextField(
              controller: phoneNumber,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Phone Number",
                border: OutlineInputBorder(),
                prefix: Icon(Icons.star, color: Colors.red),
              ),
            ),
            SizedBox(height: 10),

            TextField(
              controller: address,
              decoration: InputDecoration(
                labelText: "Enter Your address",
                border: OutlineInputBorder(),
                prefix: Icon(Icons.star, color: Colors.red, size: 5),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: provideCustomThemeSetup,
              decoration: InputDecoration(
                labelText: "Do You Provide Custom Theme Setup ?",
                prefix: Icon(Icons.star, color: Colors.red),
                suffixIcon: PopupMenuButton<String>(
                  onSelected: (String value) {
                    provideCustomThemeSetup.text = value;
                  },
                  itemBuilder: (BuildContext context) {
                    return ProvideCustomThemeSetup.map((
                      String provideCustomThemeSetup,
                    ) {
                      return PopupMenuItem<String>(
                        value: provideCustomThemeSetup,
                        child: Text(provideCustomThemeSetup),
                      );
                    }).toList();
                  },
                ),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),

            TextField(
              controller: decorationType,
              decoration: InputDecoration(
                labelText: "What Type of Decorations You Do ?",
                border: OutlineInputBorder(),
                prefix: Icon(Icons.star, color: Colors.red),
                suffixIcon: PopupMenuButton<String>(
                  onSelected: (String value) {
                    decorationType.text = value;
                  },
                  itemBuilder: (BuildContext context) {
                    return DecorationType.map((String decorationType) {
                      return PopupMenuItem<String>(
                        value: decorationType,
                        child: Text(decorationType),
                      );
                    }).toList();
                  },
                ),
              ),
            ),
            SizedBox(height: 10),

            TextField(
              decoration: InputDecoration(
                labelText: "Previous Decoration Images",
                border: OutlineInputBorder(),
                prefix: Icon(Icons.star, color: Colors.red),
              ),
            ),
            SizedBox(height: 10),

            TextField(
              controller: advancebookingDays,
              decoration: InputDecoration(
                labelText: "Advance Booking Days",
                border: OutlineInputBorder(),
                prefix: Icon(Icons.star, color: Colors.red),
                suffixIcon: PopupMenuButton<String>(
                  onSelected: (String value) {
                    advancebookingDays.text = value;
                  },
                  itemBuilder: (BuildContext context) {
                    return AdvancebookingDays.map((String advancebookingDays) {
                      return PopupMenuItem<String>(
                        value: advancebookingDays,
                        child: Text(advancebookingDays),
                      );
                    }).toList();
                  },
                ),
              ),
            ),
            SizedBox(height: 10),

            TextField(
              decoration: InputDecoration(
                labelText: "Description",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),

            ElevatedButton(
              onPressed: () {
                setState(() {
                  try {
                    submitForm();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => SuccessScreen()),
                    );
                  } catch (e) {
                    Text("Sorry Something Went wrong Please Try again Later");
                  }
                });
              },
              child: Text("Post", style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
