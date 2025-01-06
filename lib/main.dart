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
            child: ListView(
              children: [
                SidebarButton('My Projects', ProjectsPage()),
                SidebarButton('Education', EducationPage()),
                SidebarButton('Certifications', CertificationsPage()),
                SidebarButton('Skills', SkillsPage()),
                SidebarButton('Experience', ExperiencePage()),
                SidebarButton('Achievements', AchievementsPage()),
                SidebarButton('Publications', PublicationsPage()),
                SidebarButton('Workshops', WorkshopsPage()),
                SidebarButton('Volunteer Work', VolunteerWorkPage()),
                SidebarButton('Contact Me', ContactPage()),
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

class SidebarButton extends StatelessWidget {
  final String title;
  final Widget page;

  SidebarButton(this.title, this.page);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => page),
          );
        },
        child: Text(title),
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
        child: Text(
          '1. Tracking Solar Panels System with BMS\n'
              '2. Password-Based Door Locking System\n'
              '3. Energy Consumption Monitoring App\n'
              '4. Smart Home Automation System\n'
              '5. Remote Patient Monitoring System\n'
              '6. Inventory Management App\n'
              '7. Smart Agricultural System\n'
              '8. Intelligent Traffic Management\n'
              '9. E-Commerce Recommendation Engine\n'
              '10. IoT-based Weather Station\n',
          style: TextStyle(fontSize: 16),
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
        child: Text(
          'Bachelor\'s in Electrical Engineering – Electronics and Communication\n'
              'Future University in Egypt (Sep 2019 – Oct 2024)\n'
              'CGPA: 3.25/4.0 (Very Good)\n\n'
              'Graduation Project: Energy Harvesting for Floating Smart City\n'
              'Grade: Excellent\n',
          style: TextStyle(fontSize: 16),
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
        child: Text(
          '1. IoT & AI Track – NTI\n'
              '2. Python Programming – Cisco & NTI\n'
              '3. Flutter Diploma – Black Horse\n'
              '4. Problem Solving – INSTANT\n'
              '5. Git – Simplilearn\n',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}

class SkillsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Skills')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          '1. Flutter Development\n'
              '2. Embedded Systems\n'
              '3. IoT Solutions\n'
              '4. AI and Machine Learning\n'
              '5. Mobile App Development\n',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}

class ExperiencePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Experience')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          '1. IoT Engineer Intern – NTI\n'
              '2. Flutter Developer Intern – CodeAlpha\n'
              '3. ReactJS Web Development Intern – NeuronetiX\n',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}

class AchievementsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Achievements')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          '1. Led IoT-based energy management project\n'
              '2. Published research paper on IoT applications\n'
              '3. Won MIE competition for innovative projects\n',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}

class PublicationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Publications')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          '1. IoT for Smart Cities – IEEE Conference\n'
              '2. AI in Healthcare Systems – Journal of Engineering\n',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}

class WorkshopsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Workshops')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          '1. IoT and Embedded Systems Workshop\n'
              '2. AI for Beginners Workshop\n',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}

class VolunteerWorkPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Volunteer Work')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          '1. STEM Outreach Programs\n'
              '2. Community Tech Training Sessions\n',
          style: TextStyle(fontSize: 16),
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
            Text(
              'Email: Belal.Akram502@gmail.com\n'
                  'Phone: 01021491813\n'
                  'Location: Banha, Egypt\n',
              style: TextStyle(fontSize: 16),
            ),
            ElevatedButton(
              onPressed: () => _launchURL('https://linkedin.com/in/belalakram'),
              child: Text('Visit LinkedIn'),
            ),
            SizedBox(height: 10),
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
