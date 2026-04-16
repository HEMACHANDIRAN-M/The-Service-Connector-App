import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectorapp/success_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

class BridalMakeupForm extends StatefulWidget {
  const BridalMakeupForm({super.key});

  @override
  State<BridalMakeupForm> createState() => _BridalMakeupFormState();
}

class _BridalMakeupFormState extends State<BridalMakeupForm> {
  List<String> selectedMakeupTypes = [];

  final List<String> AvailableStatus = [
    "Available Now",
    "Currently Unavailable",
  ];
  final List<String> FuntionType = [
    "Marriage",
    "Engagement",
    "Reception",
    "Birthday Party",
    "Puperty Funtion",
    "Festival Celebration",
    "All type of funtion",
  ];
  final List<String> TravelChargesIncluded = ["Yes", "No"];
  final List<String> MakeupDuration = ["2 hours", "2.30 Hours", "3 Hours"];
  final List<String> MakeupType = [
    "HD Makeup",
    "AirBrush Makeup",
    "Engagement Makeup",
    "Reception Makeup",
    "Sangeet Makeup",
    "Pre-Wedding Short look",
    "Traditonal",
    "Muslim Bridal look",
    "WaterProof Bridal Makeup",
    "All Type of makeup",
  ];
  final List<String> AdvancebookingDays = [
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
  final List<String> Locations = [
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
  final storage = FirebaseStorage.instance;
  final user = FirebaseAuth.instance.currentUser;
  final ImagePicker _picker = ImagePicker();
  List<XFile> _images = [];

  final TextEditingController name = TextEditingController();
  final TextEditingController serviceType = TextEditingController(
    text: "Bridal Makeup",
  );
  final TextEditingController location = TextEditingController();
  final TextEditingController address = TextEditingController();
  final TextEditingController amount = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();
  final TextEditingController availableTimings = TextEditingController();
  final TextEditingController companyName = TextEditingController();
  final TextEditingController businessOpeningTime = TextEditingController();
  final TextEditingController advancebookingDays = TextEditingController();
  final TextEditingController description = TextEditingController();
  final TextEditingController makeupDuration = TextEditingController();
  final TextEditingController makeupType = TextEditingController();
  final TextEditingController travelChargesIncluded = TextEditingController();
  final TextEditingController funtionType = TextEditingController();

  Future<void> _pickImages() async {
    final List<XFile> selectedImages = await _picker.pickMultiImage();
    setState(() {
      _images = selectedImages;
    });
  }

  Future<List<String>> _uploadImages() async {
    if (_images.isEmpty) return [];

    List<String> downloadUrls = [];
    for (XFile image in _images) {
      try {
        final storageRef = storage.ref().child(
          'post_images/${DateTime.now().microsecondsSinceEpoch}',
        );
        final uploadTask = storageRef.putFile(File(image.path));
        final snapshot = await uploadTask.whenComplete(() {});
        final url = await snapshot.ref.getDownloadURL();
        downloadUrls.add(url);
      } catch (e) {
        print("Error uploading image: $e");
      }
    }
    return downloadUrls;
  }

  void submitForm() async {
    if (user == null) {
      print("User is not logged in.");
      return;
    }

    try {
      final List<String> imageUrls = await _uploadImages();

      Map<String, dynamic> data = {
        "name": name.text,
        "serviceType": serviceType.text,
        "location": location.text,
        "imageUrls": imageUrls,
        "address": address.text,
        "amount": amount.text,
        "phoneNumber": phoneNumber.text,
        "advancebookingDays": advancebookingDays.text,
        "makeupDuration": makeupDuration.text,
        "makeupType": makeupType.text,
        "description": description.text,
        "companyName": companyName.text,
        "travelChargesIncluded": travelChargesIncluded.text,
        "fuctiontype": funtionType.text,
        "AvailableTimings": availableTimings.text,
        "timestamp": FieldValue.serverTimestamp(),
        "promoterId": user!.uid,
      };

      await db.collection("posts").add(data);

      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SuccessScreen()),
      );
    } catch (e) {
      print("Error submitting form: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("An error occurred. Please try again.")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent,
        title: const Text("Fill the Form"),
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
                child: const Center(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Disclaimer: Don't Try to fool any customer by uploading Fake Post.Please make sure that The details are original,Otherwise Your Account will be blocked Permanantly",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: name,
                decoration: InputDecoration(
                  labelText: "Enter Your Name",
                  border: const OutlineInputBorder(),
                  prefixIcon: const Icon(Icons.star, color: Colors.red),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: serviceType,
                readOnly: true,
                decoration: InputDecoration(
                  labelText: "Enter Bridal Makeup",
                  border: const OutlineInputBorder(),
                  prefixIcon: const Icon(Icons.star, color: Colors.red),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: companyName,
                decoration: InputDecoration(
                  labelText: "Enter Your Company Name",
                  border: const OutlineInputBorder(),
                  prefixIcon: const Icon(Icons.star, color: Colors.red),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: businessOpeningTime,
                decoration: InputDecoration(
                  labelText: "Business Running Hours(Eg:Mon-Fri,9 AM-10pm)",
                  border: const OutlineInputBorder(),
                  prefixIcon: const Icon(Icons.star, color: Colors.red),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: availableTimings,
                readOnly: true,
                decoration: InputDecoration(
                  labelText: "Available Status",
                  prefixIcon: const Icon(Icons.star, color: Colors.red),
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
                  border: const OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: location,
                readOnly: true,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.star, color: Colors.red),
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
                  border: const OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: phoneNumber,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Phone Number",
                  border: const OutlineInputBorder(),
                  prefixIcon: const Icon(Icons.star, color: Colors.red),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: address,
                decoration: InputDecoration(
                  labelText: "Enter Your address",
                  border: const OutlineInputBorder(),
                  prefixIcon: const Icon(Icons.star, color: Colors.red),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: makeupDuration,
                readOnly: true,
                decoration: InputDecoration(
                  labelText: "Makeup Duration",
                  border: const OutlineInputBorder(),
                  prefixIcon: const Icon(Icons.star, color: Colors.red),
                  suffixIcon: PopupMenuButton<String>(
                    onSelected: (String value) {
                      makeupDuration.text = value;
                    },
                    itemBuilder: (BuildContext context) {
                      return MakeupDuration.map((String makeupDuration) {
                        return PopupMenuItem<String>(
                          value: makeupDuration,
                          child: Text(makeupDuration),
                        );
                      }).toList();
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),
              InkWell(
                onTap: () async {
                  final List<String>? results = await showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      List<String> tempSelected = List.from(
                        selectedMakeupTypes,
                      );
                      return AlertDialog(
                        backgroundColor: Colors.black,
                        title: const Text(
                          "Select Makeup Types",
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
                                    MakeupType.map((type) {
                                      return CheckboxListTile(
                                        value: tempSelected.contains(type),
                                        title: Text(
                                          type,
                                          style: const TextStyle(
                                            color: Colors.white,
                                          ),
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
                            child: const Text(
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
                      selectedMakeupTypes = results;
                      makeupType.text = selectedMakeupTypes.join(", ");
                    });
                  }
                },
                child: IgnorePointer(
                  child: TextField(
                    controller: makeupType,
                    decoration: const InputDecoration(
                      labelText: "Makeup Type (multi-select)",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.star, color: Colors.red),
                      suffixIcon: Icon(Icons.arrow_drop_down),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              InkWell(
                onTap: _pickImages,
                child: Container(
                  height: 300,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(2),
                    color: Colors.white,
                  ),
                  child:
                      _images.isEmpty
                          ? const Center(
                            child: Text('Upload Your Previous Makeup Images'),
                          )
                          : ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: _images.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.file(
                                  File(_images[index].path),
                                  fit: BoxFit.cover,
                                ),
                              );
                            },
                          ),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: advancebookingDays,
                readOnly: true,
                decoration: InputDecoration(
                  labelText: "Advance Booking Days",
                  border: const OutlineInputBorder(),
                  prefixIcon: const Icon(Icons.star, color: Colors.red),
                  suffixIcon: PopupMenuButton<String>(
                    onSelected: (String value) {
                      advancebookingDays.text = value;
                    },
                    itemBuilder: (BuildContext context) {
                      return AdvancebookingDays.map((String adv) {
                        return PopupMenuItem<String>(
                          value: adv,
                          child: Text(adv),
                        );
                      }).toList();
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: description,
                decoration: const InputDecoration(
                  labelText: "Description",
                  border: OutlineInputBorder(),
                ),
                maxLines: 5,
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.black,
                    minimumSize: const Size(0, 50),
                  ),
                  onPressed: submitForm,
                  child: const Text("Post"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
