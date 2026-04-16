import 'package:connectorapp/Promoter_Bottom_navigation_bar/pro_first_bar.dart';
import 'package:connectorapp/auth_screens/signup_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class EmailScreen extends StatefulWidget {
  const EmailScreen({super.key});

  @override
  State<EmailScreen> createState() => _EmailVerificationState();
}

class _EmailVerificationState extends State<EmailScreen> {
  TextEditingController roleController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> LoginAccount() async {
    if (emailController.text.isEmpty ||
        passwordController.text.isEmpty ||
        roleController.text.isEmpty ||
        phoneNumberController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.orange,
          content: Text(
            "Please fill all required fields (Name, Email, Phone, Password).",
          ),
        ),
      );
      return;
    }

    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
            email: emailController.text,
            password: passwordController.text,
          );

      User? currentUser = userCredential.user;

      if (currentUser != null) {
        DocumentSnapshot promoterDoc =
            await _firestore.collection('promoters').doc(currentUser.uid).get();

        if (!promoterDoc.exists) {
          print(
            "Profile for UID ${currentUser.uid} does not exist. Creating new profile.",
          );
          await _firestore.collection('promoters').doc(currentUser.uid).set({
            'role': roleController.text,
            'email': currentUser.email,
            'phoneNumber': phoneNumberController.text,
            'id': currentUser.uid,
            'createdAt': FieldValue.serverTimestamp(),
          });
          print("New promoter profile created in Firestore.");
        } else {
          print(
            "Promoter profile for UID ${currentUser.uid} already exists. Not overwriting.",
          );
        }

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => ProFirstBar()),
        );
        print("Account Logged in successfully and profile handled.");
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.red,
            content: Text(
              "Login failed. User object is null after authentication.",
            ),
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      String errorMessage;
      if (e.code == 'user-not-found') {
        errorMessage = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        errorMessage = 'Wrong password provided for that user.';
      } else if (e.code == 'invalid-email') {
        errorMessage = 'The email address is not valid.';
      } else {
        errorMessage = 'Login failed: ${e.message}';
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(backgroundColor: Colors.red, content: Text(errorMessage)),
      );
      print("Firebase Auth Error: $e");
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text("An unexpected error occurred: ${e.toString()}"),
        ),
      );
      print("General Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 80),
                child: LottieBuilder.asset("assets/animations/Login.json"),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                // --- FIX IS HERE ---
                // Removed the fixed height property from the Container
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: roleController,
                          decoration: const InputDecoration(
                            label: Text(
                              "Enter Your Name",
                              style: TextStyle(color: Colors.black),
                            ),
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: emailController,
                          decoration: const InputDecoration(
                            label: Text(
                              "Enter Your Email",
                              style: TextStyle(color: Colors.black),
                            ),
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: phoneNumberController,
                          keyboardType: TextInputType.phone,
                          decoration: const InputDecoration(
                            label: Text(
                              "Enter Your Phone Number",
                              style: TextStyle(color: Colors.black),
                            ),
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          autocorrect: false,
                          enableSuggestions: false,
                          obscureText: true,
                          controller: passwordController,
                          decoration: const InputDecoration(
                            label: Text(
                              "Enter Your Password",
                              style: TextStyle(color: Colors.black),
                            ),
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text("Don't You have an account ?"),
                          ),
                          Expanded(
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => SignupScreen(),
                                      ),
                                    );
                                  },
                                  child: const Text(
                                    'Sign Up',
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Card(
                          elevation: 10,
                          child: InkWell(
                            onTap: () {
                              LoginAccount();
                            },
                            child: Container(
                              height: 50,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Center(
                                child: Text(
                                  'Login',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
