import 'package:flutter/material.dart';
import '../widgets/appbar.dart';
import '../widgets/footer.dart';
import '../widgets/drawer.dart';

class CareersPage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  CareersPage({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> jobList = [
    {
      "title": "Software Developer",
      "description": "Develop amazing software.",
      "skills": ["Dart", "Flutter", "Firebase"],
    },
    // Add more jobs as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: CustomAppBar(
          scaffoldKey: _scaffoldKey,
          // Assuming CustomAppBar handles navigation and appearance based on the current theme
        ),
      ),
      drawer: const CustomDrawer(), // Assuming CustomDrawer is correctly implemented
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children:
                    jobList.map((job) => buildJobCard(context, job)).toList(),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Footer()
        ],
      ),
    );
  }

  Widget buildJobCard(BuildContext context, Map<String, dynamic> job) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(job["title"], style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 10),
            Text(job["description"]),
            const SizedBox(height: 10),
            Text("Skills Required:",
                style: Theme.of(context).textTheme.titleMedium),
            Wrap(
                children: job["skills"]
                    .map<Widget>((skill) => Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Chip(label: Text(skill)),
                        ))
                    .toList()),
            
          ],
        ),
      ),
    );
  }
}
