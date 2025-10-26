import 'package:flutter/material.dart';
import '../data/sample_data.dart';
import '../models/album.dart';
import '../models/playlist.dart';
import 'album_detail_screen.dart';
import 'settings_screen.dart';
import 'liked_songs_screen.dart';
import 'all_albums_screen.dart';
import 'all_playlists_screen.dart';
import 'playlist_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  final VoidCallback? onNavigateToLibrary;
  
  const HomeScreen({super.key, this.onNavigateToLibrary});

  String _getGreeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) return 'Good morning';
    if (hour < 17) return 'Good afternoon';
    return 'Good evening';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        title: Text(_getGreeting()),
        backgroundColor: const Color(0xFF121212),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined, color: Colors.white),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('No new notifications'),
                  backgroundColor: Color(0xFF282828),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings_outlined, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingsScreen(),
                ),
              );
            },
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: const Color(0xFF121212),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Color(0xFF181818),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Color(0xFF535353),
                    child: Icon(Icons.person, size: 40, color: Colors.white),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'User',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home, color: Color(0xFF1DB954)),
              title: const Text('Home', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.library_music, color: Colors.white),
              title: const Text('My Library', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pop(context);
                if (onNavigateToLibrary != null) {
                  onNavigateToLibrary!();
                }
              },
            ),
            ListTile(
              leading: const Icon(Icons.favorite, color: Colors.white),
              title: const Text('Liked Songs', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LikedSongsScreen(),
                  ),
                );
              },
            ),
            const Divider(color: Color(0xFF282828)),
            ListTile(
              leading: const Icon(Icons.settings, color: Colors.white),
              title: const Text('Settings', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SettingsScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Quick Access - Recently Played Style
              const Text(
                'Recently played',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  childAspectRatio: 3,
                ),
                itemCount: 6,
                itemBuilder: (context, index) {
                  final items = [
                    samplePlaylists[0],
                    sampleAlbums[2],
                    samplePlaylists[1],
                    sampleAlbums[0],
                    samplePlaylists[4],
                    sampleAlbums[3],
                  ];
                  final item = items[index];
                  return _buildRecentlyPlayedCard(context, item, index);
                },
              ),
              const SizedBox(height: 32),

              // Featured Albums Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'New releases',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AllAlbumsScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      'Show all',
                      style: TextStyle(
                        color: Color(0xFFB3B3B3),
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 240,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: sampleAlbums.length,
                  itemBuilder: (context, index) {
                    return _buildAlbumCard(context, sampleAlbums[index]);
                  },
                ),
              ),
              const SizedBox(height: 32),

              // Made For You Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Made for you',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AllPlaylistsScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      'Show all',
                      style: TextStyle(
                        color: Color(0xFFB3B3B3),
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 240,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: samplePlaylists.length,
                  itemBuilder: (context, index) {
                    return _buildPlaylistCard(context, samplePlaylists[index]);
                  },
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRecentlyPlayedCard(BuildContext context, dynamic item, int colorIndex) {
    final colors = [
      const Color(0xFF1DB954),
      const Color(0xFFE13300),
      const Color(0xFF8D67AB),
      const Color(0xFF477D95),
      const Color(0xFFBA5D07),
      const Color(0xFF1E3264),
    ];
    
    final isPlaylist = item is Playlist;
    final name = isPlaylist ? item.name : item.title;
    
    return GestureDetector(
      onTap: () {
        if (!isPlaylist) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AlbumDetailScreen(album: item),
            ),
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PlaylistDetailScreen(playlist: item),
            ),
          );
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF282828),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Row(
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    colors[colorIndex % colors.length].withOpacity(0.7),
                    colors[colorIndex % colors.length].withOpacity(0.4),
                  ],
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(4),
                  bottomLeft: Radius.circular(4),
                ),
              ),
              child: Icon(
                isPlaylist ? Icons.queue_music : Icons.album,
                color: Colors.white,
                size: 24,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlaylistCard(BuildContext context, Playlist playlist) {
    final gradientColors = [
      [const Color(0xFF1DB954), const Color(0xFF0D5C2B)],
      [const Color(0xFFE13300), const Color(0xFF8A1F00)],
      [const Color(0xFF8D67AB), const Color(0xFF4A3557)],
      [const Color(0xFF477D95), const Color(0xFF234052)],
      [const Color(0xFFBA5D07), const Color(0xFF5D2E03)],
      [const Color(0xFF1E3264), const Color(0xFF0F1932)],
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
        width: 160,
        margin: const EdgeInsets.only(right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 160,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: gradientColors[colorIndex],
                ),
                borderRadius: BorderRadius.circular(8),
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
            const SizedBox(height: 12),
            Text(
              playlist.name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: Colors.white,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
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
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAlbumCard(BuildContext context, Album album) {
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
        width: 160,
        margin: const EdgeInsets.only(right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 160,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    const Color(0xFF1DB954).withOpacity(0.6),
                    const Color(0xFF191414).withOpacity(0.8),
                  ],
                ),
                borderRadius: BorderRadius.circular(8),
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
                  Icons.album,
                  size: 64,
                  color: Colors.white.withOpacity(0.9),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              album.title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: Colors.white,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 4),
            Text(
              album.artistName,
              style: const TextStyle(
                color: Color(0xFFB3B3B3),
                fontSize: 12,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
