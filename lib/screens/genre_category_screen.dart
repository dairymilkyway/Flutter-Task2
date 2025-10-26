import 'package:flutter/material.dart';
import '../data/sample_data.dart';
import '../models/album.dart';
import '../models/track.dart';
import 'album_detail_screen.dart';
import 'playlist_detail_screen.dart';

class GenreCategoryScreen extends StatelessWidget {
  final String genre;
  final Color color;

  const GenreCategoryScreen({
    super.key,
    required this.genre,
    required this.color,
  });

  List<Album> _getGenreAlbums() {
    // Filter albums by genre (simplified - you can enhance this)
    switch (genre.toLowerCase()) {
      case 'pop':
        return sampleAlbums.where((a) => 
          a.artistName == 'Taylor Swift' || 
          a.artistName == 'Ed Sheeran' || 
          a.artistName == 'The Weeknd'
        ).toList();
      case 'rock':
        return sampleAlbums.where((a) => 
          a.artistName == 'Queen' || 
          a.artistName == 'Nirvana'
        ).toList();
      case 'hip-hop':
        return sampleAlbums.where((a) => 
          a.artistName == 'Drake'
        ).toList();
      case 'electronic':
        return sampleAlbums.where((a) => 
          a.artistName == 'Daft Punk'
        ).toList();
      case 'alternative':
        return sampleAlbums.where((a) => 
          a.artistName == 'Billie Eilish' || 
          a.artistName == 'Nirvana'
        ).toList();
      default:
        return sampleAlbums.take(3).toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    final albums = _getGenreAlbums();
    final playlists = samplePlaylists.take(2).toList();

    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        title: Text(genre),
        backgroundColor: color,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header with gradient
            Container(
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    color,
                    const Color(0xFF121212),
                  ],
                ),
              ),
              child: Center(
                child: Text(
                  genre,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            // Playlists Section
            if (playlists.isNotEmpty) ...[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Popular Playlists',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    ...playlists.map((playlist) => _buildPlaylistItem(context, playlist)),
                  ],
                ),
              ),
            ],

            // Albums Section
            if (albums.isNotEmpty) ...[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Popular Albums',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    ...albums.map((album) => _buildAlbumItem(context, album)),
                  ],
                ),
              ),
            ],

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildPlaylistItem(BuildContext context, playlist) {
    final gradientColors = [
      const Color(0xFF1DB954),
      const Color(0xFFE13300),
      const Color(0xFF8D67AB),
      const Color(0xFF477D95),
    ];
    final colorIndex = int.parse(playlist.id.replaceAll(RegExp(r'[^0-9]'), '')) % gradientColors.length;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PlaylistDetailScreen(playlist: playlist),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        child: Row(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    gradientColors[colorIndex].withOpacity(0.8),
                    gradientColors[colorIndex].withOpacity(0.4),
                  ],
                ),
                borderRadius: BorderRadius.circular(4),
              ),
              child: const Icon(Icons.queue_music, color: Colors.white, size: 30),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    playlist.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${playlist.trackCount} songs',
                    style: const TextStyle(
                      color: Color(0xFFB3B3B3),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAlbumItem(BuildContext context, Album album) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AlbumDetailScreen(album: album),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        child: Row(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    const Color(0xFF1DB954).withOpacity(0.6),
                    const Color(0xFF191414).withOpacity(0.8),
                  ],
                ),
                borderRadius: BorderRadius.circular(4),
              ),
              child: const Icon(Icons.album, color: Colors.white, size: 30),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    album.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${album.artistName} • ${album.releaseYear}',
                    style: const TextStyle(
                      color: Color(0xFFB3B3B3),
                      fontSize: 14,
                    ),
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
