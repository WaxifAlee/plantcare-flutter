import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'appcolors.dart';

class PasswordResetScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();

  void _resetPassword(BuildContext context) async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailController.text);
      // Navigate to password reset success screen
      Navigator.pushReplacementNamed(context, '/password_reset_success');
    } catch (e) {
      // Handle password reset error
      print("Error sending password reset email: $e");
      // Show an error message to the user
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content:
              Text("Failed to send password reset email. Please try again."),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Password Reset",
          style: TextStyle(color: AppColors.kWhite),
        ),
        backgroundColor: Color(0xFF123524),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: "Email",
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.kPrimary),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _resetPassword(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.kPrimary,
              ),
              child: Text(
                "Reset Password",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
