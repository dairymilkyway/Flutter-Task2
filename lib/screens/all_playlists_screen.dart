import 'package:flutter/material.dart';
import '../data/sample_data.dart';
import 'playlist_detail_screen.dart';

class AllPlaylistsScreen extends StatelessWidget {
  const AllPlaylistsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        title: const Text('All Playlists'),
        backgroundColor: const Color(0xFF121212),
        elevation: 0,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 0.7,
        ),
        itemCount: samplePlaylists.length,
        itemBuilder: (context, index) {
          final playlist = samplePlaylists[index];
          return _buildPlaylistCard(context, playlist, index);
        },
      ),
    );
  }

  Widget _buildPlaylistCard(BuildContext context, playlist, int index) {
    final gradientColors = [
      [const Color(0xFF1DB954), const Color(0xFF0D5C2B)],
      [const Color(0xFFE13300), const Color(0xFF8A1F00)],
      [const Color(0xFF8D67AB), const Color(0xFF4A3557)],
      [const Color(0xFF477D95), const Color(0xFF234052)],
      [const Color(0xFFBA5D07), const Color(0xFF5D2E03)],
      [const Color(0xFF1E3264), const Color(0xFF0F1932)],
    ];

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
        decoration: BoxDecoration(
          color: const Color(0xFF181818),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Playlist artwork
            Container(
              width: double.infinity,
              height: 160,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: gradientColors[index % gradientColors.length],
                ),
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(8),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.4),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Center(
                child: Icon(
                  Icons.queue_music,
                  size: 64,
                  color: Colors.white.withOpacity(0.9),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      playlist.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.white,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      playlist.description ?? '${playlist.trackCount} songs',
                      style: const TextStyle(
                        color: Color(0xFFB3B3B3),
                        fontSize: 12,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
