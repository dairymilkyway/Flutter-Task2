import 'package:flutter/material.dart';
import '../data/sample_data.dart';
import '../models/album.dart';
import '../models/artist.dart';
import '../models/track.dart';
import 'album_detail_screen.dart';
import 'artist_profile_screen.dart';

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
      appBar: AppBar(
        title: const Text('Search'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search for songs, artists, albums...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: _searchQuery.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          setState(() {
                            _searchController.clear();
                            _searchQuery = '';
                          });
                        },
                      )
                    : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                filled: true,
                fillColor: Colors.grey[200],
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
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Browse Categories',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 1.5,
              children: [
                _buildCategoryCard('Rock', Colors.red[400]!),
                _buildCategoryCard('Pop', Colors.blue[400]!),
                _buildCategoryCard('Jazz', Colors.orange[400]!),
                _buildCategoryCard('Classical', Colors.purple[400]!),
                _buildCategoryCard('Hip Hop', Colors.green[400]!),
                _buildCategoryCard('Electronic', Colors.teal[400]!),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryCard(String title, Color color) {
    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Browsing $title music')),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
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
              Text(
                'Albums',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 8),
              ..._filteredAlbums.map((album) {
                return ListTile(
                  leading: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.purple[200],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(Icons.album, color: Colors.white),
                  ),
                  title: Text(album.title),
                  subtitle: Text(album.artistName),
                  trailing: Text(album.releaseYear),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AlbumDetailScreen(album: album),
                      ),
                    );
                  },
                );
              }).toList(),
              const SizedBox(height: 16),
            ],
            if (_filteredArtists.isNotEmpty) ...[
              Text(
                'Artists',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 8),
              ..._filteredArtists.map((artist) {
                return ListTile(
                  leading: CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.blue[200],
                    child: const Icon(Icons.person, color: Colors.white),
                  ),
                  title: Text(artist.name),
                  subtitle: Text('${artist.discography.length} album(s)'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ArtistProfileScreen(artist: artist),
                      ),
                    );
                  },
                );
              }).toList(),
              const SizedBox(height: 16),
            ],
            if (_filteredTracks.isNotEmpty) ...[
              Text(
                'Songs',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 8),
              ..._filteredTracks.map((track) {
                return ListTile(
                  leading: const Icon(Icons.music_note),
                  title: Text(track.title),
                  subtitle: Text(track.artistName),
                  trailing: Text(track.duration),
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Playing ${track.title}')),
                    );
                  },
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
                      Icon(Icons.search_off, size: 80, color: Colors.grey[400]),
                      const SizedBox(height: 16),
                      Text(
                        'No results found',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey[600],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Try searching with different keywords',
                        style: TextStyle(color: Colors.grey[500]),
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
