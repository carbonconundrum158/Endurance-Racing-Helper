import 'package:flutter/material.dart';
import 'package:enduranceapp/screens/homescreen.dart';
import 'package:enduranceapp/screens/eventscreen.dart';
import 'package:enduranceapp/screens/driverscreen.dart';

class TeamScreen extends StatefulWidget {
  const TeamScreen({super.key});

  @override
  State<TeamScreen> createState() => _TeamScreenState();
}

class _TeamScreenState extends State<TeamScreen> {
  bool isExpanded = false;

  // Sample team data
  final List<Map<String, String>> teams = [
    {'name': 'Red Bull Racing', 'country': 'Austria'},
    {'name': 'Mercedes AMG', 'country': 'Germany'},
    {'name': 'Ferrari', 'country': 'Italy'},
    {'name': 'McLaren', 'country': 'United Kingdom'},
    {'name': 'Aston Martin', 'country': 'United Kingdom'},
  ];

  String? teamName;
  String? country;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 108, 108, 108),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: isExpanded ? MediaQuery.of(context).size.width * 0.5 : 60,
            ),
            child: Column(
              children: [
                const SizedBox(height: 40),
                const Center(
                  child: Text(
                    'Team Screen Content',
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                ),
                const SizedBox(height: 20),
                // Teams table
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey[300]!),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: SingleChildScrollView(
                      child: DataTable(
                        headingRowColor: MaterialStateProperty.all(Colors.grey[100]),
                        columns: const [
                          DataColumn(label: Text('Team Name')),
                          DataColumn(label: Text('Country')),
                        ],
                        rows: teams.map((team) => DataRow(
                          cells: [
                            DataCell(Text(team['name']!)),
                            DataCell(Text(team['country']!)),
                          ],
                        )).toList(),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // Text fields for creating a team
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      TextField(
                        onChanged: (value) {
                          teamName = value; // Capture team name input
                        },
                        decoration: InputDecoration(
                          labelText: 'Team Name',
                          border: OutlineInputBorder(),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        onChanged: (value) {
                          country = value; // Capture country input
                        },
                        decoration: InputDecoration(
                          labelText: 'Country',
                          border: OutlineInputBorder(),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          // Handle team creation logic here
                          if (teamName != null && country != null) {
                            // Add the new team to the list
                            setState(() {
                              teams.add({'name': teamName!, 'country': country!});
                              teamName = null; // Reset input
                              country = null; // Reset input
                            });
                            print('Team Created: $teamName from $country');
                          } else {
                            print('Please enter both team name and country.');
                          }
                        },
                        child: const Text('Create Team'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Sidebar
          GestureDetector(
            onHorizontalDragEnd: (details) {
              if (details.primaryVelocity! > 0) {
                setState(() {
                  isExpanded = true;
                });
              } else if (details.primaryVelocity! < 0) {
                setState(() {
                  isExpanded = false;
                });
              }
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: isExpanded ? MediaQuery.of(context).size.width * 0.5 : 60,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 52, 57, 61),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: [
                  // Menu button (only for expanding)
                  if (!isExpanded)
                    IconButton(
                      icon: const Icon(
                        Icons.menu,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          isExpanded = true;
                        });
                      },
                    ),
                  // Navigation buttons (only show when expanded)
                  if (isExpanded) ...[
                    const SizedBox(height: 20),
                    TextButton.icon(
                      icon: const Icon(
                        Icons.home,
                        color: Colors.white,
                      ),
                      label: const Text(
                        'Home',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 20),
                    TextButton.icon(
                      icon: const Icon(
                        Icons.event,
                        color: Colors.white,
                      ),
                      label: const Text(
                        'Events',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const EventScreen(),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 20),
                    TextButton.icon(
                      icon: const Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                      label: const Text(
                        'Drivers',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const DriverScreen(),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 20),
                    TextButton.icon(
                      icon: const Icon(
                        Icons.group,
                        color: Colors.white,
                      ),
                      label: const Text(
                        'Teams',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      onPressed: () {
                        // Stay on the TeamScreen
                      },
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
