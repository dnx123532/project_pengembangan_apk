import 'package:flutter/material.dart';
import 'movie.dart';
import 'summary.dart';

class SeatPage extends StatefulWidget {
  final Movie movie;
  final String time;

  const SeatPage({super.key, required this.movie, required this.time});

  @override
  State<SeatPage> createState() => _SeatPageState();
}

class _SeatPageState extends State<SeatPage> {
  Map<String, String> seats = {};

  final List<String> rows = ["A", "B", "C", "D", "E", "F", "G", "H"];

  @override
  void initState() {
    super.initState();

    for (var row in rows) {
      for (int i = 1; i <= 10; i++) {
        seats["$row$i"] = "available";
      }
    }
  }

  Color getColor(String status) {
    if (status == "selected") return Colors.blue;
    if (status == "booked") return Colors.grey;
    return Colors.green;
  }

  List<String> getSelectedSeats() {
    return seats.entries
        .where((e) => e.value == "selected")
        .map((e) => e.key)
        .toList();
  }

  int getTotal() {
    return getSelectedSeats().length * widget.movie.price;
  }

  @override
  Widget build(BuildContext context) {
    final selected = getSelectedSeats();

    return Scaffold(
      appBar: AppBar(title: Text(widget.movie.title)),
      body: Column(
        children: [
          const SizedBox(height: 10),

          Text("Jam: ${widget.time}"),
          Text("Harga / Kursi: Rp${widget.movie.price}"),

          const SizedBox(height: 10),

          // GRID KURSI
          Expanded(
            child: GridView.builder(
              itemCount: seats.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 8,
              ),
              itemBuilder: (context, index) {
                String key = seats.keys.elementAt(index);
                String status = seats[key]!;

                return GestureDetector(
                  onTap: status == "booked"
                      ? null
                      : () {
                          setState(() {
                            seats[key] = status == "selected"
                                ? "available"
                                : "selected";
                          });
                        },
                  child: Container(
                    margin: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: getColor(status),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Text(
                        key,
                        style: const TextStyle(
                          fontSize: 10,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          // TOTAL + BUTTON
          if (selected.isNotEmpty)
            Container(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  Text("Seat: ${selected.join(", ")}"),
                  Text(
                    "Total: Rp${getTotal()}",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 10),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => SummaryPage(
                              seats: selected,
                              total: getTotal(),
                              movieTitle: widget.movie.title,
                              time: widget.time,
                            ),
                          ),
                        );
                      },
                      child: const Text(
                        "LANJUT PEMBAYARAN",
                        style: TextStyle(
                          color: Color.fromARGB(255, 10, 10, 10),
                        ),
                      ),
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
