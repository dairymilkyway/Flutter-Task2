import '../models/track.dart';
import '../models/album.dart';
import '../models/artist.dart';
import '../models/playlist.dart';

// Sample Tracks
final List<Track> sampleTracks = [
  Track(
    id: '1',
    title: 'Bohemian Rhapsody',
    artistName: 'Queen',
    duration: '5:55',
    trackNumber: 1,
  ),
  Track(
    id: '2',
    title: 'Killer Queen',
    artistName: 'Queen',
    duration: '3:01',
    trackNumber: 2,
  ),
  Track(
    id: '3',
    title: 'Somebody to Love',
    artistName: 'Queen',
    duration: '4:56',
    trackNumber: 3,
  ),
  Track(
    id: '4',
    title: 'We Are the Champions',
    artistName: 'Queen',
    duration: '2:59',
    trackNumber: 4,
  ),
  Track(
    id: '5',
    title: 'We Will Rock You',
    artistName: 'Queen',
    duration: '2:02',
    trackNumber: 5,
  ),
  Track(
    id: '6',
    title: 'Smells Like Teen Spirit',
    artistName: 'Nirvana',
    duration: '5:01',
    trackNumber: 1,
  ),
  Track(
    id: '7',
    title: 'Come As You Are',
    artistName: 'Nirvana',
    duration: '3:38',
    trackNumber: 2,
  ),
  Track(
    id: '8',
    title: 'Lithium',
    artistName: 'Nirvana',
    duration: '4:17',
    trackNumber: 3,
  ),
  Track(
    id: '9',
    title: 'In Bloom',
    artistName: 'Nirvana',
    duration: '4:14',
    trackNumber: 4,
  ),
  Track(
    id: '10',
    title: 'Stairway to Heaven',
    artistName: 'Led Zeppelin',
    duration: '8:02',
    trackNumber: 1,
  ),
  Track(
    id: '11',
    title: 'Black Dog',
    artistName: 'Led Zeppelin',
    duration: '4:54',
    trackNumber: 2,
  ),
  Track(
    id: '12',
    title: 'Whole Lotta Love',
    artistName: 'Led Zeppelin',
    duration: '5:34',
    trackNumber: 3,
  ),
];

// Sample Albums
final List<Album> sampleAlbums = [
  Album(
    id: 'album1',
    title: 'A Night at the Opera',
    artistName: 'Queen',
    artistId: 'artist1',
    coverUrl: 'https://via.placeholder.com/300x300/9C27B0/FFFFFF?text=Queen',
    releaseYear: '1975',
    tracks: sampleTracks.sublist(0, 5),
  ),
  Album(
    id: 'album2',
    title: 'Nevermind',
    artistName: 'Nirvana',
    artistId: 'artist2',
    coverUrl: 'https://via.placeholder.com/300x300/2196F3/FFFFFF?text=Nirvana',
    releaseYear: '1991',
    tracks: sampleTracks.sublist(5, 9),
  ),
  Album(
    id: 'album3',
    title: 'Led Zeppelin IV',
    artistName: 'Led Zeppelin',
    artistId: 'artist3',
    coverUrl: 'https://via.placeholder.com/300x300/FF5722/FFFFFF?text=Led+Zeppelin',
    releaseYear: '1971',
    tracks: sampleTracks.sublist(9, 12),
  ),
];

// Sample Artists
final List<Artist> sampleArtists = [
  Artist(
    id: 'artist1',
    name: 'Queen',
    imageUrl: 'https://via.placeholder.com/400x400/9C27B0/FFFFFF?text=Queen',
    bio: 'Queen are a British rock band formed in London in 1970. Their classic line-up was Freddie Mercury, Brian May, Roger Taylor and John Deacon.',
    socialMediaLinks: [
      'https://twitter.com/queenwillrock',
      'https://facebook.com/Queen',
    ],
    discography: [sampleAlbums[0]],
    popularTracks: sampleTracks.sublist(0, 5),
  ),
  Artist(
    id: 'artist2',
    name: 'Nirvana',
    imageUrl: 'https://via.placeholder.com/400x400/2196F3/FFFFFF?text=Nirvana',
    bio: 'Nirvana was an American rock band formed in Aberdeen, Washington, in 1987. Founded by lead singer and guitarist Kurt Cobain and bassist Krist Novoselic.',
    socialMediaLinks: [
      'https://twitter.com/Nirvana',
      'https://facebook.com/Nirvana',
    ],
    discography: [sampleAlbums[1]],
    popularTracks: sampleTracks.sublist(5, 9),
  ),
  Artist(
    id: 'artist3',
    name: 'Led Zeppelin',
    imageUrl: 'https://via.placeholder.com/400x400/FF5722/FFFFFF?text=Led+Zeppelin',
    bio: 'Led Zeppelin were an English rock band formed in London in 1968. Comprising vocalist Robert Plant, guitarist Jimmy Page, bassist/keyboardist John Paul Jones, and drummer John Bonham.',
    socialMediaLinks: [
      'https://twitter.com/ledzeppelin',
      'https://facebook.com/ledzeppelin',
    ],
    discography: [sampleAlbums[2]],
    popularTracks: sampleTracks.sublist(9, 12),
  ),
];

// Sample Playlists
final List<Playlist> samplePlaylists = [
  Playlist(
    id: 'playlist1',
    name: 'Rock Classics',
    coverUrl: 'https://via.placeholder.com/300x300/4CAF50/FFFFFF?text=Rock+Classics',
    tracks: [
      sampleTracks[0],
      sampleTracks[5],
      sampleTracks[9],
    ],
  ),
  Playlist(
    id: 'playlist2',
    name: 'My Favorites',
    coverUrl: 'https://via.placeholder.com/300x300/E91E63/FFFFFF?text=My+Favorites',
    tracks: [
      sampleTracks[1],
      sampleTracks[6],
      sampleTracks[10],
    ],
  ),
  Playlist(
    id: 'playlist3',
    name: 'Workout Mix',
    coverUrl: 'https://via.placeholder.com/300x300/FF9800/FFFFFF?text=Workout+Mix',
    tracks: [
      sampleTracks[4],
      sampleTracks[5],
      sampleTracks[11],
    ],
  ),
];
