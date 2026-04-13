import 'package:flutter/material.dart';

class SummaryPage extends StatelessWidget {
  final List<String> seats;
  final int total;
  final String movieTitle;
  final String time;

  const SummaryPage({
    super.key,
    required this.seats,
    required this.total,
    required this.movieTitle,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ringkasan")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Film: $movieTitle"),
            Text("Jam: $time"),
            Text("Seat: ${seats.join(", ")}"),
            Text(
              "Total: Rp$total",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {},
              child: const Text("Bayar Sekarang"),
            ),
          ],
        ),
      ),
    );
  }
}
