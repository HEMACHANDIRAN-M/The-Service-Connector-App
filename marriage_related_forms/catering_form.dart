import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectorapp/success_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CateringForm extends StatefulWidget {
  const CateringForm({super.key});

  @override
  State<CateringForm> createState() => _CateringFormState();
}

class _CateringFormState extends State<CateringForm> {
  List<String> selectedFoodTypes = [];
  List<String> selectedFuntionTypes = [];

  List<String> YearOfexperince = [
    "New To the Field",
    "2 - 5Years",
    "5 - 10 Years",
    "More Than 10 Years",
  ];
  List<String> AvailableStatus = ["Available Now", "Currently Unavailable"];
  List<String> FuntionType = [
    "Marriage",
    "Engagement",
    "Reception",
    "Birthday Party",
    "Baby Shower",
    "Puperty Funtion",
    "Religious Event",
    "School/College Events",
    "Festival Celebration",
    "All Type of functions",
  ];
  List<String> TravelChargesIncluded = ["Yes", "No"];
  List<String> ProvideComboWithDecoration = ["Yes", "No"];
  List<String> FoodType = [
    "Traditonal South Indian Foods",
    "Veg ",
    "Non-Veg"
        "Veg & Non-Veg",
    "North Indian",
    "Chinese",
    "Continental",
    "Tiffen Items",
    "Sweets & Desserts",
    "Custum Menu",
    "All Type of makeup",
  ];
  List<String> DiningCapacity = [
    "100",
    "200-300",
    "300-400",
    "400-500",
    "500-600",
    "600-700",
    "700-800",
    "800-900",
    "1000 or More than 1000",
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
      "provideComboWithDecoration": provideComboWithDecoration.text,
      "foodType": foodType.text,
      "description": description.text,
      "companyName": companyName.text,
      "diningCapacity": diningcapacity,
      "travelChargesIncluded": travelChargesIncluded.text,
      "fuctiontype": funtionType.text,
      "AvailableTimings": availableTimings.text,
    };
    try {
      await db.collection("posts").add(data);
    } catch (e) {
      print(e);
    }
  }

  TextEditingController name = TextEditingController();
  TextEditingController serviceType = TextEditingController();
  TextEditingController location = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController imageurl = TextEditingController();
  TextEditingController diningcapacity = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController availableTimings = TextEditingController();
  TextEditingController companyName = TextEditingController();
  TextEditingController businessOpeningTime = TextEditingController();
  TextEditingController advancebookingDays = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController provideComboWithDecoration = TextEditingController();
  TextEditingController foodType = TextEditingController();
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
          padding: const EdgeInsets.all(20),
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
                controller: serviceType,
                decoration: InputDecoration(
                  labelText: "Enter catering Service ",
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
                controller: businessOpeningTime,
                decoration: InputDecoration(
                  labelText: "Business Running Hours(Eg:Mon-Fri,9 AM-10pm)",
                  border: OutlineInputBorder(),
                  prefix: Icon(Icons.star, color: Colors.red),
                ),
              ),
              SizedBox(height: 20),

              TextField(
                controller: availableTimings,
                decoration: InputDecoration(
                  labelText: "Available Status",
                  prefix: Icon(Icons.star, color: Colors.red),
                  suffixIcon: PopupMenuButton<String>(
                    onSelected: (String value) {
                      availableTimings.text = value;
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

              TextField(
                controller: provideComboWithDecoration,
                decoration: InputDecoration(
                  labelText: "Do You Provide Combo with Decoration ?",
                  border: OutlineInputBorder(),
                  prefix: Icon(Icons.star, color: Colors.red),
                  suffixIcon: PopupMenuButton<String>(
                    onSelected: (String value) {
                      provideComboWithDecoration.text = value;
                    },
                    itemBuilder: (BuildContext context) {
                      return ProvideComboWithDecoration.map((
                        String provideComboWithDecoration,
                      ) {
                        return PopupMenuItem<String>(
                          value: provideComboWithDecoration,
                          child: Text(provideComboWithDecoration),
                        );
                      }).toList();
                    },
                  ),
                ),
              ),
              SizedBox(height: 20),

              InkWell(
                onTap: () async {
                  final List<String>? results = await showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      List<String> tempSelected = List.from(selectedFoodTypes);
                      return AlertDialog(
                        backgroundColor: Colors.black,
                        title: Text(
                          "Select Food Types",
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
                                    FoodType.map((type) {
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
                      selectedFoodTypes = results;
                      foodType.text = selectedFoodTypes.join(", ");
                    });
                  }
                },
                child: IgnorePointer(
                  child: TextField(
                    controller: foodType,
                    decoration: InputDecoration(
                      labelText: "Food Type",
                      border: OutlineInputBorder(),
                      prefix: Icon(Icons.star, color: Colors.red),
                      suffixIcon: Icon(Icons.arrow_drop_down),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: diningcapacity,
                decoration: InputDecoration(
                  labelText: "Dining Capacity",
                  border: OutlineInputBorder(),
                  prefix: Icon(Icons.star, color: Colors.red),
                  suffixIcon: PopupMenuButton<String>(
                    onSelected: (String value) {
                      diningcapacity.text = value;
                    },
                    itemBuilder: (BuildContext context) {
                      return DiningCapacity.map((String diningCapacity) {
                        return PopupMenuItem<String>(
                          value: diningCapacity,
                          child: Text(diningCapacity),
                        );
                      }).toList();
                    },
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  labelText: "Previous Makeup Images",
                  border: OutlineInputBorder(),
                  prefix: Icon(Icons.star, color: Colors.red),
                ),
              ),
              SizedBox(height: 20),

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
              SizedBox(height: 20),

              TextField(
                decoration: InputDecoration(
                  labelText: "Description",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),

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
