import 'package:flutter/material.dart';
import 'detail_movie.dart';

class Movie {
  String title;
  String image;
  String genre;
  String duration;
  String director;
  String ageRating;
  List<String> cinema;
  int price;
  List<List<String>> showtimes;
  String trailer;

  Movie({
    required this.title,
    required this.image,
    required this.genre,
    required this.duration,
    required this.director,
    required this.ageRating,
    required this.cinema,
    required this.price,
    required this.showtimes,
    required this.trailer,
  });
}

final List<Movie> movies = [
  Movie(
    title: "DANUR: THE LAST CHAPTER",
    image: "https://i.imgur.com/6X4F6YQ.jpg",
    genre: "Horror",
    duration: "1 jam 38 menit",
    director: "Awi Suryadi",
    ageRating: "R 13+",
    cinema: ["CENTRE POINT XXI", "SUN PLAZA XXI", "MANHATTAN XXI"],
    price: 65000,
    showtimes: [
      ["12:35", "14:35", "16:35", "18:35", "20:35"], 
      ["11:00", "13:00", "15:00", "17:00", "19:00"], 
      ["10:30", "12:30", "14:30", "16:30", "18:30"], 
    ],
    trailer:
        "https://www.youtube.com/watch?v=DZ8qYq6fAao&pp=ygUadHJhaWxlciBkYW51ciBsYXN0IGNoYXB0ZXI%3D",
  ),
  Movie(
    title: "AVENGERS: ENDGAME",
    image: "https://i.imgur.com/3jLPB46.jpg",
    genre: "Action, Sci-Fi",
    duration: "3 jam 2 menit",
    director: "Russo Brothers",
    ageRating: "SU",
    cinema: ["CENTRE POINT XXI", "SUN PLAZA XXI", "MANHATTAN XXI"],
    price: 50000,
    showtimes: [
      ["12:35", "14:35", "16:35", "18:35", "20:35"], 
      ["11:00", "13:00", "15:00", "17:00", "19:00"], 
      ["10:30", "12:30", "14:30", "16:30", "18:30"], 
    ],
    trailer:
        "https://www.youtube.com/watch?v=TcMBFSGVi1c&pp=ygUYdHJhaWxlciBhdmVuZ2VycyBlbmRnYW1l",
  ),
  Movie(
    title: "THE BATMAN",
    image: "https://i.imgur.com/6X4F6YQ.jpg",
    genre: "Action, Crime",
    duration: "2 jam 56 menit",
    director: "Matt Reeves",
    ageRating: "R 13+",
    cinema: ["CENTRE POINT XXI", "SUN PLAZA XXI", "MANHATTAN XXI"],
    price: 45000,
    showtimes: [
      ["12:35", "14:35", "16:35", "18:35", "20:35"], 
      ["11:00", "13:00", "15:00", "17:00", "19:00"], 
      ["10:30", "12:30", "14:30", "16:30", "18:30"], 
    ],
    trailer:
        "https://www.youtube.com/watch?v=mqqft2x_Aa4&pp=ygUSdHJhaWxlciB0aGUgYmF0bWFu",
  ),
  Movie(
    title: "SPIDER-MAN: NO WAY HOME",
    image: "https://i.imgur.com/3jLPB46.jpg",
    genre: "Action, Adventure",
    duration: "2 jam 28 menit",
    director: "Jon Watts",
    ageRating: "SU",
    cinema: ["CENTRE POINT XXI", "SUN PLAZA XXI", "MANHATTAN XXI"],
    price: 55000,
    showtimes: [
      ["12:35", "14:35", "16:35", "18:35", "20:35"], 
      ["11:00", "13:00", "15:00", "17:00", "19:00"], 
      ["10:30", "12:30", "14:30", "16:30", "18:30"], 
    ],
    trailer:
        "https://www.youtube.com/watch?v=JfVOs4VSpmA&pp=ygUedHJhaWxlciBzcGlkZXIgbWFuIG5vIHdheSBob21l",
  ),
  Movie(
    title: "INTERSTELLAR",
    image: "https://i.imgur.com/6X4F6YQ.jpg",
    genre: "Sci-Fi, Drama",
    duration: "2 jam 49 menit",
    director: "Christopher Nolan",
    ageRating: "R 13+",
    cinema: ["CENTRE POINT XXI", "SUN PLAZA XXI", "MANHATTAN XXI"],
    price: 60000,
    showtimes: [
      ["12:35", "14:35", "16:35", "18:35", "20:35"], 
      ["11:00", "13:00", "15:00", "17:00", "19:00"], 
      ["10:30", "12:30", "14:30", "16:30", "18:30"], 
    ],
    trailer:
        "https://www.youtube.com/watch?v=zSWdZVtXT7E&pp=ygUUdHJhaWxlciBpbnRlcnN0ZWxsYXI%3D",
  ),
];

class MoviePage extends StatelessWidget {
  const MoviePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(title: const Text("Film & Jadwal")),
      body: ListView.builder(
        itemCount: movies.length,
        itemBuilder: (context, index) {
          final movie = movies[index];

          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => DetailMoviePage(movie: movie),
                ),
              );
            },
            child: Card(
              margin: const EdgeInsets.all(10),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        movie.image,
                        width: 90,
                        height: 130,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 10),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            movie.title,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text("Genre: ${movie.genre}"),
                          Text("Durasi: ${movie.duration}"),
                          const SizedBox(height: 5),
                          Text(
                            "Rp${movie.price}",
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
