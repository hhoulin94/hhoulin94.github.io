import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    Orientation orientation = MediaQuery.of(context).orientation;

    return MaterialApp(
          home: DefaultTabController(
            length: 3, // Number of tabs
            child: Container(
              padding: const EdgeInsets.all(50),
              color : Colors.transparent , 
              child : Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(20), // Rounded edges
                ),
                child : const ResponsiveLayout()
                ),
            ),
          ),
        );
  }
}

class CarTab extends StatelessWidget {
  const CarTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: List.generate(10, (index) {
          return Card(
            margin: const EdgeInsets.all(10),
            child: ListTile(
              leading: const Icon(Icons.directions_car),
              title: Text('Car Item $index'),
              subtitle: Text('Details about car item $index'),
            ),
          );
        }),
      ),
    );
  }
}

class TransitTab extends StatelessWidget {
  const TransitTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: List.generate(10, (index) {
          return Card(
            margin: const EdgeInsets.all(10),
            child: ListTile(
              leading: const Icon(Icons.directions_transit),
              title: Text('Transit Item $index'),
              subtitle: Text('Details about transit item $index'),
            ),
          );
        }),
      ),
    );
  }
}

class BikeTab extends StatelessWidget {
  const BikeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: List.generate(10, (index) {
          return Card(
            margin: const EdgeInsets.all(10),
            child: ListTile(
              leading: const Icon(Icons.directions_bike),
              title: Text('Bike Item $index'),
              subtitle: Text('Details about bike item $index'),
            ),
          );
        }),
      ),
    );
  }
}

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double sidebarWidth = screenWidth < 600 ? 150 : 200;

    return Scaffold(
      body: Row(
        children: [
          // Static left sidebar
          Container(
            width: sidebarWidth,
            color: Colors.grey[200],
            padding: const EdgeInsets.all(20),
            child:const  Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Static Sidebar',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Text('This content is static and doesn\'t scroll.'),
              ],
            ),
          ),

          // Scrollable right content with tabs
          Expanded(
            child : Column(
            children: [
              Container(
                color: Colors.blue,
                child: const TabBar(
                  tabs: [
                    Tab(icon: Icon(Icons.directions_car), text: 'Car'),
                    Tab(icon: Icon(Icons.directions_transit), text: 'Transit'),
                    Tab(icon: Icon(Icons.directions_bike), text: 'Bike'),
                  ],
                ),
              ),
              const Expanded(
                child: TabBarView(
                  children: [
                    CarTab(),
                    TransitTab(),
                    BikeTab(),
                  ],
                ),
              ),
            ],
          ),
          ),
        ],
      ),
    );
  }
}