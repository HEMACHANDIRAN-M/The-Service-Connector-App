import 'package:connectorapp/Service_Display_pages/service_display.dart';
import 'package:connectorapp/coaching_based_forms/arrear_paper_form.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ArreaPaperAddPage extends StatefulWidget {
  const ArreaPaperAddPage({super.key});

  @override
  State<ArreaPaperAddPage> createState() => _ArreaPaperAddPageState();
}

class _ArreaPaperAddPageState extends State<ArreaPaperAddPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        child: Icon(Icons.add, size: 20, color: Colors.white),
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => ArrearPaperForm()),
          );
        },
      ),
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent,
        toolbarHeight: 110,
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => ServiceDisplay()),
            );
          },
          icon: Icon(Icons.exit_to_app),
        ),
        title: Text("Arrear paper Form"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 1),
              child: LottieBuilder.asset("assets/animations/exam student.json"),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 0),
              child: Center(
                child: Card(
                  elevation: 50,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    'Just clicking the below  "+"  Add Button You can Post Your Service, By the way of Filling the Form with Your  Original Details ',
                    style: TextStyle(
                      shadows: [
                        Shadow(color: Colors.indigoAccent, blurRadius: 40),
                      ],
                      fontWeight: FontWeight.bold,
                      color: Colors.indigoAccent,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
