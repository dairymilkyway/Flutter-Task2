import 'package:flutter/material.dart';
import '../data/sample_data.dart';
import '../models/playlist.dart';
import 'playlist_detail_screen.dart';

class MyPlaylistsScreen extends StatefulWidget {
  const MyPlaylistsScreen({super.key});

  @override
  State<MyPlaylistsScreen> createState() => _MyPlaylistsScreenState();
}

class _MyPlaylistsScreenState extends State<MyPlaylistsScreen> {
  List<Playlist> myPlaylists = List.from(samplePlaylists);

  void _createNewPlaylist() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String playlistName = '';
        return AlertDialog(
          backgroundColor: const Color(0xFF282828),
          title: const Text(
            'Create New Playlist',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          content: TextField(
            autofocus: true,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: 'My Playlist #${myPlaylists.length + 1}',
              hintStyle: const TextStyle(color: Color(0xFF535353)),
              filled: true,
              fillColor: const Color(0xFF3E3E3E),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: BorderSide.none,
              ),
            ),
            onChanged: (value) {
              playlistName = value;
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'Cancel',
                style: TextStyle(color: Color(0xFFB3B3B3)),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (playlistName.isNotEmpty) {
                  setState(() {
                    myPlaylists.add(
                      Playlist(
                        id: 'playlist_${DateTime.now().millisecondsSinceEpoch}',
                        name: playlistName,
                        coverUrl: 'https://via.placeholder.com/300x300/1DB954/FFFFFF?text=New',
                        tracks: [],
                      ),
                    );
                  });
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Created "$playlistName"'),
                      backgroundColor: const Color(0xFF282828),
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1DB954),
                foregroundColor: Colors.black,
              ),
              child: const Text('Create'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        title: const Text('Your Library'),
        backgroundColor: const Color(0xFF121212),
      ),
      body: myPlaylists.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.library_music_outlined,
                    size: 100,
                    color: const Color(0xFF535353),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Your library is empty',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Create your first playlist',
                    style: TextStyle(
                      color: Color(0xFFB3B3B3),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Playlists',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${myPlaylists.length} ${myPlaylists.length == 1 ? 'playlist' : 'playlists'}',
                    style: const TextStyle(
                      color: Color(0xFFB3B3B3),
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Expanded(
                    child: ListView.builder(
                      itemCount: myPlaylists.length,
                      itemBuilder: (context, index) {
                        return _buildPlaylistListItem(myPlaylists[index]);
                      },
                    ),
                  ),
                ],
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _createNewPlaylist,
        tooltip: 'Create New Playlist',
        backgroundColor: const Color(0xFF1DB954),
        child: const Icon(Icons.add, color: Colors.black),
      ),
    );
  }

  Widget _buildPlaylistListItem(Playlist playlist) {
    final gradientColors = [
      [const Color(0xFF1DB954), const Color(0xFF0D5C2B)],
      [const Color(0xFFE13300), const Color(0xFF8A1F00)],
      [const Color(0xFF8D67AB), const Color(0xFF4A3557)],
      [const Color(0xFF477D95), const Color(0xFF234052)],
      [const Color(0xFFBA5D07), const Color(0xFF5D2E03)],
      [const Color(0xFF1E3264), const Color(0xFF0F1932)],
    ];
    
    final colorIndex = int.parse(playlist.id.replaceAll(RegExp(r'[^0-9]'), '')) % gradientColors.length;
    
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: gradientColors[colorIndex],
            ),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Icon(
            Icons.music_note,
            color: Colors.white.withOpacity(0.9),
            size: 28,
          ),
        ),
        title: Text(
          playlist.name,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: Colors.white,
          ),
        ),
        subtitle: Text(
          'Playlist • ${playlist.trackCount} song${playlist.trackCount != 1 ? 's' : ''}',
          style: const TextStyle(
            color: Color(0xFFB3B3B3),
            fontSize: 13,
          ),
        ),
        trailing: const Icon(
          Icons.chevron_right,
          color: Color(0xFFB3B3B3),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PlaylistDetailScreen(playlist: playlist),
            ),
          );
        },
      ),
    );
  }
}
