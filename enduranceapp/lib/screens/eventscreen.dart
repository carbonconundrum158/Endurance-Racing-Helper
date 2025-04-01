import 'package:flutter/material.dart';
import 'package:enduranceapp/screens/homescreen.dart';
import 'package:enduranceapp/screens/driverscreen.dart';
import 'package:enduranceapp/screens/teamscreen.dart';

class EventScreen extends StatefulWidget {
  const EventScreen({super.key});

  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  bool isExpanded = false;

  // Sample event data
  final List<Map<String, String>> events = [
    {'event': 'Grand Prix of Monaco', 'date': 'May 28, 2023'},
    {'event': 'Canadian Grand Prix', 'date': 'June 11, 2023'},
    {'event': 'British Grand Prix', 'date': 'July 2, 2023'},
    {'event': 'Hungarian Grand Prix', 'date': 'July 30, 2023'},
    {'event': 'Belgian Grand Prix', 'date': 'August 27, 2023'},
  ];

  // Sample team data for dropdown
  final List<String> teams = [
    'Red Bull Racing',
    'Mercedes AMG',
    'Ferrari',
    'McLaren',
    'Aston Martin',
  ];

  String? selectedTeam;

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
                    'Event Screen Content',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 20),
                // Upcoming events table
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
                          DataColumn(label: Text('Event')),
                          DataColumn(label: Text('Date')),
                        ],
                        rows: events.map((event) => DataRow(
                          cells: [
                            DataCell(Text(event['event']!)),
                            DataCell(Text(event['date']!)),
                          ],
                        )).toList(),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // Text fields and dropdown
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Event Name',
                          border: OutlineInputBorder(),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Event Date',
                          border: OutlineInputBorder(),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Location',
                          border: OutlineInputBorder(),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Description',
                          border: OutlineInputBorder(),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 10),
                      DropdownButtonFormField<String>(
                        value: selectedTeam,
                        hint: const Text('Select a Team'),
                        items: teams.map((team) {
                          return DropdownMenuItem(
                            value: team,
                            child: Text(team),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedTeam = value;
                          });
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          // Handle event creation logic here
                          // For now, just print the selected values
                          print('Event Created: ${selectedTeam}');
                        },
                        child: const Text('Create Event'),
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
                        // Stay on the EventScreen
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const TeamScreen(),
                          ),
                        );
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
