import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bioskop Ticket Booking',
      theme: ThemeData(primarySwatch: Colors.red),
      home: const TicketBookingHomePage(),
    );
  }
}

class TicketBookingHomePage extends StatelessWidget {
  const TicketBookingHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Bioskop Ticket Booking')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Now Showing',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 200,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    MovieCard(
                      imageUrl: 'https://via.placeholder.com/150',
                      title: 'Movie 1',
                    ),
                    MovieCard(
                      imageUrl: 'https://via.placeholder.com/150',
                      title: 'Movie 2',
                    ),
                    MovieCard(
                      imageUrl: 'https://via.placeholder.com/150',
                      title: 'Movie 3',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              const Text(
                'Coming Soon',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 200,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    MovieCard(
                      imageUrl: 'https://via.placeholder.com/150',
                      title: 'Coming Soon 1',
                    ),
                    MovieCard(
                      imageUrl: 'https://via.placeholder.com/150',
                      title: 'Coming Soon 2',
                    ),
                    MovieCard(
                      imageUrl: 'https://via.placeholder.com/150',
                      title: 'Coming Soon 3',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MovieCard extends StatelessWidget {
  final String imageUrl;
  final String title;

  const MovieCard({super.key, required this.imageUrl, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              imageUrl,
              width: 150,
              height: 150,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
