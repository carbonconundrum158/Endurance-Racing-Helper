import 'package:flutter/material.dart';
import 'package:enduranceapp/screens/eventscreen.dart';
import 'package:enduranceapp/screens/driverscreen.dart';
import 'package:enduranceapp/screens/teamscreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isExpanded = false;

  // Sample team data
  final List<Map<String, String>> teams = [
    {'name': 'Red Bull Racing', 'country': 'Austria'},
    {'name': 'Mercedes AMG', 'country': 'Germany'},
    {'name': 'Ferrari', 'country': 'Italy'},
    {'name': 'McLaren', 'country': 'UK'},
    {'name': 'Aston Martin', 'country': 'UK'},
  ];

  // Sample driver data
  final List<Map<String, String>> drivers = [
    {'name': 'Max Verstappen', 'number': '1'},
    {'name': 'Lewis Hamilton', 'number': '44'},
    {'name': 'Charles Leclerc', 'number': '16'},
    {'name': 'Lando Norris', 'number': '4'},
    {'name': 'Fernando Alonso', 'number': '14'},
  ];

  // Sample upcoming events data
  final List<Map<String, String>> upcomingEvents = [
    {'event': 'Grand Prix of Monaco', 'date': 'May 28, 2023'},
    {'event': 'Canadian Grand Prix', 'date': 'June 11, 2023'},
    {'event': 'British Grand Prix', 'date': 'July 2, 2023'},
    {'event': 'Hungarian Grand Prix', 'date': 'July 30, 2023'},
    {'event': 'Belgian Grand Prix', 'date': 'August 27, 2023'},
  ];

  // Define consistent dimensions for the tables
  final double tableWidth = 600; // Fixed width for the tables
  final double tableHeight = 200; // Adjusted fixed height for the tables

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
            child: SingleChildScrollView(
              child: Center( // Center the entire column
                child: Column(
                  children: [
                    const SizedBox(height: 40),
                    // Title
                    const Text(
                      'StintMaster',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 2,
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
                            dividerThickness: 1,
                            columnSpacing: 56,
                            horizontalMargin: 16,
                            columns: const [
                              DataColumn(
                                label: Text(
                                  'Team Name',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              DataColumn(
                                label: Text(
                                  'Country',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
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
                    
                    // Drivers table
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
                            dividerThickness: 1,
                            columnSpacing: 56,
                            horizontalMargin: 16,
                            columns: const [
                              DataColumn(
                                label: Text(
                                  'Driver Name',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              DataColumn(
                                label: Text(
                                  'Number',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                            rows: drivers.map((driver) => DataRow(
                              cells: [
                                DataCell(Text(driver['name']!)),
                                DataCell(Text(driver['number']!)),
                              ],
                            )).toList(),
                          ),
                        ),
                      ),
                    ),
                    
                    const SizedBox(height: 20),
                    
                    // Upcoming Events Table
                    SizedBox(
                      width: tableWidth, // Set fixed width
                      height: tableHeight, // Set fixed height
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
                            rows: upcomingEvents.map((event) => DataRow(
                              cells: [
                                DataCell(Text(event['event']!)),
                                DataCell(Text(event['date']!)),
                              ],
                            )).toList(),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          
          // Updated sidebar
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
                        // Stay on the HomeScreen
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
