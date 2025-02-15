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
                    radius: 180,
                    backgroundImage: AssetImage('assets/profile.jpeg'),
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
                    'IoT Engineer |  Military Service exempted',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      'I am an IoT Engineer passionate about developing innovative solutions that bridge the gap between hardware and software',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  SizedBox(height: 16),
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
  final List<Map<String, String>> projects = [
    {
      'title': 'Tracking Solar Panels System with BMS',
      'description':
      'Uses an ESP32 to control servo motors for solar panel alignment based on light sensors. Manages battery charging via BMS, with real-time monitoring in a Flutter app.',
      'url': ''
    },
    {
      'title': 'Energy Harvesting for Floating Smart City',
      'description': 'Designed an IoT-based energy harvesting system for smart floating cities.',
      'url': 'https://www.linkedin.com/posts/belalakram_energyharvestingforsmartfloatingcity-sustainability-activity-7228609509936529408-0brx?utm_source=share&utm_medium=member_desktop&rcm=ACoAAD3jCwYBQZMWMA8w9yFpihpbej2qfCHag-g'
    },
    {
      'title': 'Boxer App',
      'description': 'A fitness app that uses AI-powered coaching for boxing workouts.',
      'url': 'https://www.linkedin.com/posts/belalakram_aepaesaevaetaexaesaesaev-boxerapp-fitness-activity-7240751981986779136-ezf0?utm_source=share&utm_medium=member_desktop&rcm=ACoAAD3jCwYBQZMWMA8w9yFpihpbej2qfCHag-g'
    },
    {
      'title': 'Muslim App',
      'description': 'A Flutter-based Islamic app offering prayer times, Quran, and more.',
      'url': 'https://www.linkedin.com/posts/belalakram_aepaesaevaetaexaesaesaev-flutter-appdevelopment-activity-7239709143236792320-BZM0?utm_source=share&utm_medium=member_desktop&rcm=ACoAAD3jCwYBQZMWMA8w9yFpihpbej2qfCHag-g'
    },
    {
      'title': 'Chat App',
      'description': 'A real-time chat application using Flutter and Firebase.',
      'url': 'https://github.com/belalakram/chat_app'
    },
    {
      'title': 'Nike Product & Store Insights – Power BI Dashboard',
      'description': 'Built a Power BI dashboard analyzing Nike product trends and store insights.',
      'url': 'https://www.linkedin.com/posts/belalakram_powerbi-nikedashboard-datavisualization-activity-7292618425242210304-4agg?utm_source=share&utm_medium=member_desktop&rcm=ACoAAD3jCwYBQZMWMA8w9yFpihpbej2qfCHag-g'
    },
    {
      'title': 'Employee Attrition Monitoring at Atlas Labs – Power BI Dashboard',
      'description': 'Developed an HR analytics dashboard to monitor employee attrition trends.',
      'url': 'https://www.linkedin.com/posts/belalakram_dataanalytics-hranalytics-employeeattrition-activity-7290060556491788290-FkjC?utm_source=share&utm_medium=member_desktop&rcm=ACoAAD3jCwYBQZMWMA8w9yFpihpbej2qfCHag-g'
    },
  ];

  void _launchURL(String url) async {
    if (url.isNotEmpty) {
      Uri uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        throw 'Could not launch $url';
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Projects')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: projects.length,
          itemBuilder: (context, index) {
            final project = projects[index];
            return Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              margin: EdgeInsets.symmetric(vertical: 8.0),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.arrow_circle_right_outlined, color: Colors.blueAccent),
                        SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            project['title']!,
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Text(
                      project['description']!,
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    if (project['url']!.isNotEmpty)
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton.icon(
                          onPressed: () => _launchURL(project['url']!),
                          icon: Icon(Icons.link, color: Colors.blue),
                          label: Text(
                            'Read More',
                            style: TextStyle(
                              color: Colors.blue,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            );
          },
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
        child: ListView(
          children: [
            // University Degree Card
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              margin: EdgeInsets.symmetric(vertical: 8.0),
              child: ListTile(
                leading: Icon(Icons.school, color: Colors.blueAccent), // Graduation cap icon
                title: Text(
                  "Bachelor's in Electrical Engineering",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Electronics and Communication"),
                    Text("Future University in Egypt (Sep 2019 – Oct 2024)", style: TextStyle(color: Colors.grey[700])),
                    SizedBox(height: 5),
                    Text("📊 CGPA: 3.25/4.0 (Very Good)", style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),

            // Graduation Project Card
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              margin: EdgeInsets.symmetric(vertical: 8.0),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.lightbulb, color: Colors.orangeAccent),
                        SizedBox(width: 8),
                        Text("Graduation Project", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    SizedBox(height: 5),
                    Text("🔹 Energy Harvesting for Floating Smart City", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                    SizedBox(height: 5),
                    Text("📝 Grade: Excellent", style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(height: 10),
                    Text(
                      "Led a team of five to design an IoT-based energy management system optimizing energy harvesting and distribution in a floating smart city. "
                          "Implemented Proteus for hardware simulation, Flutter and Firebase for mobile app development, and Jetson Nano for AI-based edge computing. "
                          "Integrated sensors, servo motors, and PCA9685 controllers for optimized hardware control. Utilized Blender for 3D modeling and Python for coding.",
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CertificationsPage extends StatelessWidget {
  // List of certifications with image paths
  final List<Map<String, String>> certifications = [
    {
      'title': 'IoT & AI Track – NTI',
      'image': 'assets/iot.png', // Replace with your image path
    },
    {
      'title': 'Python Programming – Cisco & NTI',
      'image': 'assets/python.png', // Replace with your image path
    },
    {
      'title': 'Flutter Diploma – Black Horse',
      'image': 'assets/flutter.png', // Replace with your image path
    },
    {
      'title': 'Problem Solving – INSTANT',
      'image': 'assets/problem.jpeg', // Replace with your image path
    },
    {
      'title': 'Git – Simplilearn',
      'image': 'assets/git.png', // Replace with your image path
    },
    {
      'title': 'Data Fundamentals Challenge',
      'image': 'assets/data.png', // Replace with your image path
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Certifications')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: certifications.length,
        itemBuilder: (context, index) {
          final certification = certifications[index];
          return Card(
            elevation: 4,
            margin: const EdgeInsets.only(bottom: 16),
            child: ListTile(
              leading: Image.asset(
                certification['image']!,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
              title: Text(
                certification['title']!,
                style: TextStyle(fontSize: 16),
              ),
              onTap: () {
                // Add functionality to view the certificate in full screen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CertificateDetailPage(
                      title: certification['title']!,
                      image: certification['image']!,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

// Certificate Detail Page to show the full image
class CertificateDetailPage extends StatelessWidget {
  final String title;
  final String image;

  const CertificateDetailPage({required this.title, required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Image.asset(image),
      ),
    );
  }
}
class SkillsPage extends StatelessWidget {
  final List<String> skills = [
    'Flutter Development',
    'Embedded Systems',
    'IoT Solutions',
    'AI and Machine Learning',
    'Mobile App Development',
    'Excel',
    'Power BI',
    'Data Analysis',
    'Blender',
    'Autodesk Fusion 360',
    'Problem Solving',
    'Team Work',
    'Git',
    'Bash',
    'Python',
    'Dart',
    'Printed Circuit Board',
    'Firebase',
    'Proteus',
    'Circuit Maker',
    'C',
    'C++',
    'Communications',
    'Electronics',
    'Matlab',
    'Advanced Design System (ADS)',
    'Dashboard',
    'PowerPoint',
    'Word',
    'SCAPS (A solar cell capacitance simulator)',
    'Packet Tracer',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Skills')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Wrap(
          spacing: 8.0, // Horizontal spacing between chips
          runSpacing: 8.0, // Vertical spacing between chips
          children: skills.map((skill) {
            return Chip(
              label: Text(skill),
              backgroundColor: Colors.blue[50],
            );
          }).toList(),
        ),
      ),
    );
  }
}


class ExperiencePage extends StatelessWidget {
  final List<Map<String, String>> experiences = [
    {
      "title": "Teaching Assistant",
      "company": "Future University in Egypt",
      "type": "Full-time",
      "duration": "Jan 2025 - Present ",
      "location": "On-site"
    },
    {
      "title": "Data Analyst",
      "company": "Digital Egypt Pioneers Initiative - DEPI",
      "type": "Internship",
      "duration": "Oct 2024 - Present ",
      "location": "Hybrid",
      "skills": "Microsoft Excel, Power BI, SQL, Statistical Analysis, Azure"
    },
    {
      "title": "Data Analyst",
      "company": "Freelance",
      "duration": "Dec 2024 - Present ",
      "location": "Remote",
      "skills": "SQL, Power BI, Data Analysis"
    },
    {
      "title": "IoT Engineer",
      "company": "Freelance",
      "duration": "Jan 2022 - Present ",
      "location": "Hybrid",
      "skills": "IoT, AI, Embedded Systems, Flutter, Firebase, GCP"
    },
    {
      "title": "Mobile Application Developer (Flutter)",
      "company": "Mentor Academy Learning",
      "type": "Internship",
      "duration": "Sep 2024 - Jan 2025 · 5 mos",
      "location": "Hybrid",
      "skills": "Flutter, Firebase, Dart"
    },
    {
      "title": "Mobile Application Developer Intern",
      "company": "CodeAlpha",
      "type": "Internship",
      "duration": "Aug 2024 - Oct 2024 · 3 mos",
      "location": "Remote",
      "skills": "Flutter, Firebase, Mobile App Development"
    },
    {
      "title": "Web Development Intern",
      "company": "NeuronetiX",
      "type": "Internship",
      "duration": "Aug 2024 - Oct 2024 · 3 mos",
      "location": "Remote",
      "skills": "Web Development, Frontend Development"
    },
    {
      "title": "Artificial Intelligence and IoT Intern",
      "company": "National Telecommunication Institute (NTI)",
      "type": "Internship",
      "duration": "Apr 2023 - Jul 2023 · 4 mos",
      "location": "Hybrid",
      "skills": "Artificial Intelligence (AI), Internet of Things (IoT)"
    },
    {
      "title": "Sales Engineer",
      "company": "Dr. Akram Al-Hajj Pharmacy",
      "duration": "Aug 2020 - Jan 2025 · 4 yrs 6 mos",
      "location": "On-site",
      "skills": "Inventory Management, Customer Satisfaction"
    },
  ];

  final List<String> certifications = [
    "PCAP - Certified Associate in Python Programming (Cisco)",
    "Certification in Mobile Application Development (CodeAlpha)",
    "Certification in Web Development (NeuronetiX)",
    "Certification in AI & IoT (National Telecommunication Institute)"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Experience')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text("Work Experience", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            ...experiences.map((experience) => Card(
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              child: ListTile(
                title: Text(experience["title"]!, style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(experience["company"]!),
                    Text(experience["duration"]!),
                    if (experience.containsKey("location")) Text("📍 ${experience["location"]!}"),
                    if (experience.containsKey("skills")) Text("🛠 Skills: ${experience["skills"]!}"),
                  ],
                ),
              ),
            )),
            SizedBox(height: 20),
            Text("Certifications", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            ...certifications.map((cert) => Card(
              margin: const EdgeInsets.symmetric(vertical: 4.0),
              child: ListTile(
                leading: Icon(Icons.verified, color: Colors.green),
                title: Text(cert),
              ),
            )),
          ],
        ),
      ),
    );
  }
}

class AchievementsPage extends StatelessWidget {
  final List<String> achievements = [
    "Led IoT-based energy management project",
    "Published research paper on IoT applications",
    "Won MIE competition for innovative projects",
    "Received financial support from ITIDA to develop and implement this project",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Achievements')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: achievements.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 3,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              child: ListTile(
                leading: Icon(Icons.emoji_events, color: Colors.amber), // Trophy icon
                title: Text(
                  achievements[index],
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}






class VolunteerWorkPage extends StatelessWidget {
  final List<Map<String, dynamic>> volunteerWork = [
    {
      "title": "Volunteer Staff",
      "organization": "Future University in Egypt",
      "duration": "Sep 2019 - Mar 2024 · 4 yrs 7 mos",
      "category": "Social Services",
      "description":
      "Visited orphanages and rural areas in Upper Egypt to distribute meals and essential supplies. Also helped organize Mother's Day celebrations.",
      "links": [
        {"label": "Dar Al Safa", "url": "https://www.youtube.com/watch?v=5bRhwRe0Pg4"},
        {"label": "Dar Al-Iman", "url": "https://www.youtube.com/watch?v=LPhNh0kalwY"},
        {"label": "Dar Al Yasmina", "url": "https://www.youtube.com/watch?v=IUej_cmwR7A"},
        {"label": "Monshaat Al Omaraa, Ehnasia", "url": "https://www.youtube.com/watch?v=c8RDzaJhM4Q"},
        {"label": "Al-Deir Village", "url": "https://www.youtube.com/watch?v=fdpVykQWoFQ"}
      ]
    },
    {
      "title": "Volunteer Staff",
      "organization": "IEEE FUE SB",
      "duration": "Sep 2019 - Jul 2024 · 4 yrs 11 mos",
      "category": "Science and Technology",
      "description":
      "Organized networking events and workshops for professionals. Encouraged colleagues to join IEEE for access to global resources and connections.",
      "links": [
        {"label": "IEEE Student Branch Award", "url": "https://www.linkedin.com/feed/update/urn:li:activity:7173343502100115457/"},
        {"label": "IEEE Community", "url": "https://www.linkedin.com/feed/update/urn:li:activity:7105861008912445440/"}
      ]
    },
    {
      "title": "Volunteer Staff",
      "organization": "GDSC - Future University in Egypt",
      "duration": "Sep 2019 - Jun 2024 · 4 yrs 10 mos",
      "category": "Science and Technology",
      "description":
      "Planned coding workshops, tech talks, and community service projects to engage students in software development. Helped foster a collaborative learning environment.",
      "links": [
        {"label": "GDSC Community (Roya Event)", "url": "https://www.linkedin.com/feed/update/urn:li:activity:7128642589070680064/"}
      ]
    },
  ];

  // Function to open URLs
  void _launchURL(String url) async {
    Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw "Could not launch $url";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Volunteering')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text("Volunteer Experience", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            ...volunteerWork.map((volunteer) => Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(volunteer["title"]!, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                    Text(volunteer["organization"]!, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                    Text(volunteer["duration"]!, style: TextStyle(color: Colors.grey[600])),
                    Text("📂 ${volunteer["category"]!}", style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic)),
                    SizedBox(height: 5),
                    Text(
                      volunteer["description"]!,
                      style: TextStyle(color: Colors.grey[700]),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 10),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: (volunteer["links"] as List<dynamic>).map<Widget>((link) {
                        return ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            backgroundColor: Colors.blueAccent,
                          ),
                          icon: Icon(Icons.link, color: Colors.white),
                          label: Text(link["label"]!, style: TextStyle(color: Colors.white)),
                          onPressed: () => _launchURL(link["url"]!),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            )),
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