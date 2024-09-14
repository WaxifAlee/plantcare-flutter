import 'package:flutter/material.dart';
import 'plant.dart';
import 'plant_detail_screen.dart';

class PlantsScreen extends StatelessWidget {
  final List<Plant> plants;

  PlantsScreen({required this.plants});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Plants"),
        backgroundColor: Color(0xFF123524), // Phthalo green color
        foregroundColor: Color(0xFFFFFFFF),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: plants.length,
          itemBuilder: (context, index) {
            final plant = plants[index];
            return Card(
              color: Colors.white, // White background for the card
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              margin: EdgeInsets.symmetric(vertical: 10),
              child: ListTile(
                contentPadding: EdgeInsets.all(10),
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    plant.imageUrl,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text(
                  plant.name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF123524),
                  ),
                ),
                subtitle: Text(
                  plant.description.substring(0, 80) + '...',
                  style: TextStyle(
                    fontSize: 14,
                    color: const Color(0xFF123524).withOpacity(0.6),
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PlantDetailScreen(plant: plant),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
