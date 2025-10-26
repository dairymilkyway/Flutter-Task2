import 'track.dart';

class Album {
  final String id;
  final String title;
  final String artistName;
  final String artistId;
  final String coverUrl;
  final String releaseYear;
  final List<Track> tracks;

  Album({
    required this.id,
    required this.title,
    required this.artistName,
    required this.artistId,
    required this.coverUrl,
    required this.releaseYear,
    required this.tracks,
  });
}
