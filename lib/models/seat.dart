class Seat {
  final int row;
  final String column;
  final bool isAvailable;

  const Seat({
    required this.row,
    required this.column,
    this.isAvailable = true,
  });

  String get seatNumber => '$row$column';
  String get formattedSeatNumber => '$row-$column';

  static const List<String> columns = ['A', 'B', 'C', 'D'];
  static const int maxRows = 20;

  static List<Seat> generateSeats() {
    List<Seat> seats = [];
    for (int row = 1; row <= maxRows; row++) {
      for (String column in columns) {
        seats.add(Seat(row: row, column: column));
      }
    }
    return seats;
  }
}
