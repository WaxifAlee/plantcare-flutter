import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plantpal/firebase_options.dart';
import 'package:plantpal/password_reset_screen.dart';
import 'package:plantpal/password_reset_success.dart';
import 'package:plantpal/signin.dart';
import 'package:plantpal/signup.dart';
import 'package:plantpal/appcolors.dart';
import 'plants_list_screen.dart';
import 'plant.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PlantPal',
      theme: ThemeData(
        primaryColor: const Color(0xFF123524),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const LandingPage(),
      routes: {
        '/signin': (context) => const SignInScreen(),
        '/signup': (context) => const SignUpScreen(),
        '/password_reset': (context) => PasswordResetScreen(),
        '/password_reset_success': (context) => PasswordResetSuccessScreen(),
        '/plants_list': (context) => PlantsScreen(plants: plantsList),
      },
    );
  }
}

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('../assets/landingScreenBg.jpg'),
            opacity: 0.6,
            fit: BoxFit.cover),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(
              height: 90,
            ),
            const Icon(Icons.forest, size: 80, color: Color(0xFF123524)),
            const Text(
              'PlantPal',
              style: TextStyle(
                  color: Color(0xFF123524),
                  fontSize: 48,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                "Taking Care Of Your Plant Is Essential For\nThem To Grow and Have a Healthier Longer Lifespan.\nPlantPal will Assist You By Reminding You To Water\nYour Plants on Regular Basis, Lookup for Harmful\nWeed Growing Around and MUCH MORE.",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF123524),
                    fontSize: 14),
              ),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/signin');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.kPrimary,
                    minimumSize: const Size(180, 58),
                    foregroundColor: AppColors.kWhite,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  child: const Text('Sign In'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text('or')]),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  child: Text(
                    'Register a new account',
                    style: GoogleFonts.poppins(
                            fontSize: 12, fontWeight: FontWeight.w500)
                        .copyWith(color: AppColors.kPrimary),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/signup');
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
