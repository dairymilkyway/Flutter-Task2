import 'package:flutter/material.dart';
import '../models/artist.dart';
import '../models/album.dart';
import 'album_detail_screen.dart';

class ArtistProfileScreen extends StatelessWidget {
  final Artist artist;

  const ArtistProfileScreen({super.key, required this.artist});

  @override
  Widget build(BuildContext context) {
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
            icon: const Icon(Icons.share, color: Colors.white),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Sharing ${artist.name}\'s profile'),
                  backgroundColor: const Color(0xFF282828),
                ),
              );
            },
          ),
          Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.more_vert, color: Colors.white),
              onPressed: () {
                Scaffold.of(context).openEndDrawer();
              },
            ),
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      endDrawer: Drawer(
        backgroundColor: const Color(0xFF282828),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Quick Links',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Divider(color: Color(0xFF3E3E3E)),
              ListTile(
                leading: const Icon(Icons.language, color: Color(0xFF1DB954)),
                title: const Text('Official Website', style: TextStyle(color: Colors.white)),
                trailing: const Icon(Icons.open_in_new, color: Color(0xFFB3B3B3)),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Opening website...'),
                      backgroundColor: Color(0xFF282828),
                    ),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.facebook, color: Color(0xFF1DB954)),
                title: const Text('Facebook', style: TextStyle(color: Colors.white)),
                trailing: const Icon(Icons.open_in_new, color: Color(0xFFB3B3B3)),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Opening Facebook...'),
                      backgroundColor: Color(0xFF282828),
                    ),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.music_note, color: Color(0xFF1DB954)),
                title: const Text('Twitter/X', style: TextStyle(color: Colors.white)),
                trailing: const Icon(Icons.open_in_new, color: Color(0xFFB3B3B3)),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Opening Twitter...'),
                      backgroundColor: Color(0xFF282828),
                    ),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.shopping_bag, color: Color(0xFF1DB954)),
                title: const Text('Merch Store', style: TextStyle(color: Colors.white)),
                trailing: const Icon(Icons.open_in_new, color: Color(0xFFB3B3B3)),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Opening merch store...'),
                      backgroundColor: Color(0xFF282828),
                    ),
                  );
                },
              ),
              const Divider(color: Color(0xFF3E3E3E)),
              SwitchListTile(
                secondary: const Icon(Icons.notifications_outlined, color: Color(0xFF1DB954)),
                title: const Text('Get Notifications', style: TextStyle(color: Colors.white)),
                value: false,
                activeColor: const Color(0xFF1DB954),
                onChanged: (value) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Notifications enabled'),
                      backgroundColor: Color(0xFF282828),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hero Section with Artist Image and Follow Button
            Container(
              height: 350,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    const Color(0xFF1DB954).withOpacity(0.6),
                    const Color(0xFF121212),
                  ],
                ),
              ),
              child: Stack(
                children: [
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 80),
                        CircleAvatar(
                          radius: 80,
                          backgroundColor: const Color(0xFF282828),
                          child: Icon(
                            Icons.person,
                            size: 100,
                            color: const Color(0xFF1DB954),
                          ),
                        ),
                        const SizedBox(height: 24),
                        Text(
                          artist.name,
                          style: const TextStyle(
                            fontSize: 48,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 24,
                    left: 24,
                    right: 24,
                    child: Row(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            color: Color(0xFF1DB954),
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Playing ${artist.name}'),
                                  backgroundColor: const Color(0xFF282828),
                                ),
                              );
                            },
                            icon: const Icon(Icons.play_arrow, size: 32, color: Colors.black),
                            iconSize: 32,
                          ),
                        ),
                        const SizedBox(width: 16),
                        OutlinedButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Following ${artist.name}'),
                                backgroundColor: const Color(0xFF282828),
                              ),
                            );
                          },
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 8,
                            ),
                            side: const BorderSide(color: Color(0xFFB3B3B3)),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: const Text(
                            'FOLLOW',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              letterSpacing: 1.5,
                            ),
                          ),
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: () {
                            Scaffold.of(context).openEndDrawer();
                          },
                          icon: const Icon(Icons.more_vert, color: Color(0xFFB3B3B3)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Popular Tracks Section
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Popular',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Vertical List of Track Rows
                  Column(
                    children: artist.popularTracks.asMap().entries.map((entry) {
                      int index = entry.key;
                      var track = entry.value;
                      return ListTile(
                        contentPadding: const EdgeInsets.symmetric(vertical: 4),
                        leading: SizedBox(
                          width: 40,
                          child: Text(
                            '${index + 1}',
                            style: const TextStyle(
                              fontSize: 16,
                              color: Color(0xFFB3B3B3),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        title: Text(
                          track.title,
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              track.duration,
                              style: const TextStyle(color: Color(0xFFB3B3B3)),
                            ),
                            const SizedBox(width: 8),
                            IconButton(
                              icon: const Icon(Icons.more_vert, color: Color(0xFFB3B3B3)),
                              onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Options for ${track.title}'),
                                    backgroundColor: const Color(0xFF282828),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Playing ${track.title}'),
                              backgroundColor: const Color(0xFF282828),
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),

            const Divider(height: 1, color: Color(0xFF282828)),

            // Discography Section
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Section Header
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Discography',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Showing all albums...'),
                              backgroundColor: Color(0xFF282828),
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

                  // Horizontal Scrollable Album List
                  SizedBox(
                    height: 240,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: artist.discography.length,
                      itemBuilder: (context, index) {
                        return _buildAlbumCard(
                          context,
                          artist.discography[index],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),

            // About the Artist Section
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'About',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    artist.bio,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFFB3B3B3),
                      height: 1.6,
                    ),
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
              album.releaseYear,
              style: const TextStyle(
                color: Color(0xFFB3B3B3),
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
