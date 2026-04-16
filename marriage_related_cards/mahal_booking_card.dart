import 'package:connectorapp/Marriage%20Related%20Add%20Page/mahal_booking.dart';
import 'package:flutter/material.dart';

class MahalBookingCard extends StatefulWidget {
  const MahalBookingCard({super.key});

  @override
  State<MahalBookingCard> createState() => _MahalBookingCardState();
}

class _MahalBookingCardState extends State<MahalBookingCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MahalBooking()),
          );
        },
        child: Card(
          elevation: 10,

          child: Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              color: Color(0xFFECECFC),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.location_city, size: 55),
                SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.only(left: 4, bottom: 1),
                  child: Center(
                    child: Text(
                      'Mahal Booking',
                      style: TextStyle(
                        fontSize: 12.5,
                        fontFamily: "Poppins",
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
