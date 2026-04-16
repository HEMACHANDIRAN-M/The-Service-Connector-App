import 'package:flutter/material.dart';

class BalloonOwnPostdisplay extends StatefulWidget {
  final Map<String, dynamic> post;
  const BalloonOwnPostdisplay({super.key, required this.post});

  @override
  State<BalloonOwnPostdisplay> createState() => _BalloonOwnPostdisplayState();
}

class _BalloonOwnPostdisplayState extends State<BalloonOwnPostdisplay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent,

        title: Text("Balloon Decoration Post"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text("Service Type: ${widget.post['serviceType']}"),
            Text("Name: ${widget.post['name']}"),
            Text("Phone: ${widget.post['phone']}"),
            Text("location: ${widget.post['location']}"),
            Text("Decoration Type: ${widget.post['decorationType']}"),
            Text("address: ${widget.post['address']}"),
            Text("imageurl: ${widget.post['imageurl']}"),
            Text("advanceBookingDays: ${widget.post['advanceBookingDays']}"),
            Text("location: ${widget.post['location']}"),
            Text("Decoration Type: ${widget.post['decorationType']}"),
          ],
        ),
      ),
    );
  }
}
