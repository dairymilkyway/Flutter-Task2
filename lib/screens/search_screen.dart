import 'package:flutter/material.dart';
import '../data/sample_data.dart';
import '../models/album.dart';
import '../models/artist.dart';
import '../models/track.dart';
import 'album_detail_screen.dart';
import 'artist_profile_screen.dart';
import 'genre_category_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String _searchQuery = '';
  final TextEditingController _searchController = TextEditingController();

  List<Album> get _filteredAlbums {
    if (_searchQuery.isEmpty) return sampleAlbums;
    return sampleAlbums
        .where((album) =>
            album.title.toLowerCase().contains(_searchQuery.toLowerCase()) ||
            album.artistName.toLowerCase().contains(_searchQuery.toLowerCase()))
        .toList();
  }

  List<Artist> get _filteredArtists {
    if (_searchQuery.isEmpty) return sampleArtists;
    return sampleArtists
        .where((artist) =>
            artist.name.toLowerCase().contains(_searchQuery.toLowerCase()))
        .toList();
  }

  List<Track> get _filteredTracks {
    if (_searchQuery.isEmpty) return sampleTracks.take(5).toList();
    return sampleTracks
        .where((track) =>
            track.title.toLowerCase().contains(_searchQuery.toLowerCase()) ||
            track.artistName.toLowerCase().contains(_searchQuery.toLowerCase()))
        .toList();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        title: const Text('Search'),
        backgroundColor: const Color(0xFF121212),
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              style: const TextStyle(color: Colors.black),
              decoration: InputDecoration(
                hintText: 'Artists, songs, or albums',
                hintStyle: const TextStyle(color: Color(0xFF535353)),
                prefixIcon: const Icon(Icons.search, color: Color(0xFF535353)),
                suffixIcon: _searchQuery.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear, color: Color(0xFF535353)),
                        onPressed: () {
                          setState(() {
                            _searchController.clear();
                            _searchQuery = '';
                          });
                        },
                      )
                    : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: const Color(0xFFFFFFFF),
                contentPadding: const EdgeInsets.symmetric(vertical: 0),
              ),
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                });
              },
            ),
          ),

          // Search Results
          Expanded(
            child: _searchQuery.isEmpty
                ? _buildBrowseCategories()
                : _buildSearchResults(),
          ),
        ],
      ),
    );
  }

  Widget _buildBrowseCategories() {
    final categories = [
      {'name': 'Pop', 'color': const Color(0xFF8D67AB)},
      {'name': 'Hip-Hop', 'color': const Color(0xFFBA5D07)},
      {'name': 'Rock', 'color': const Color(0xFFE13300)},
      {'name': 'Electronic', 'color': const Color(0xFF1E3264)},
      {'name': 'R&B', 'color': const Color(0xFF477D95)},
      {'name': 'Alternative', 'color': const Color(0xFF608108)},
      {'name': 'Indie', 'color': const Color(0xFF8E1538)},
      {'name': 'Classical', 'color': const Color(0xFF1E3A8A)},
    ];
    
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Browse all',
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 1.6,
              ),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                return _buildCategoryCard(
                  category['name'] as String,
                  category['color'] as Color,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryCard(String title, Color color) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => GenreCategoryScreen(
              genre: title,
              color: color,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.all(16),
        child: Align(
          alignment: Alignment.topLeft,
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSearchResults() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (_filteredAlbums.isNotEmpty) ...[
              const Text(
                'Albums',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              ..._filteredAlbums.map((album) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            const Color(0xFF1DB954).withOpacity(0.6),
                            const Color(0xFF191414).withOpacity(0.8),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Icon(Icons.album, color: Colors.white),
                    ),
                    title: Text(
                      album.title,
                      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
                    ),
                    subtitle: Text(
                      '${album.artistName} • ${album.releaseYear}',
                      style: const TextStyle(color: Color(0xFFB3B3B3), fontSize: 12),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AlbumDetailScreen(album: album),
                        ),
                      );
                    },
                  ),
                );
              }).toList(),
              const SizedBox(height: 16),
            ],
            if (_filteredArtists.isNotEmpty) ...[
              const Text(
                'Artists',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              ..._filteredArtists.map((artist) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: CircleAvatar(
                      radius: 25,
                      backgroundColor: const Color(0xFF535353),
                      child: const Icon(Icons.person, color: Colors.white),
                    ),
                    title: Text(
                      artist.name,
                      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
                    ),
                    subtitle: Text(
                      'Artist',
                      style: const TextStyle(color: Color(0xFFB3B3B3), fontSize: 12),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ArtistProfileScreen(artist: artist),
                        ),
                      );
                    },
                  ),
                );
              }).toList(),
              const SizedBox(height: 16),
            ],
            if (_filteredTracks.isNotEmpty) ...[
              const Text(
                'Songs',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              ..._filteredTracks.map((track) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: const Icon(Icons.music_note, color: Color(0xFFB3B3B3)),
                    title: Text(
                      track.title,
                      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
                    ),
                    subtitle: Text(
                      track.artistName,
                      style: const TextStyle(color: Color(0xFFB3B3B3), fontSize: 12),
                    ),
                    trailing: Text(
                      track.duration,
                      style: const TextStyle(color: Color(0xFFB3B3B3), fontSize: 12),
                    ),
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Playing ${track.title}'),
                          backgroundColor: const Color(0xFF282828),
                        ),
                      );
                    },
                  ),
                );
              }).toList(),
            ],
            if (_filteredAlbums.isEmpty &&
                _filteredArtists.isEmpty &&
                _filteredTracks.isEmpty) ...[
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Column(
                    children: [
                      Icon(Icons.search_off, size: 80, color: const Color(0xFF535353)),
                      const SizedBox(height: 16),
                      const Text(
                        'No results found',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Try searching with different keywords',
                        style: TextStyle(color: Color(0xFFB3B3B3)),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
