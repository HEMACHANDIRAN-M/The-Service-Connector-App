import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectorapp/success_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SkillBasedForm extends StatefulWidget {
  const SkillBasedForm({super.key});

  @override
  State<SkillBasedForm> createState() => _SkillBasedFormState();
}

class _SkillBasedFormState extends State<SkillBasedForm> {
  List<String> selectedSkillTypes = [];
  List<String> selectedLanguageTypes = [];
  List<String> selectedModeOfTraining = [];
  List<String> selectedSubjectsHandled = [];
  List<String> selectedpackagesIncluded = [];

  List<String> LanguageUsedForTeaching = ["Tamil", "English", "Hindi", "Other"];
  List<String> ProvideCertification = ["Yes", "No"];

  List<String> AvailableStatus = ["Available Now", "Currently Unavailable"];
  List<String> SubjectsHandled = [
    "Physics",
    "Chemistry",
    "Biology",
    "General Studies",
    "Quantitative Aptitude",
    "Reasonig",
    "Verbal Ability",
    "English",
    "Others",
  ];
  List<String> PackagesIncluded = [
    "Notes/Practice Sheets",
    "Hands-on Activities/Projects",
    "Completion Certificated",
    "Others",
  ];
  List<String> SkillType = [
    "Tailoring",
    "Beatician/Makeup",
    "Electrical/Plumber",
    "Handicrafts/Arts & Craft",
    "Spoken English/Soft Skills",
    "Digital Skills(Graphic Design,Animation,etc)",
    "Mobile/Laptop Servicing",
    "Embroidery",
    "Other Skills",
  ];

  List<String> ModeOfTraining = [
    "Online",
    "Offline",
    "Group Class",
    "Pre-recorden Videos",
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
      "provideCertification": provideCertification.text,

      "advancebookingDays": advancebookingDays.text,
      "skillType": skillType.text,
      "subjectype": subjecthandles.text,
      "packagesIncluded": packagesIncluded.text,
      "description": description.text,
      "companyName": companyName.text,
      "modeOFTraining": modeOfTraining.text,
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
    text: "Arrear Help",
  );
  TextEditingController location = TextEditingController();
  TextEditingController serviceTime = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController imageurl = TextEditingController();
  TextEditingController skillType = TextEditingController();
  TextEditingController subjecthandles = TextEditingController();
  TextEditingController languageUsedForTeaching = TextEditingController();
  TextEditingController packagesIncluded = TextEditingController();
  TextEditingController provideCertification = TextEditingController();

  TextEditingController phoneNumber = TextEditingController();
  TextEditingController modeOfTraining = TextEditingController();
  TextEditingController companyName = TextEditingController();
  TextEditingController businessOpeningTime = TextEditingController();
  TextEditingController advancebookingDays = TextEditingController();
  TextEditingController description = TextEditingController();

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
                controller: modeOfTraining,
                decoration: InputDecoration(
                  labelText: "Available Status",
                  prefix: Icon(Icons.star, color: Colors.red),
                  suffixIcon: PopupMenuButton<String>(
                    onSelected: (String value) {
                      modeOfTraining.text = value;
                    },
                    itemBuilder: (BuildContext context) {
                      return AvailableStatus.map((String availableTimings) {
                        return PopupMenuItem<String>(
                          value: availableTimings,
                          child: Text(availableTimings),
                        );
                      }).toList();
                    },
                  ),
                  border: OutlineInputBorder(),
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
                      List<String> tempSelected = List.from(selectedSkillTypes);
                      return AlertDialog(
                        backgroundColor: Colors.black,
                        title: Text(
                          "Select skill Type",
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
                                    SkillType.map((type) {
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
                      selectedSkillTypes = results;
                      skillType.text = selectedSkillTypes.join(", ");
                    });
                  }
                },
                child: IgnorePointer(
                  child: TextField(
                    controller: skillType,
                    decoration: InputDecoration(
                      labelText: "Skill Type (multi-select)",
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
                        selectedpackagesIncluded,
                      );
                      return AlertDialog(
                        backgroundColor: Colors.black,
                        title: Text(
                          "Select Your Packages",
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
                      labelText:
                          "Do you Provide Basic Packages ? (multi-select)",
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
                        selectedSubjectsHandled,
                      );
                      return AlertDialog(
                        backgroundColor: Colors.black,
                        title: Text(
                          "Which Subject you Teach ?",
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
                                    SubjectsHandled.map((type) {
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
                      selectedSubjectsHandled = results;
                      subjecthandles.text = selectedSubjectsHandled.join(", ");
                    });
                  }
                },
                child: IgnorePointer(
                  child: TextField(
                    controller: subjecthandles,
                    decoration: InputDecoration(
                      labelText: "Subjects you handle (multi-select)",
                      border: OutlineInputBorder(),
                      prefix: Icon(Icons.star, color: Colors.red),
                      suffixIcon: Icon(Icons.arrow_drop_down),
                    ),
                  ),
                ),
              ),
              TextField(
                controller: languageUsedForTeaching,
                decoration: InputDecoration(
                  prefix: Icon(Icons.star, color: Colors.red),
                  suffixIcon: PopupMenuButton<String>(
                    onSelected: (String value) {
                      languageUsedForTeaching.text = value;
                    },
                    itemBuilder: (BuildContext context) {
                      return LanguageUsedForTeaching.map((
                        String languageUsedForTeaching,
                      ) {
                        return PopupMenuItem<String>(
                          value: languageUsedForTeaching,
                          child: Text(languageUsedForTeaching),
                        );
                      }).toList();
                    },
                  ),
                  labelText: "Which Time You will Service ?",
                  border: OutlineInputBorder(),
                ),
              ),

              SizedBox(height: 20),
              TextField(
                controller: provideCertification,
                decoration: InputDecoration(
                  prefix: Icon(Icons.star, color: Colors.red),
                  suffixIcon: PopupMenuButton<String>(
                    onSelected: (String value) {
                      location.text = value;
                    },
                    itemBuilder: (BuildContext context) {
                      return ProvideCertification.map((
                        String provideCertification,
                      ) {
                        return PopupMenuItem<String>(
                          value: provideCertification,
                          child: Text(provideCertification),
                        );
                      }).toList();
                    },
                  ),
                  labelText: "Do You Provide Certification ?",
                  border: OutlineInputBorder(),
                ),
              ),
              TextField(
                controller: imageurl,
                decoration: InputDecoration(
                  labelText: "Acadamy Images",
                  border: OutlineInputBorder(),
                  prefix: Icon(Icons.star, color: Colors.red),
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
