import '../models/track.dart';
import '../models/album.dart';
import '../models/artist.dart';
import '../models/playlist.dart';

// ============================================================================
// TRACKS DATABASE
// ============================================================================

// Queen Tracks
final List<Track> queenTracks = [
  Track(id: 't1', title: 'Bohemian Rhapsody', artistName: 'Queen', duration: '5:55', trackNumber: 1),
  Track(id: 't2', title: 'Killer Queen', artistName: 'Queen', duration: '3:01', trackNumber: 2),
  Track(id: 't3', title: 'Somebody to Love', artistName: 'Queen', duration: '4:56', trackNumber: 3),
  Track(id: 't4', title: 'We Are the Champions', artistName: 'Queen', duration: '2:59', trackNumber: 4),
  Track(id: 't5', title: 'We Will Rock You', artistName: 'Queen', duration: '2:02', trackNumber: 5),
  Track(id: 't6', title: 'Don\'t Stop Me Now', artistName: 'Queen', duration: '3:29', trackNumber: 6),
  Track(id: 't7', title: 'Under Pressure', artistName: 'Queen', duration: '4:08', trackNumber: 7),
  Track(id: 't8', title: 'Radio Ga Ga', artistName: 'Queen', duration: '5:43', trackNumber: 8),
];

// The Weeknd Tracks
final List<Track> weekndTracks = [
  Track(id: 't9', title: 'Blinding Lights', artistName: 'The Weeknd', duration: '3:20', trackNumber: 1),
  Track(id: 't10', title: 'Save Your Tears', artistName: 'The Weeknd', duration: '3:35', trackNumber: 2),
  Track(id: 't11', title: 'Starboy', artistName: 'The Weeknd', duration: '3:50', trackNumber: 3),
  Track(id: 't12', title: 'The Hills', artistName: 'The Weeknd', duration: '4:02', trackNumber: 4),
  Track(id: 't13', title: 'Can\'t Feel My Face', artistName: 'The Weeknd', duration: '3:33', trackNumber: 5),
  Track(id: 't14', title: 'I Feel It Coming', artistName: 'The Weeknd', duration: '4:29', trackNumber: 6),
];

// Taylor Swift Tracks
final List<Track> swiftTracks = [
  Track(id: 't15', title: 'Anti-Hero', artistName: 'Taylor Swift', duration: '3:20', trackNumber: 1),
  Track(id: 't16', title: 'Shake It Off', artistName: 'Taylor Swift', duration: '3:39', trackNumber: 2),
  Track(id: 't17', title: 'Blank Space', artistName: 'Taylor Swift', duration: '3:51', trackNumber: 3),
  Track(id: 't18', title: 'Love Story', artistName: 'Taylor Swift', duration: '3:55', trackNumber: 4),
  Track(id: 't19', title: 'You Belong With Me', artistName: 'Taylor Swift', duration: '3:52', trackNumber: 5),
  Track(id: 't20', title: 'Cruel Summer', artistName: 'Taylor Swift', duration: '2:58', trackNumber: 6),
];

// Daft Punk Tracks
final List<Track> daftPunkTracks = [
  Track(id: 't21', title: 'Get Lucky', artistName: 'Daft Punk', duration: '6:09', trackNumber: 1),
  Track(id: 't22', title: 'One More Time', artistName: 'Daft Punk', duration: '5:20', trackNumber: 2),
  Track(id: 't23', title: 'Harder, Better, Faster, Stronger', artistName: 'Daft Punk', duration: '3:44', trackNumber: 3),
  Track(id: 't24', title: 'Around the World', artistName: 'Daft Punk', duration: '7:09', trackNumber: 4),
  Track(id: 't25', title: 'Instant Crush', artistName: 'Daft Punk', duration: '5:37', trackNumber: 5),
];

// Billie Eilish Tracks
final List<Track> eilishTracks = [
  Track(id: 't26', title: 'bad guy', artistName: 'Billie Eilish', duration: '3:14', trackNumber: 1),
  Track(id: 't27', title: 'when the party\'s over', artistName: 'Billie Eilish', duration: '3:16', trackNumber: 2),
  Track(id: 't28', title: 'everything i wanted', artistName: 'Billie Eilish', duration: '4:05', trackNumber: 3),
  Track(id: 't29', title: 'ocean eyes', artistName: 'Billie Eilish', duration: '3:20', trackNumber: 4),
  Track(id: 't30', title: 'Therefore I Am', artistName: 'Billie Eilish', duration: '2:53', trackNumber: 5),
];

// Drake Tracks
final List<Track> drakeTracks = [
  Track(id: 't31', title: 'One Dance', artistName: 'Drake', duration: '2:54', trackNumber: 1),
  Track(id: 't32', title: 'God\'s Plan', artistName: 'Drake', duration: '3:18', trackNumber: 2),
  Track(id: 't33', title: 'Hotline Bling', artistName: 'Drake', duration: '4:27', trackNumber: 3),
  Track(id: 't34', title: 'In My Feelings', artistName: 'Drake', duration: '3:37', trackNumber: 4),
  Track(id: 't35', title: 'Nice For What', artistName: 'Drake', duration: '3:30', trackNumber: 5),
];

// Nirvana Tracks
final List<Track> nirvanaTracks = [
  Track(id: 't36', title: 'Smells Like Teen Spirit', artistName: 'Nirvana', duration: '5:01', trackNumber: 1),
  Track(id: 't37', title: 'Come As You Are', artistName: 'Nirvana', duration: '3:38', trackNumber: 2),
  Track(id: 't38', title: 'Lithium', artistName: 'Nirvana', duration: '4:17', trackNumber: 3),
  Track(id: 't39', title: 'In Bloom', artistName: 'Nirvana', duration: '4:14', trackNumber: 4),
  Track(id: 't40', title: 'Heart-Shaped Box', artistName: 'Nirvana', duration: '4:41', trackNumber: 5),
];

// Ed Sheeran Tracks
final List<Track> sheeranTracks = [
  Track(id: 't41', title: 'Shape of You', artistName: 'Ed Sheeran', duration: '3:53', trackNumber: 1),
  Track(id: 't42', title: 'Perfect', artistName: 'Ed Sheeran', duration: '4:23', trackNumber: 2),
  Track(id: 't43', title: 'Thinking Out Loud', artistName: 'Ed Sheeran', duration: '4:41', trackNumber: 3),
  Track(id: 't44', title: 'Photograph', artistName: 'Ed Sheeran', duration: '4:18', trackNumber: 4),
  Track(id: 't45', title: 'Shivers', artistName: 'Ed Sheeran', duration: '3:27', trackNumber: 5),
];

// All Tracks Combined
final List<Track> sampleTracks = [
  ...queenTracks,
  ...weekndTracks,
  ...swiftTracks,
  ...daftPunkTracks,
  ...eilishTracks,
  ...drakeTracks,
  ...nirvanaTracks,
  ...sheeranTracks,
];

// ============================================================================
// ALBUMS DATABASE
// ============================================================================

final List<Album> sampleAlbums = [
  // Rock Classics
  Album(
    id: 'album1',
    title: 'Greatest Hits',
    artistName: 'Queen',
    artistId: 'artist1',
    coverUrl: '',
    releaseYear: '1981',
    tracks: queenTracks,
  ),
  Album(
    id: 'album7',
    title: 'Nevermind',
    artistName: 'Nirvana',
    artistId: 'artist7',
    coverUrl: '',
    releaseYear: '1991',
    tracks: nirvanaTracks,
  ),
  
  // Pop & Contemporary
  Album(
    id: 'album2',
    title: 'After Hours',
    artistName: 'The Weeknd',
    artistId: 'artist2',
    coverUrl: '',
    releaseYear: '2020',
    tracks: weekndTracks,
  ),
  Album(
    id: 'album3',
    title: 'Midnights',
    artistName: 'Taylor Swift',
    artistId: 'artist3',
    coverUrl: '',
    releaseYear: '2022',
    tracks: swiftTracks,
  ),
  Album(
    id: 'album8',
    title: '÷ (Divide)',
    artistName: 'Ed Sheeran',
    artistId: 'artist8',
    coverUrl: '',
    releaseYear: '2017',
    tracks: sheeranTracks,
  ),
  
  // Electronic & Alternative
  Album(
    id: 'album4',
    title: 'Random Access Memories',
    artistName: 'Daft Punk',
    artistId: 'artist4',
    coverUrl: '',
    releaseYear: '2013',
    tracks: daftPunkTracks,
  ),
  Album(
    id: 'album5',
    title: 'Happier Than Ever',
    artistName: 'Billie Eilish',
    artistId: 'artist5',
    coverUrl: '',
    releaseYear: '2021',
    tracks: eilishTracks,
  ),
  
  // Hip-Hop
  Album(
    id: 'album6',
    title: 'Scorpion',
    artistName: 'Drake',
    artistId: 'artist6',
    coverUrl: '',
    releaseYear: '2018',
    tracks: drakeTracks,
  ),
];

// ============================================================================
// ARTISTS DATABASE
// ============================================================================

final List<Artist> sampleArtists = [
  Artist(
    id: 'artist1',
    name: 'Queen',
    imageUrl: '',
    bio: 'Queen are a British rock band formed in London in 1970. The band members are Freddie Mercury (lead vocals, piano), Brian May (guitar, vocals), Roger Taylor (drums, vocals), and John Deacon (bass). Queen became one of the biggest stadium rock bands in the world with their innovative sound that drew inspiration from many different genres of music.',
    socialMediaLinks: ['https://twitter.com/queenwillrock', 'https://facebook.com/Queen'],
    discography: [sampleAlbums[0]],
    popularTracks: [queenTracks[0], queenTracks[5], queenTracks[3], queenTracks[4], queenTracks[1]],
  ),
  Artist(
    id: 'artist2',
    name: 'The Weeknd',
    imageUrl: '',
    bio: 'Abel Makkonen Tesfaye, known professionally as The Weeknd, is a Canadian singer, songwriter, and record producer. Known for his sonic versatility and dark lyricism, his music explores escapism, romance, and melancholia. The Weeknd has won multiple Grammy Awards and is one of the world\'s best-selling music artists.',
    socialMediaLinks: ['https://twitter.com/theweeknd', 'https://instagram.com/theweeknd'],
    discography: [sampleAlbums[2]],
    popularTracks: [weekndTracks[0], weekndTracks[1], weekndTracks[2], weekndTracks[4], weekndTracks[3]],
  ),
  Artist(
    id: 'artist3',
    name: 'Taylor Swift',
    imageUrl: '',
    bio: 'Taylor Alison Swift is an American singer-songwriter. Her discography spans multiple genres and her narrative songwriting, which is often inspired by her personal life, has received widespread media coverage and critical praise. Swift is one of the best-selling music artists of all time, with over 200 million records sold worldwide.',
    socialMediaLinks: ['https://twitter.com/taylorswift13', 'https://instagram.com/taylorswift'],
    discography: [sampleAlbums[3]],
    popularTracks: [swiftTracks[0], swiftTracks[1], swiftTracks[5], swiftTracks[2], swiftTracks[3]],
  ),
  Artist(
    id: 'artist4',
    name: 'Daft Punk',
    imageUrl: '',
    bio: 'Daft Punk were a French electronic music duo formed in 1993 by Thomas Bangalter and Guy-Manuel de Homem-Christo. They achieved popularity in the late 1990s as part of the French house movement. The duo were known for their use of visual components, including wearing helmets and costumes during performances.',
    socialMediaLinks: ['https://twitter.com/daftpunk', 'https://instagram.com/daftpunk'],
    discography: [sampleAlbums[5]],
    popularTracks: [daftPunkTracks[0], daftPunkTracks[1], daftPunkTracks[2], daftPunkTracks[4], daftPunkTracks[3]],
  ),
  Artist(
    id: 'artist5',
    name: 'Billie Eilish',
    imageUrl: '',
    bio: 'Billie Eilish Pirate Baird O\'Connell is an American singer and songwriter. She first gained public attention in 2015 with her debut single "Ocean Eyes". Her unique sound and style has earned her multiple Grammy Awards, including Album of the Year. Known for her distinctive voice and dark, introspective lyrics.',
    socialMediaLinks: ['https://twitter.com/billieeilish', 'https://instagram.com/billieeilish'],
    discography: [sampleAlbums[6]],
    popularTracks: [eilishTracks[0], eilishTracks[3], eilishTracks[2], eilishTracks[1], eilishTracks[4]],
  ),
  Artist(
    id: 'artist6',
    name: 'Drake',
    imageUrl: '',
    bio: 'Aubrey Drake Graham is a Canadian rapper, singer, and actor. An influential figure in contemporary popular music, Drake has been credited for popularizing R&B sensibilities in hip hop. He is one of the world\'s best-selling music artists, with over 170 million records sold. Drake has won four Grammy Awards and holds several Billboard chart records.',
    socialMediaLinks: ['https://twitter.com/Drake', 'https://instagram.com/champagnepapi'],
    discography: [sampleAlbums[7]],
    popularTracks: [drakeTracks[1], drakeTracks[0], drakeTracks[4], drakeTracks[2], drakeTracks[3]],
  ),
  Artist(
    id: 'artist7',
    name: 'Nirvana',
    imageUrl: '',
    bio: 'Nirvana was an American rock band formed in Aberdeen, Washington, in 1987. Founded by lead singer and guitarist Kurt Cobain and bassist Krist Novoselic, the band went through a succession of drummers before recruiting Dave Grohl in 1990. Nirvana\'s success popularized alternative rock and they are considered one of the most influential bands in music history.',
    socialMediaLinks: ['https://twitter.com/Nirvana', 'https://facebook.com/Nirvana'],
    discography: [sampleAlbums[1]],
    popularTracks: [nirvanaTracks[0], nirvanaTracks[1], nirvanaTracks[4], nirvanaTracks[2], nirvanaTracks[3]],
  ),
  Artist(
    id: 'artist8',
    name: 'Ed Sheeran',
    imageUrl: '',
    bio: 'Edward Christopher Sheeran is an English singer-songwriter. Born in Halifax, West Yorkshire, he began recording music in 2004 and independently released his debut extended play, No. 5 Collaborations Project. Known for his acoustic guitar-based songs and heartfelt lyrics, Sheeran has become one of the world\'s best-selling music artists.',
    socialMediaLinks: ['https://twitter.com/edsheeran', 'https://instagram.com/teddysphotos'],
    discography: [sampleAlbums[4]],
    popularTracks: [sheeranTracks[0], sheeranTracks[1], sheeranTracks[2], sheeranTracks[4], sheeranTracks[3]],
  ),
];

// ============================================================================
// PLAYLISTS DATABASE
// ============================================================================

final List<Playlist> samplePlaylists = [
  Playlist(
    id: 'playlist1',
    name: 'Today\'s Top Hits',
    description: 'The hottest tracks right now',
    coverUrl: '',
    tracks: [
      weekndTracks[0], swiftTracks[0], sheeranTracks[0],
      eilishTracks[0], drakeTracks[1], weekndTracks[1],
    ],
  ),
  Playlist(
    id: 'playlist2',
    name: 'Rock Classics',
    description: 'Classic rock anthems that never get old',
    coverUrl: '',
    tracks: [
      queenTracks[0], nirvanaTracks[0], queenTracks[5],
      nirvanaTracks[4], queenTracks[3], queenTracks[4],
    ],
  ),
  Playlist(
    id: 'playlist3',
    name: 'Chill Vibes',
    description: 'Lay back and relax',
    coverUrl: '',
    tracks: [
      eilishTracks[1], sheeranTracks[1], weekndTracks[1],
      swiftTracks[3], sheeranTracks[3], eilishTracks[3],
    ],
  ),
  Playlist(
    id: 'playlist4',
    name: 'Party Playlist',
    description: 'Turn up the volume!',
    coverUrl: '',
    tracks: [
      daftPunkTracks[0], drakeTracks[0], weekndTracks[2],
      swiftTracks[1], daftPunkTracks[1], queenTracks[5],
    ],
  ),
  Playlist(
    id: 'playlist5',
    name: 'Workout Mix',
    description: 'Get pumped with these high-energy tracks',
    coverUrl: '',
    tracks: [
      queenTracks[4], nirvanaTracks[0], drakeTracks[1],
      swiftTracks[5], daftPunkTracks[2], weekndTracks[2],
    ],
  ),
  Playlist(
    id: 'playlist6',
    name: 'Late Night Drive',
    description: 'Perfect soundtrack for night drives',
    coverUrl: '',
    tracks: [
      weekndTracks[3], daftPunkTracks[4], sheeranTracks[2],
      eilishTracks[2], drakeTracks[2], weekndTracks[5],
    ],
  ),
];
