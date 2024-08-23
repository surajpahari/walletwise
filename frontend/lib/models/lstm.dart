class Lstm {
  final List<double> data;

  Lstm({required this.data});

  factory Lstm.fromJson(Map<String, dynamic> json) {
    // Check if 'lstm' key exists and is a List
    final lstmData = json['lstm'] as List<dynamic>?;

    // Convert the list of dynamic values to a list of doubles
    final data = lstmData?.map((e) {
          // Safely convert each element to double
          if (e is num) {
            return e.toDouble();
          } else {
            throw ArgumentError('List contains non-numeric value');
          }
        }).toList() ??
        [];

    return Lstm(
      data: data,
    );
  }
}
