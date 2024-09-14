// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

import 'user.dart';

class DashboardScreen extends StatelessWidget {
  final AppUser? user;

  const DashboardScreen({super.key, required this.user});

  Future<Map<String, dynamic>> fetchUserData(String userId) async {
    DatabaseReference userRef =
        FirebaseDatabase.instance.reference().child('users').child(userId);
    DataSnapshot snapshot = (await userRef.once()) as DataSnapshot;
    return snapshot.value as Map<String, dynamic>;
  }

  Future<List<Map<String, dynamic>>> fetchUserPlants(String userId) async {
    DatabaseReference userPlantsRef = FirebaseDatabase.instance
        .reference()
        .child('users')
        .child(userId)
        .child('plants');
    DataSnapshot snapshot = (await userPlantsRef.once()) as DataSnapshot;
    Map<String, dynamic> plantsData = snapshot.value as Map<String, dynamic>;

    List<Map<String, dynamic>> plants = [];
    for (String plantId in plantsData.keys) {
      DatabaseReference plantRef =
          FirebaseDatabase.instance.reference().child('plants').child(plantId);
      DataSnapshot plantSnapshot = (await plantRef.once()) as DataSnapshot;
      plants.add(plantSnapshot.value as Map<String, dynamic>);
    }
    return plants;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
      future: fetchUserData(user!.uid),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          final userData = snapshot.data!;
          return Scaffold(
            appBar: AppBar(
              title: Text('Welcome ${userData['name']}'),
            ),
            body: FutureBuilder<List<Map<String, dynamic>>>(
              future: fetchUserPlants(user!.uid),
              builder: (context, plantsSnapshot) {
                if (plantsSnapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (plantsSnapshot.hasError) {
                  return Text('Error: ${plantsSnapshot.error}');
                } else {
                  final plants = plantsSnapshot.data!;
                  return ListView.builder(
                    itemCount: plants.length,
                    itemBuilder: (context, index) {
                      final plant = plants[index];
                      return ListTile(
                        title: Text(plant['name']),
                        subtitle: Text(plant['species']),
                      );
                    },
                  );
                }
              },
            ),
          );
        }
      },
    );
  }
}
