class MyDuration {
  final int _milliseconds;

  // Constructor to create a MyDuration from hours, minutes, or seconds
  MyDuration.fromHours(int hours) : _milliseconds = hours * 60 * 60 * 1000;
  MyDuration.fromMinutes(int minutes) : _milliseconds = minutes * 60 * 1000;
  MyDuration.fromSeconds(int seconds) : _milliseconds = seconds * 1000;

  // Overload the + operator to add two MyDuration objects
  MyDuration operator +(MyDuration other) {
    return MyDuration._fromMilliseconds(_milliseconds + other._milliseconds);
  }

  // Overload the - operator to subtract two MyDuration objects
  MyDuration operator -(MyDuration other) {
    int result = _milliseconds - other._milliseconds;
    if (result < 0) {
      throw Exception("Resulting duration cannot be negative");
    }
    return MyDuration._fromMilliseconds(result);
  }

  // Overload the > operator to compare two MyDuration objects
  bool operator >(MyDuration other) {
    return _milliseconds > other._milliseconds;
  }

  // Private constructor for internal use
  MyDuration._fromMilliseconds(this._milliseconds);

  // Display the duration in hours, minutes, and seconds
  @override
  String toString() {
    int totalSeconds = (_milliseconds / 1000).round();
    int hours = totalSeconds ~/ 3600;
    int minutes = (totalSeconds % 3600) ~/ 60;
    int seconds = totalSeconds % 60;
    return '$hours hours, $minutes minutes, $seconds seconds';
  }
}

void main() {
  MyDuration duration1 = MyDuration.fromHours(3); // 3 hours
  MyDuration duration2 = MyDuration.fromMinutes(45); // 45 minutes

  print(duration1 + duration2); // 3 hours, 45 minutes, 0 seconds
  print(duration1 > duration2); // true

  try {
    print(duration2 - duration1); // Throws an exception
  } catch (e) {
    print(e); // Output: Resulting duration cannot be negative
  }
}
