import 'package:flutter/material.dart';
import 'package:enduranceapp/screens/homescreen.dart';
import 'package:enduranceapp/screens/eventscreen.dart';
import 'package:enduranceapp/screens/teamscreen.dart'; // Import TeamScreen

class DriverScreen extends StatefulWidget {
  const DriverScreen({super.key});

  @override
  State<DriverScreen> createState() => _DriverScreenState();
}

class _DriverScreenState extends State<DriverScreen> {
  bool isExpanded = false;

  // Sample driver data
  final List<Map<String, String>> drivers = [
    {'name': 'Max Verstappen', 'number': '1'},
    {'name': 'Lewis Hamilton', 'number': '44'},
    {'name': 'Charles Leclerc', 'number': '16'},
    {'name': 'Lando Norris', 'number': '4'},
    {'name': 'Fernando Alonso', 'number': '14'},
  ];

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
                    'Driver Screen Content',
                    style: TextStyle(color: Colors.white),
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
                        columns: const [
                          DataColumn(label: Text('Driver Name')),
                          DataColumn(label: Text('Number')),
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
                // Text fields for creating a driver
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Driver Name',
                          border: OutlineInputBorder(),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Driver Number',
                          border: OutlineInputBorder(),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          // Handle driver creation logic here
                          print('Driver Created');
                        },
                        child: const Text('Create Driver'),
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
                        // Stay on the DriverScreen
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
