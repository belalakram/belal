import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Belal Akram Portfolio',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Belal Akram Portfolio'),
        centerTitle: true,
      ),
      body: Row(
        children: [
          // Left Sidebar with buttons
          Container(
            width: 200,
            color: Colors.blue[50],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProjectsPage()),
                    );
                  },
                  child: Text('My Projects'),
                ),
                SizedBox(height: 10,),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => EducationPage()),
                    );
                  },
                  child: Text('Education'),
                ),
                SizedBox(height: 10,),

                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CertificationsPage()),
                    );
                  },
                  child: Text('Certifications'),
                ),
                SizedBox(height: 10,),

                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ContactPage()),
                    );
                  },
                  child: Text('Contact Me'),
                ),
              ],
            ),
          ),
          // Main Content Area
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 50),
                    child: Text(
                      'Welcome to My Portfolio',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage('assets/profile.png'),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Belal Akram Mohamed Alhajj',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'IoT Engineer | Embedded Systems Developer',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      'I am an IoT Engineer passionate about developing innovative solutions that bridge the gap between hardware and software...',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16),
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


class ProjectsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Projects')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('1. **Tracking Solar Panels System with BMS**\n'
                '• Designed an IoT-based solar panel tracking system with a mobile app for real-time monitoring and battery management.\n'
                '• Tools: ESP32, Proteus, Flutter\n\n'
                '2. **Password-Based Door Locking System**\n'
                '• Developed a microcontroller-based embedded system for secure door access control using passwords.\n\n'
                '3. **Mobile Apps with IoT Integration**\n'
                '• Built an energy consumption monitoring app for smart cities using Flutter and Firebase integration with IoT sensors.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

class EducationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Education')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Bachelor\'s in Electrical Engineering – Electronics and Communication\n'
                  'Future University in Egypt (Sep 2019 – Oct 2024)\n'
                  'CGPA: 3.25/4.0 (Very Good)\n\n'
                  'Graduation Project: Energy Harvesting for Floating Smart City\n'
                  '• Led a team of five to design and implement an IoT-based energy management system for a floating smart city.\n'
                  '• Supervisors: Associate Prof. Ahmed Saeed, Dr. Mostafa Salah\n'
                  '• Grade: Excellent\n\n'
                  '• Tools: Jetson Nano, Proteus, Flutter, Firebase\n'
                  '• Participated in MIE competition and 18th Undergraduate Research Forum.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

class CertificationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Certifications')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('• IoT & AI Track – NTI (Apr 2023 - Jul 2023)\n'
                '• Python Programming – Cisco & NTI (Aug 2023)\n'
                '• Flutter Diploma – Black Horse (Nov 2023 – Feb 2024)\n'
                '• Problem Solving – INSTANT (Nov 2023)\n'
                '• Git – Simplilearn (Aug 2024)',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

class ContactPage extends StatelessWidget {
  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Contact Me')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Email: Belal.Akram502@gmail.com\n'
                'Phone: 01021491813\n'
                'Location: Banha, Egypt\n\n',
              style: TextStyle(fontSize: 16),
            ),
            ElevatedButton(
              onPressed: () => _launchURL('https://linkedin.com/in/belalakram'),
              child: Text('Visit LinkedIn'),
            ),
            SizedBox(height: 10,),

            ElevatedButton(
              onPressed: () => _launchURL('https://github.com/belalakram'),
              child: Text('Visit GitHub'),
            ),
          ],
        ),
      ),
    );
  }
}
