import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Doctor Consultation App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: const Color.fromARGB(255, 140, 188, 222), appBar: AppBar(title: Text("Welcome", 
    style: TextStyle(color: const Color.fromARGB(255, 236, 238, 241))), backgroundColor: const Color.fromARGB(255, 71, 109, 196), elevation: 0, iconTheme: IconThemeData(color: Colors.black),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Let’s consult the best doctor",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            // Placeholder for character illustration
            Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                image: DecorationImage(
                  image: AssetImage('images/login1.png'), // Replace with your image
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DoctorSearchScreen()),
                );
              },
              child: Text("Go"),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DoctorSearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Find a Doctor")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search for doctors...",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          // Categories
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CategoryIcon(icon: Icons.favorite, label: "Heart"),
                CategoryIcon(icon: Icons.health_and_safety, label: "Health"),
                CategoryIcon(icon: Icons.medical_services, label: "Dental"),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                CustomCard(
                  name: "Dr. Joseph Church",
                  specialty: "Dental Specialty",
                  rating: 4.5,
                  experience: "5 years",
                  imageUrl: 'images/Doc1.png', // Replace with your image
                ),
                CustomCard(
                  name: "Dr. David Bryant",
                  specialty: "Heart Specialist",
                  rating: 4.7,
                  experience: "10 years",
                  imageUrl: 'images/Doc1.png', // Replace with your image
                ),
                CustomCard(
                  name: "Dr. Robert Adler",
                  specialty: "General Practitioner",
                  rating: 4.2,
                  experience: "8 years",
                  imageUrl: 'images/Doc1.png', // Replace with your image
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryIcon extends StatelessWidget {
  final IconData icon;
  final String label;

  CategoryIcon({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 40),
        SizedBox(height: 5),
        Text(label),
      ],
    );
  }
}

class CustomCard extends StatelessWidget {
  final String name;
  final String specialty;
  final double rating;
  final String experience;
  final String imageUrl;

  CustomCard({
    required this.name,
    required this.specialty,
    required this.rating,
    required this.experience,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.all(16),
        leading: CircleAvatar(
          backgroundImage: AssetImage('images/Doc1.png'), // Replace with your image
        ),
        title: Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(specialty),
            Text("Rating: $rating"),
            Text("Experience: $experience"),
          ],
        ),
        trailing: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DoctorProfileScreen(name: name, specialty: specialty, rating: rating, experience: experience)),
            );
          },
          child: Text("View Profile"),
        ),
      ),
    );
  }
}

class DoctorProfileScreen extends StatelessWidget {
  final String name;
  final String specialty;
  final double rating;
  final String experience;

  DoctorProfileScreen({required this.name, required this.specialty, required this.rating, required this.experience});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('images/Doc1.png'), // Replace with your image
            ),
            Text(name, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Text(specialty),
            Text("Rating: $rating"),
            Text("Experience: $experience"),
            SizedBox(height: 20),
            Text("Availability:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            // Example schedule
            ListTile(title: Text("10:00 AM - 11:00 AM")),
            ListTile(title: Text("11:00 AM - 12:00 PM")),
            ElevatedButton(
              onPressed: () {
                // Book appointment logic
              },
              child: Text("Book Appointment"),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                backgroundColor: const Color.fromARGB(255, 172, 186, 218),
                alignment: Alignment.bottomCenter
                
              ),
            ),
          ],
        ),
      ),
    );
  }
}