import 'package:connectorapp/report_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart'; // Add this import for Timestamp

class BridalOwnPostdisplay extends StatefulWidget {
  final Map<String, dynamic> post;
  const BridalOwnPostdisplay({super.key, required this.post});

  @override
  State<BridalOwnPostdisplay> createState() => _BridalOwnPostdisplayState();
}

class _BridalOwnPostdisplayState extends State<BridalOwnPostdisplay> {
  bool _isFavorited = false;

  @override
  void initState() {
    super.initState();
    _checkIfFavorited();
  }

  // Helper function to prepare the post data for JSON encoding
  Map<String, dynamic> _preparePostForJson(Map<String, dynamic> post) {
    Map<String, dynamic> cleanedPost = Map.from(post);
    cleanedPost.forEach((key, value) {
      // Check if any value is a Timestamp and convert it to a string
      if (value is Timestamp) {
        cleanedPost[key] = value.toDate().toIso8601String();
      }
    });
    return cleanedPost;
  }

  // Check if the current post is in the favorites list in local storage
  void _checkIfFavorited() async {
    final prefs = await SharedPreferences.getInstance();
    final favoritesString = prefs.getStringList('favorites') ?? [];

    // Prepare the post by converting any Timestamps before encoding
    final postForJson = _preparePostForJson(widget.post);
    final postJson = jsonEncode(postForJson);

    setState(() {
      _isFavorited = favoritesString.contains(postJson);
    });
  }

  // Toggle the favorite status of the post
  void _toggleFavorite() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> favoritesString = prefs.getStringList('favorites') ?? [];

    // Prepare the post by converting any Timestamps before encoding
    final postForJson = _preparePostForJson(widget.post);
    final postJson = jsonEncode(postForJson);

    if (_isFavorited) {
      // Remove from favorites if it's already there
      favoritesString.remove(postJson);
    } else {
      // Add to favorites
      favoritesString.add(postJson);
    }

    // Save the updated list back to local storage
    await prefs.setStringList('favorites', favoritesString);

    // Update the state to reflect the change
    setState(() {
      _isFavorited = !_isFavorited;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent,
        title: const Text("Bridal Post"),
        actions: [
          IconButton(
            icon: Icon(
              _isFavorited ? Icons.favorite : Icons.favorite_border,
              color: _isFavorited ? Colors.red : null,
            ),
            onPressed: _toggleFavorite,
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.black,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ReportPage()),
                );
              },
              child: const Row(
                children: [
                  Icon(Icons.report, color: Colors.white),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      "Report",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  style: const TextStyle(fontSize: 18, color: Colors.black),
                  children: [
                    const TextSpan(
                      text: "Service Type: ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    TextSpan(text: widget.post['serviceType'] ?? ''),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  style: const TextStyle(fontSize: 16, color: Colors.black),
                  children: [
                    const TextSpan(
                      text: "Owner Name: ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(text: widget.post['name'] ?? ''),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  style: const TextStyle(fontSize: 16, color: Colors.black),
                  children: [
                    const TextSpan(
                      text: "Location: ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(text: widget.post['location'] ?? ''),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              RichText(
                text: TextSpan(
                  style: const TextStyle(fontSize: 16, color: Colors.black),
                  children: [
                    const TextSpan(
                      text: "Makeup Duration: ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(text: widget.post['makeupDuration'] ?? ''),
                  ],
                ),
              ),

              Row(
                children: [
                  RichText(
                    text: TextSpan(
                      style: const TextStyle(fontSize: 16, color: Colors.black),
                      children: [
                        const TextSpan(
                          text: "Phone Number: ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(text: widget.post['phoneNumber'] ?? ''),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),

                  Padding(
                    padding: const EdgeInsets.only(left: 70),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          minimumSize: const Size(70, 0),
                          foregroundColor: Colors.black,
                          backgroundColor: Colors.indigoAccent[100],
                        ),
                        onPressed: () {
                          final phoneNumber =
                              widget.post['phoneNumber'] as String?;
                          if (phoneNumber != null && phoneNumber.isNotEmpty) {
                            FlutterPhoneDirectCaller.callNumber(phoneNumber);
                          } else {}
                        },
                        child: const Text("Call"),
                      ),
                    ),
                  ),
                ],
              ),

              RichText(
                text: TextSpan(
                  style: const TextStyle(fontSize: 16, color: Colors.black),
                  children: [
                    const TextSpan(
                      text: "address: ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(text: widget.post['address'] ?? ''),
                  ],
                ),
              ),
              const SizedBox(height: 10),

              RichText(
                text: TextSpan(
                  style: const TextStyle(fontSize: 16, color: Colors.black),
                  children: [
                    const TextSpan(
                      text: "advanceBookingDays: ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(text: widget.post['advanceBookingDays'] ?? ''),
                  ],
                ),
              ),
              const SizedBox(height: 10),

              RichText(
                text: TextSpan(
                  style: const TextStyle(fontSize: 16, color: Colors.black),
                  children: [
                    const TextSpan(
                      text: "Description: ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(text: widget.post['description'] ?? ''),
                  ],
                ),
              ),
              const SizedBox(height: 400),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.black,
                  minimumSize: const Size(0, 100),
                  elevation: 30,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Row(
                  children: [
                    Text(
                      "Sorry Not Intrested",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 170),
                      child: Text("X", style: TextStyle(fontSize: 25)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
