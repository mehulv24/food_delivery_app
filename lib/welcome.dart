import 'package:flutter/material.dart';

class MyWelcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/welcome.jpeg'), // Add your background image here
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.3), // Dark overlay
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "SNACKIT",
                    style: TextStyle(
                      fontSize: 48,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Welcome",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                     "Craving something delicious? We’re just a tap away!",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'login');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFB2EDEC),
                      minimumSize: Size(double.infinity, 50),
                    ),
                    child: Text("Login",
                    style:TextStyle(fontSize:25)),
                  ),
                  SizedBox(height: 10),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'register');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFB2EDEC),
                      minimumSize: Size(double.infinity, 50),
                    ),
                    child: Text(
                      "Sign up",
                        style:TextStyle(fontSize:25)
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
