import 'track.dart';

class Playlist {
  final String id;
  final String name;
  final String? description;
  final String coverUrl;
  final List<Track> tracks;
  final int trackCount;

  Playlist({
    required this.id,
    required this.name,
    this.description,
    required this.coverUrl,
    required this.tracks,
  }) : trackCount = tracks.length;
}
