import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectorapp/success_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DjSetupForm extends StatefulWidget {
  const DjSetupForm({super.key});

  @override
  State<DjSetupForm> createState() => _DjSetupFormState();
}

class _DjSetupFormState extends State<DjSetupForm> {
  List<String> selectedEquipmentTypes = [];
  List<String> YearOfexperince = [
    "New To the Field",
    "2 - 5 Years",
    "5-10 Years",
    "More than 10 Years",
  ];
  List<String> AvailableStatus = ["Available Now", "Currently Unavailable"];
  List<String> FuntionType = [
    "Marriage",
    "Engagement",
    "Reception",
    "Birthday Party",
    "Puperty Funtion",
    "Festival Celebration",
    "All Type of functions",
  ];
  List<String> EquipmentProvided = [
    " Dj Controller",
    "Speakers",
    "Bass Bin",
    "PAR LED Lights",
    "Cordless Mic",
    "Smoke Machine",
    "All Type of Equipments",
  ];
  List<String> ProvideMcHostServices = ["Yes", "No"];
  List<String> ProvideGenerator = ["Yes", "No"];
  List<String> TravelChargesIncluded = ["Yes", "No"];
  List<String> MakeupDuration = ["2 hours", "2.30 Hours", "3 Hours"];
  List<String> TotalWatts = ["5000W", "10000", "More than 10000"];
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
      "location": location.text,
      "imageUrl": imageurl.text,
      "address": address.text,
      "phoneNumber": phoneNumber.text,
      "advancebookingDays": advancebookingDays.text,
      "totalwatts": totalwatts.text,
      "ProvideGenerator": provideGenerator.text,
      "provideMcHostServices": provideMcHostServices.text,
      "equipmentProvided": equipmentProvided.text,
      "description": description.text,
      "companyName": companyName.text,
      "travelChargesIncluded": travelChargesIncluded.text,
      "fuctiontype": funtionType.text,
      "AvailableTimings": equipmentProvided.text,
    };
    try {
      await db.collection("Posts").add(data);
    } catch (e) {
      print(e);
    }
  }

  TextEditingController name = TextEditingController();
  TextEditingController location = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController imageurl = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController equipmentProvided = TextEditingController();
  TextEditingController companyName = TextEditingController();
  TextEditingController totalwatts = TextEditingController();
  TextEditingController advancebookingDays = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController provideMcHostServices = TextEditingController();
  TextEditingController provideGenerator = TextEditingController();
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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(1),
                ),
                color: Colors.black,
                elevation: 10,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Disclaimer: Don't Try to Fool any Customer by uploading Fake Post.Please make sure that The details are original,Otherwise Your Account will be blocked Permanantly",
                      style: TextStyle(color: Colors.white),
                    ),
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
                  prefix: Icon(Icons.star, color: Colors.red),
                ),
              ),
              SizedBox(height: 10),

              InkWell(
                onTap: () async {
                  final List<String>? results = await showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      List<String> tempSelected = List.from(
                        selectedEquipmentTypes,
                      );
                      return AlertDialog(
                        backgroundColor: Colors.black,
                        title: Text(
                          "Select Chair Types",
                          style: TextStyle(color: Colors.white),
                        ),
                        content: StatefulBuilder(
                          builder: (
                            BuildContext context,
                            StateSetter setStateDialog,
                          ) {
                            return SingleChildScrollView(
                              child: ListBody(
                                children:
                                    EquipmentProvided.map((type) {
                                      return CheckboxListTile(
                                        value: tempSelected.contains(type),
                                        title: Text(
                                          type,
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        onChanged: (bool? selected) {
                                          setStateDialog(() {
                                            if (selected == true) {
                                              tempSelected.add(type);
                                            } else {
                                              tempSelected.remove(type);
                                            }
                                          });
                                        },
                                      );
                                    }).toList(),
                              ),
                            );
                          },
                        ),
                        actions: [
                          TextButton(
                            child: Text(
                              "OK",
                              style: TextStyle(color: Colors.blue),
                            ),
                            onPressed: () {
                              Navigator.pop(context, tempSelected);
                            },
                          ),
                        ],
                      );
                    },
                  );

                  if (results != null) {
                    setState(() {
                      selectedEquipmentTypes = results;
                      equipmentProvided.text = selectedEquipmentTypes.join(
                        ", ",
                      );
                    });
                  }
                },
                child: IgnorePointer(
                  child: TextField(
                    controller: equipmentProvided,
                    decoration: InputDecoration(
                      labelText: "What are the Equipments You Provide ?",
                      border: OutlineInputBorder(),
                      prefix: Icon(Icons.star, color: Colors.red),
                      suffixIcon: Icon(Icons.arrow_drop_down),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: totalwatts,
                decoration: InputDecoration(
                  labelText: "Total Watts",
                  prefix: Icon(Icons.star, color: Colors.red),
                  suffixIcon: PopupMenuButton<String>(
                    onSelected: (String value) {
                      totalwatts.text = value;
                    },
                    itemBuilder: (BuildContext context) {
                      return TotalWatts.map((String totalwatts) {
                        return PopupMenuItem<String>(
                          value: totalwatts,
                          child: Text(totalwatts),
                        );
                      }).toList();
                    },
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: provideGenerator,
                decoration: InputDecoration(
                  labelText: "Do You Provide Genrator",
                  prefix: Icon(Icons.star, color: Colors.red),
                  suffixIcon: PopupMenuButton<String>(
                    onSelected: (String value) {
                      provideGenerator.text = value;
                    },
                    itemBuilder: (BuildContext context) {
                      return ProvideGenerator.map((String provideGenerator) {
                        return PopupMenuItem<String>(
                          value: provideGenerator,
                          child: Text(provideGenerator),
                        );
                      }).toList();
                    },
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: provideMcHostServices,
                decoration: InputDecoration(
                  labelText: "Do You Provide MC/Host Service ?",
                  prefix: Icon(Icons.star, color: Colors.red),
                  suffixIcon: PopupMenuButton<String>(
                    onSelected: (String value) {
                      provideMcHostServices.text = value;
                    },
                    itemBuilder: (BuildContext context) {
                      return ProvideMcHostServices.map((
                        String provideMcHostServices,
                      ) {
                        return PopupMenuItem<String>(
                          value: provideMcHostServices,
                          child: Text(provideMcHostServices),
                        );
                      }).toList();
                    },
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),

              TextField(
                decoration: InputDecoration(
                  labelText: "Previous Makeup Images",
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
                      return AdvancebookingDays.map((
                        String advancebookingDays,
                      ) {
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
                        MaterialPageRoute(
                          builder: (context) => SuccessScreen(),
                        ),
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
      ),
    );
  }
}
