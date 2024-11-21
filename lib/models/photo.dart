class Photo {
  final String id;
  final String thumbnailUrl;
  final String fullUrl;
  final String altDescription;

  Photo({
    required this.id,
    required this.thumbnailUrl,
    required this.fullUrl,
    required this.altDescription,
  });

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      id: json['id'],
      thumbnailUrl: json['urls']['small'],
      fullUrl: json['urls']['full'],
      altDescription: json['alt_description'] ?? 'No description available',
    );
  }
}
