import 'package:flutter/material.dart';
import '../data/sample_data.dart';
import '../models/track.dart';
import 'now_playing_screen.dart';

class LikedSongsScreen extends StatefulWidget {
  const LikedSongsScreen({super.key});

  @override
  State<LikedSongsScreen> createState() => _LikedSongsScreenState();
}

class _LikedSongsScreenState extends State<LikedSongsScreen> {
  // Placeholder: Randomly select some tracks as "liked"
  late List<Track> likedTracks;

  @override
  void initState() {
    super.initState();
    // Initialize with a subset of tracks from our database
    likedTracks = _getInitialLikedTracks();
  }

  List<Track> _getInitialLikedTracks() {
    // Combine all tracks from all albums
    final allTracks = <Track>[];
    allTracks.addAll(queenTracks);
    allTracks.addAll(weekndTracks);
    allTracks.addAll(swiftTracks);
    allTracks.addAll(daftPunkTracks);
    allTracks.addAll(eilishTracks);
    allTracks.addAll(drakeTracks);
    allTracks.addAll(nirvanaTracks);
    allTracks.addAll(sheeranTracks);
    
    // Return first 15 tracks as "liked" (placeholder)
    return allTracks.take(15).toList();
  }

  void _toggleLike(Track track) {
    setState(() {
      if (likedTracks.contains(track)) {
        likedTracks.remove(track);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Removed from Liked Songs'),
            backgroundColor: const Color(0xFF282828),
            duration: const Duration(seconds: 1),
          ),
        );
      } else {
        likedTracks.add(track);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Added to Liked Songs'),
            backgroundColor: const Color(0xFF1DB954),
            duration: const Duration(seconds: 1),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      body: CustomScrollView(
        slivers: [
          // Spotify-style gradient header
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            backgroundColor: const Color(0xFF121212),
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      const Color(0xFF5038A0),
                      const Color(0xFF121212),
                    ],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.favorite,
                        color: Colors.white,
                        size: 80,
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Liked Songs',
                        style: TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '${likedTracks.length} songs',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // Play button
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Row(
                children: [
                  Container(
                    width: 56,
                    height: 56,
                    decoration: const BoxDecoration(
                      color: Color(0xFF1DB954),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.play_arrow, size: 32),
                      color: Colors.black,
                      onPressed: () {
                        if (likedTracks.isNotEmpty) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NowPlayingScreen(
                                track: likedTracks.first,
                                albumTitle: 'Liked Songs',
                                playlist: likedTracks,
                              ),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                  IconButton(
                    icon: const Icon(Icons.shuffle, size: 32),
                    color: const Color(0xFFB3B3B3),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Shuffle mode enabled'),
                          backgroundColor: Color(0xFF282828),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),

          // Track list
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final track = likedTracks[index];
                return _buildTrackTile(track, index);
              },
              childCount: likedTracks.length,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTrackTile(Track track, int index) {
    final isLiked = likedTracks.contains(track);
    
    return Container(
      color: Colors.transparent,
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        leading: Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF1DB954).withOpacity(0.6),
                Color(0xFF191414).withOpacity(0.8),
              ],
            ),
            borderRadius: BorderRadius.circular(4),
          ),
          child: const Icon(
            Icons.music_note,
            color: Colors.white,
            size: 24,
          ),
        ),
        title: Text(
          track.title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
          track.artistName,
          style: const TextStyle(
            color: Color(0xFFB3B3B3),
            fontSize: 14,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(
                isLiked ? Icons.favorite : Icons.favorite_border,
                color: isLiked ? const Color(0xFF1DB954) : const Color(0xFFB3B3B3),
              ),
              onPressed: () => _toggleLike(track),
            ),
            Text(
              track.duration,
              style: const TextStyle(
                color: Color(0xFFB3B3B3),
                fontSize: 14,
              ),
            ),
            const SizedBox(width: 8),
            IconButton(
              icon: const Icon(
                Icons.more_vert,
                color: Color(0xFFB3B3B3),
              ),
              onPressed: () {
                _showTrackOptions(track);
              },
            ),
          ],
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NowPlayingScreen(
                track: track,
                albumTitle: 'Liked Songs',
                playlist: likedTracks,
              ),
            ),
          );
        },
      ),
    );
  }

  void _showTrackOptions(Track track) {
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
              title: const Text('Add to playlist', style: TextStyle(color: Colors.white)),
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
            ListTile(
              leading: const Icon(Icons.album, color: Colors.white),
              title: const Text('Go to album', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Opening album...'),
                    backgroundColor: Color(0xFF282828),
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
