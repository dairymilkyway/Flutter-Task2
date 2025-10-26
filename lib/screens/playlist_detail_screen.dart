import 'package:flutter/material.dart';
import '../models/playlist.dart';
import '../models/track.dart';
import 'now_playing_screen.dart';

class PlaylistDetailScreen extends StatefulWidget {
  final Playlist playlist;

  const PlaylistDetailScreen({super.key, required this.playlist});

  @override
  State<PlaylistDetailScreen> createState() => _PlaylistDetailScreenState();
}

class _PlaylistDetailScreenState extends State<PlaylistDetailScreen> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    final playlistTracks = widget.playlist.tracks;
    final gradientColors = [
      [const Color(0xFF1DB954), const Color(0xFF0D5C2B)],
      [const Color(0xFFE13300), const Color(0xFF8A1F00)],
      [const Color(0xFF8D67AB), const Color(0xFF4A3557)],
      [const Color(0xFF477D95), const Color(0xFF234052)],
      [const Color(0xFFBA5D07), const Color(0xFF5D2E03)],
      [const Color(0xFF1E3264), const Color(0xFF0F1932)],
    ];
    
    final colorIndex = int.parse(widget.playlist.id.replaceAll(RegExp(r'[^0-9]'), '')) % gradientColors.length;

    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.white),
            onPressed: () {
              _showPlaylistOptions(context);
            },
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Hero Section with Gradient
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(24, 80, 24, 24),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    gradientColors[colorIndex][0],
                    const Color(0xFF121212),
                  ],
                ),
              ),
              child: Column(
                children: [
                  // Playlist Artwork
                  Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: gradientColors[colorIndex],
                      ),
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Icon(
                        Icons.queue_music,
                        size: 100,
                        color: Colors.white.withOpacity(0.9),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Playlist Metadata
                  Center(
                    child: Text(
                      widget.playlist.name,
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 12),
                  if (widget.playlist.description != null)
                    Center(
                      child: Text(
                        widget.playlist.description!,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Color(0xFFB3B3B3),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  const SizedBox(height: 8),
                  Center(
                    child: Text(
                      '${playlistTracks.length} songs',
                      style: const TextStyle(
                        fontSize: 13,
                        color: Color(0xFFB3B3B3),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),

            // Play and Controls
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
              child: Row(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: Color(0xFF1DB954),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      onPressed: () {
                        if (playlistTracks.isNotEmpty) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NowPlayingScreen(
                                track: playlistTracks.first,
                                albumTitle: widget.playlist.name,
                                playlist: playlistTracks,
                              ),
                            ),
                          );
                        }
                      },
                      icon: const Icon(Icons.play_arrow, size: 32, color: Colors.black),
                      iconSize: 32,
                    ),
                  ),
                  const SizedBox(width: 24),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        isFavorite = !isFavorite;
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            isFavorite ? 'Added to Your Library' : 'Removed from Your Library',
                          ),
                          backgroundColor: isFavorite ? const Color(0xFF1DB954) : const Color(0xFF282828),
                          duration: const Duration(seconds: 1),
                        ),
                      );
                    },
                    icon: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      size: 28,
                      color: isFavorite ? const Color(0xFF1DB954) : const Color(0xFFB3B3B3),
                    ),
                  ),
                  const SizedBox(width: 16),
                  IconButton(
                    onPressed: () {
                      _showPlaylistOptions(context);
                    },
                    icon: const Icon(Icons.more_vert, size: 28, color: Color(0xFFB3B3B3)),
                  ),
                ],
              ),
            ),

            // Track List Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Individual Track Rows
                  Column(
                    children: playlistTracks.asMap().entries.map((entry) {
                      return _buildTrackRow(context, entry.value, entry.key + 1);
                    }).toList(),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildTrackRow(BuildContext context, Track track, int index) {
    final playlistTracks = widget.playlist.tracks;
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NowPlayingScreen(
              track: track,
              albumTitle: widget.playlist.name,
              playlist: playlistTracks,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            // Track Number
            SizedBox(
              width: 30,
              child: Text(
                '$index',
                style: const TextStyle(
                  color: Color(0xFFB3B3B3),
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(width: 16),
            // Track Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    track.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    track.artistName,
                    style: const TextStyle(
                      color: Color(0xFFB3B3B3),
                      fontSize: 14,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            // Duration
            Text(
              track.duration,
              style: const TextStyle(
                color: Color(0xFFB3B3B3),
                fontSize: 14,
              ),
            ),
            const SizedBox(width: 8),
            // More Options
            IconButton(
              icon: const Icon(
                Icons.more_vert,
                color: Color(0xFFB3B3B3),
                size: 20,
              ),
              onPressed: () {
                _showTrackOptions(context, track);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showPlaylistOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF282828),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.share, color: Colors.white),
              title: const Text('Share playlist', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Sharing ${widget.playlist.name}'),
                    backgroundColor: const Color(0xFF282828),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.download, color: Colors.white),
              title: const Text('Download', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Downloading playlist...'),
                    backgroundColor: Color(0xFF1DB954),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showTrackOptions(BuildContext context, Track track) {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF282828),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.playlist_add, color: Colors.white),
              title: const Text('Add to another playlist', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Added to playlist'),
                    backgroundColor: Color(0xFF1DB954),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.remove_circle_outline, color: Colors.white),
              title: const Text('Remove from this playlist', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Removed from playlist'),
                    backgroundColor: Color(0xFF282828),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.share, color: Colors.white),
              title: const Text('Share', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Sharing ${track.title}'),
                    backgroundColor: const Color(0xFF282828),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
