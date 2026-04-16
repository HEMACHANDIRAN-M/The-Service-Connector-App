import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectorapp/success_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DigitalStudioForm extends StatefulWidget {
  const DigitalStudioForm({super.key});

  @override
  State<DigitalStudioForm> createState() => _DigitalStudioFormState();
}

class _DigitalStudioFormState extends State<DigitalStudioForm> {
  List<String> selectedDigitalThings = [];
  List<String> selectedFuntionType = [];
  List<String> selectedpackagesIncluded = [];
  List<String> AvailableStatus = ["Available Now", "Currently Unavailable"];
  List<String> FuntionType = [
    "Marriage",
    "Engagement",
    "Reception",
    "Birthday Party",
    "Puperty Funtion",
    "Festival Celebration",
    "All type of funtion",
  ];
  List<String> DigitalThings = [
    "Banner Printing",
    "Poster Printing",
    "PhotoShoot for Wedding",
    "VideoGraphy for Wedding",
    "Business English/Interview Skills",
    "English Subject Tution(1st to 12th std)",
    "IELTS/TOEFL/Cambridge English Exam Training"
        "Others",
  ];
  List<String> PackagesIncluded = [
    "Subjects Notes",
    "Spoken Practice",
    "Practice Exercise",
    "Others",
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
      "serviceTime": serviceTime.text,
      "location": location.text,
      "imageUrl": imageurl.text,
      "address": address.text,
      "phoneNumber": phoneNumber.text,
      "advancebookingDays": advancebookingDays.text,
      "packagesIncluded": packagesIncluded.text,
      "digitalThings": digitalThings.text,
      "funtionType": funtionType.text,
      "description": description.text,
      "companyName": companyName.text,
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
    text: "Tamil Teaching",
  );
  TextEditingController location = TextEditingController();
  TextEditingController serviceTime = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController imageurl = TextEditingController();
  TextEditingController digitalThings = TextEditingController();
  TextEditingController funtionType = TextEditingController();
  TextEditingController packagesIncluded = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController companyName = TextEditingController();
  TextEditingController businessOpeningTime = TextEditingController();
  TextEditingController advancebookingDays = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController travelChargesIncluded = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent,
        title: Text("Fill the Form"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
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
              SizedBox(height: 20),
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
                readOnly: true,
                controller: serviceType,
                decoration: InputDecoration(
                  labelText: "This is Your Service",
                  border: OutlineInputBorder(),
                  prefix: Icon(Icons.star, color: Colors.red),
                ),
              ),
              SizedBox(height: 20),

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
              SizedBox(height: 20),
              TextField(
                controller: phoneNumber,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Phone Number",
                  border: OutlineInputBorder(),
                  prefix: Icon(Icons.star, color: Colors.red),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: address,
                decoration: InputDecoration(
                  labelText: "Enter Your address",
                  border: OutlineInputBorder(),
                  prefix: Icon(Icons.star, color: Colors.red),
                ),
              ),
              SizedBox(height: 20),

              SizedBox(height: 20),
              InkWell(
                onTap: () async {
                  final List<String>? results = await showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      List<String> tempSelected = List.from(
                        selectedFuntionType,
                      );
                      return AlertDialog(
                        backgroundColor: Colors.black,
                        title: Text(
                          "Select funtion Type",
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
                      selectedFuntionType = results;
                      funtionType.text = selectedFuntionType.join(", ");
                    });
                  }
                },
                child: IgnorePointer(
                  child: TextField(
                    controller: funtionType,
                    decoration: InputDecoration(
                      labelText: "Function Type (multi-select)",
                      border: OutlineInputBorder(),
                      prefix: Icon(Icons.star, color: Colors.red),
                      suffixIcon: Icon(Icons.arrow_drop_down),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () async {
                  final List<String>? results = await showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      List<String> tempSelected = List.from(
                        selectedDigitalThings,
                      );
                      return AlertDialog(
                        backgroundColor: Colors.black,
                        title: Text(
                          "Choose your Working Things ",
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
                                    DigitalThings.map((type) {
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
                      selectedDigitalThings = results;
                      digitalThings.text = selectedDigitalThings.join(", ");
                    });
                  }
                },
                child: IgnorePointer(
                  child: TextField(
                    controller: digitalThings,
                    decoration: InputDecoration(
                      labelText: "Student Types (multi-select)",
                      border: OutlineInputBorder(),
                      prefix: Icon(Icons.star, color: Colors.red),
                      suffixIcon: Icon(Icons.arrow_drop_down),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20),
              TextField(
                controller: imageurl,
                decoration: InputDecoration(
                  labelText: "Acadamy Images",
                  border: OutlineInputBorder(),
                  prefix: Icon(Icons.star, color: Colors.red),
                ),
              ),
              SizedBox(height: 20),

              InkWell(
                onTap: () async {
                  final List<String>? results = await showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      List<String> tempSelected = List.from(
                        selectedpackagesIncluded,
                      );
                      return AlertDialog(
                        backgroundColor: Colors.black,
                        title: Text(
                          "Choose Your Packages Included",
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
                                    PackagesIncluded.map((type) {
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
                      selectedpackagesIncluded = results;
                      packagesIncluded.text = selectedpackagesIncluded.join(
                        ", ",
                      );
                    });
                  }
                },
                child: IgnorePointer(
                  child: TextField(
                    controller: packagesIncluded,
                    decoration: InputDecoration(
                      labelText: "Do You Provide Basic Packages ?",
                      border: OutlineInputBorder(),
                      prefix: Icon(Icons.star, color: Colors.red),
                      suffixIcon: Icon(Icons.arrow_drop_down),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: description,
                decoration: InputDecoration(
                  labelText: "Description",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.black,
                    minimumSize: Size(0, 50),
                  ),
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
                        Text(
                          "Sorry Something Went wrong Please Try again Later",
                        );
                      }
                    });
                  },
                  child: Text("Post"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
