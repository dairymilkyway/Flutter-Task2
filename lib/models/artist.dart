import 'album.dart';
import 'track.dart';

class Artist {
  final String id;
  final String name;
  final String imageUrl;
  final String bio;
  final List<String> socialMediaLinks;
  final List<Album> discography;
  final List<Track> popularTracks;

  Artist({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.bio,
    required this.socialMediaLinks,
    required this.discography,
    required this.popularTracks,
  });
}
