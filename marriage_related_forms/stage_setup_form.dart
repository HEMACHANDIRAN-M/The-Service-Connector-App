import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectorapp/success_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class StageSetupForm extends StatefulWidget {
  const StageSetupForm({super.key});

  @override
  State<StageSetupForm> createState() => _StageSetupFormState();
}

class _StageSetupFormState extends State<StageSetupForm> {
  List<String> selectedStageSetupTypes = [];
  List<String> selectedFuntionTypes = [];
  List<String> selectedSizeTypes = [];
  List<String> selectedmaterialTypes = [];

  List<String> YearOfexperince = [
    "New To the Field",
    "1 - 5 Years",
    "5-10 Years",
    "More than 10 Years",
  ];
  List<String> MaterialType = [
    "LED Pannels",
    "Flower Stands",
    "Sofa Sets",
    "Carpets",
    "Arch Design",
    "Lighr Fixtures",
    "All Materials Available"
  ];
  List<String> AvailableStatus = ["Available Now", "Currently Unavailable"];
  List<String> FuntionType = [
    "Marriage",
    "Reception",
    "School/Clg Functions",
    "Shop Opening",
    "Baby Shower",
    "Religius Events",
    "Birthday Party",
    "All Type of functions",
  ];
  List<String> TravelChargesIncluded = ["Yes", "No"];
  List<String> Stagetype = [
    "Floral",
    "Modern Theme",
    "Custamized Banner Setup",
    "Theme Based Design",
    "LED Based",
    "Traditional",
    "Simple Curtain",
    "Royal Design",
    "Balloon Setup",
  ];
  List<String> SizeOptions = [
    "10x8 ft",
    "12x10 ft",
    "20x10 ft",
    "All Options Available",
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
      "location": location.text,
      "imageUrl": imageurl.text,
      "address": address.text,
      "phoneNumber": phoneNumber.text,
      "availableStatus": availableStatus.text,
      "advancebookingDays": advancebookingDays.text,
      "Stagetype": stageType.text,
      "Materialtype": materialType.text,

      "sizeOptions": sizeOptions.text,
      "description": description.text,
      "companyName": companyName.text,
      "travelChargesIncluded": travelChargesIncluded.text,
      "fuctiontype": funtionType.text,
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
  TextEditingController availableStatus = TextEditingController();
  TextEditingController companyName = TextEditingController();
  TextEditingController advancebookingDays = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController stageType = TextEditingController();
  TextEditingController materialType = TextEditingController();

  TextEditingController sizeOptions = TextEditingController();
  TextEditingController travelChargesIncluded = TextEditingController();
  TextEditingController funtionType = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent,
        title: Text("Fill the Form"),
      ),
      body: Column(
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
                    return PopupMenuItem<String>(value: loc, child: Text(loc));
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
          InkWell(
            onTap: () async {
              final List<String>? results = await showDialog(
                context: context,
                builder: (BuildContext context) {
                  List<String> tempSelected = List.from(selectedSizeTypes);
                  return AlertDialog(
                    backgroundColor: Colors.black,
                    title: Text(
                      "Select Stage Size",
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
                                Stagetype.map((type) {
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
                        child: Text("OK", style: TextStyle(color: Colors.blue)),
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
                  selectedSizeTypes = results;
                  sizeOptions.text = selectedSizeTypes.join(", ");
                });
              }
            },
            child: IgnorePointer(
              child: TextField(
                controller: sizeOptions,
                decoration: InputDecoration(
                  labelText: "What Size Do you Provide ?  (multi-select)",
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
                  List<String> tempSelected = List.from(selectedmaterialTypes);
                  return AlertDialog(
                    backgroundColor: Colors.black,
                    title: Text(
                      "Select Equipments ",
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
                                MaterialType.map((type) {
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
                        child: Text("OK", style: TextStyle(color: Colors.blue)),
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
                  selectedmaterialTypes = results;
                  materialType.text = selectedmaterialTypes.join(", ");
                });
              }
            },
            child: IgnorePointer(
              child: TextField(
                controller: materialType,
                decoration: InputDecoration(
                  labelText: "What Equipments Do you Provide ?  (multi-select)",
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
                  List<String> tempSelected = List.from(selectedFuntionTypes);
                  return AlertDialog(
                    backgroundColor: Colors.black,
                    title: Text(
                      "Select Funtion Types",
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
                        child: Text("OK", style: TextStyle(color: Colors.blue)),
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
                  labelText: "Function Type (multi-select)",
                  border: OutlineInputBorder(),
                  prefix: Icon(Icons.star, color: Colors.red),
                  suffixIcon: Icon(Icons.arrow_drop_down),
                ),
              ),
            ),
          ),
          TextField(
            decoration: InputDecoration(
              labelText: "Previous Decoration Images",
              border: OutlineInputBorder(),
              prefix: Icon(Icons.star, color: Colors.red),
            ),
          ),
          SizedBox(height: 10),
          TextField(
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
    );
  }
}
