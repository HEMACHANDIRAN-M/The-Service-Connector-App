import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectorapp/success_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LightDecorationForm extends StatefulWidget {
  const LightDecorationForm({super.key});

  @override
  State<LightDecorationForm> createState() => _LightDecorationFormState();
}

class _LightDecorationFormState extends State<LightDecorationForm> {
  List<String> selectedLightTyoe = [];
  List<String> selectedFuntionTypes = [];

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
    "Home Funtions"
    "Baby Shower",
    "Temple/Church/Function Hall",
    "Shop/Mall/Hotel",
    "Stage Shows",
    "School/Clg Events",
    "Birthday Party",
    "Puperty Funtion",
    "Festival Celebration",
    "All Type of functions",
  ];
  List<String> TravelChargesIncluded = ["Yes", "No"];

  List<String> ProvideGenerators = ["Yes", "No"];
  List<String> LightType = [
    "LED Serial Lights",
    "Rice Lights",
    "Focus Lights",
    "Hanging Bulbs",
    "Wedding Backdrop Lights"
    "RGB Colour Changing Lights",
    "Moving Head Lights",
    "Spot/Focus Lights",
    "Backdrop Lights",
    "Colour Changing Lights",
    "Drone Sky Lights",
    "Entry Lighting"
    "String Curtain Lights",
    "Pathway/Floor Lights",
    "DMX Controller Setup",
    "All Type of Light Decoration",
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
      "serviceType":serviceType.text,
      "location": location.text,
      "imageUrl": imageurl.text,
      "address": address.text,
      "phoneNumber": phoneNumber.text,
      "advancebookingDays": advancebookingDays.text,
      "LightType": lightType.text,
      "providegenerator": provideGenerators.text,
      "description": description.text,
      "companyName": companyName.text,
      "travelChargesIncluded": travelChargesIncluded.text,
      "fuctiontype": funtionType.text,
      "AvailableTimings": availableTimings.text,
    };
    try {
      await db.collection("Posts").add(data);
    } catch (e) {
      print(e);
    }
  }

  TextEditingController name = TextEditingController();
    TextEditingController serviceType = TextEditingController();

  TextEditingController location = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController imageurl = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController availableTimings = TextEditingController();
  TextEditingController companyName = TextEditingController();
  TextEditingController advancebookingDays = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController provideGenerators = TextEditingController();
  TextEditingController lightType = TextEditingController();
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
                  borderRadius: BorderRadius.circular(5),
                ),
                color: Colors.black,
                elevation: 10,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Disclaimer: Don't Try to fool any customer by uploading Fake Post.Please make sure that The details are original,Otherwise Your Account will be blocked Permanantly",
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
              SizedBox(height: 20),
 TextField(
                controller: name,
                decoration: InputDecoration(
                  labelText: "Enter Your Name",
                  border: OutlineInputBorder(),
                  prefix: Icon(Icons.star, color: Colors.red),
                ),
              ),
              SizedBox(height: 20,),
              TextField(
                controller: companyName,
                decoration: InputDecoration(
                  labelText: "Enter Your Company Name",
                  border: OutlineInputBorder(),
                  prefix: Icon(Icons.star, color: Colors.red),
                ),
              ),
              SizedBox(height: 20),
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
              SizedBox(height: 20),
              InkWell(
                onTap: () async {
                  final List<String>? results = await showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      List<String> tempSelected = List.from(
                        selectedFuntionTypes,
                      );
                      return AlertDialog(
                        backgroundColor: Colors.black,
                        title: Text(
                          "Select Function Types",
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
                                    FuntionType.map((type) {
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
                      selectedFuntionTypes = results;
                      funtionType.text = selectedFuntionTypes.join(", ");
                    });
                  }
                },
                child: IgnorePointer(
                  child: TextField(
                    controller: funtionType,
                    decoration: InputDecoration(
                      labelText: "Funtion Type (multi-select)",
                      border: OutlineInputBorder(),
                      prefix: Icon(Icons.star, color: Colors.red),
                      suffixIcon: Icon(Icons.arrow_drop_down),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: provideGenerators,
                decoration: InputDecoration(
                  labelText: "Do You Provide Generator for Power Supply ?",
                  prefix: Icon(Icons.star, color: Colors.red),
                  suffixIcon: PopupMenuButton<String>(
                    onSelected: (String value) {
                      provideGenerators.text = value;
                    },
                    itemBuilder: (BuildContext context) {
                      return ProvideGenerators.map((String provideGenerators) {
                        return PopupMenuItem<String>(
                          value: provideGenerators,
                          child: Text(provideGenerators),
                        );
                      }).toList();
                    },
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),

              InkWell(
                onTap: () async {
                  final List<String>? results = await showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      List<String> tempSelected = List.from(selectedLightTyoe);
                      return AlertDialog(
                        backgroundColor: Colors.black,
                        title: Text(
                          "Select Light Types",
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
                                    LightType.map((type) {
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
                      selectedLightTyoe = results;
                      lightType.text = selectedLightTyoe.join(", ");
                    });
                  }
                },
                child: IgnorePointer(
                  child: TextField(
                    controller: lightType,
                    decoration: InputDecoration(
                      labelText: "Light Type (multi-select)",
                      border: OutlineInputBorder(),
                      prefix: Icon(Icons.star, color: Colors.red),
                      suffixIcon: Icon(Icons.arrow_drop_down),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),

              TextField(
                controller: description,
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
