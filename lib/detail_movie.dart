import 'package:flutter/material.dart';
import 'trailer_page.dart';
import 'movie.dart';
import 'seat.dart';

class DetailMoviePage extends StatelessWidget {
  final Movie movie;

  const DetailMoviePage({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(title: const Text("Detail Film")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // ================= HEADER =================
            Container(
              padding: const EdgeInsets.all(16),
              color: Colors.white,
              child: Row(
                children: [
                  Image.network(
                    movie.image,
                    width: 100,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(width: 15),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          movie.title,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text("Genre: ${movie.genre}"),
                        Text("Durasi: ${movie.duration}"),
                        Text("Sutradara: ${movie.director}"),
                        Text("Rating: ${movie.ageRating}"),

                        const SizedBox(height: 10),

                        // TRAILER
                        OutlinedButton.icon(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => TrailerPage(url: movie.trailer),
                              ),
                            );
                          },
                          icon: const Icon(Icons.play_arrow),
                          label: const Text("Nonton Trailer"),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),

            // ================= JADWAL =================
            Container(
              padding: const EdgeInsets.all(16),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "JADWAL",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 15),

                  // 🔥 LOOP CINEMA + SHOWTIME
                  Column(
                    children: List.generate(movie.cinema.length, (index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.location_on, size: 18),
                              const SizedBox(width: 5),
                              Text(
                                movie.cinema[index], // ✅ FIX
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Spacer(),
                              Text("Rp${movie.price}"),
                            ],
                          ),

                          const SizedBox(height: 10),

                          Wrap(
                            spacing: 10,
                            runSpacing: 10,
                            children: movie.showtimes[index].map((time) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) =>
                                          SeatPage(movie: movie, time: time),
                                    ),
                                  );
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 18,
                                    vertical: 10,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(time),
                                ),
                              );
                            }).toList(),
                          ),

                          const SizedBox(height: 20),
                        ],
                      );
                    }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
