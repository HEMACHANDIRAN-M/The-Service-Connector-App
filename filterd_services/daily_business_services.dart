import 'package:connectorapp/daily_related_services_card.dart/digital_studio_card.dart';
import 'package:flutter/material.dart';

class DailyBusinessServices extends StatefulWidget {
  const DailyBusinessServices({super.key});

  @override
  State<DailyBusinessServices> createState() => _DailyBusinessServicesState();
}

class _DailyBusinessServicesState extends State<DailyBusinessServices> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Daily Working Services")
      ),
      body: Column(
        children: [
          InkWell(
      onTap: (){
         Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => DigitalStudioCard()),
                );
      },
      child: Card(elevation: 10,
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
                              Icon(Icons.camera, size: 50),
                              Center(child: Text('Digital Studio')),
                            ],
                          ),
                        ),
                      ),
          ),
          InkWell(
      onTap: (){
         Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => DigitalStudioCard()),
                );
      },
      child: Card(elevation: 10,
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
                              Icon(Icons.camera, size: 50),
                              Center(child: Text('Digital Studio')),
                            ],
                          ),
                        ),
                      ),
          )
        ],
      ),
      );
  }
}
