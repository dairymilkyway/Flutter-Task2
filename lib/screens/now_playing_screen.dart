import 'package:flutter/material.dart';
import '../models/track.dart';

class NowPlayingScreen extends StatefulWidget {
  final Track track;
  final String? albumTitle;
  final List<Track>? playlist;

  const NowPlayingScreen({
    super.key,
    required this.track,
    this.albumTitle,
    this.playlist,
  });

  @override
  State<NowPlayingScreen> createState() => _NowPlayingScreenState();
}

class _NowPlayingScreenState extends State<NowPlayingScreen> {
  bool isPlaying = true;
  bool isShuffle = false;
  bool isRepeat = false;
  bool isLiked = false;
  double currentPosition = 0.3; // 30% through the song

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.keyboard_arrow_down, size: 32, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          widget.albumTitle ?? 'Now Playing',
          style: const TextStyle(fontSize: 14, color: Color(0xFFB3B3B3)),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.white),
            onPressed: () => _showOptions(context),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const Spacer(flex: 1),

            // Album Art
            Container(
              width: double.infinity,
              height: 350,
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
                    color: Colors.black.withOpacity(0.5),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Center(
                child: Icon(
                  Icons.music_note,
                  size: 120,
                  color: Colors.white.withOpacity(0.9),
                ),
              ),
            ),

            const Spacer(flex: 1),

            // Track Info
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.track.title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        widget.track.artistName,
                        style: const TextStyle(
                          color: Color(0xFFB3B3B3),
                          fontSize: 16,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: Icon(
                    isLiked ? Icons.favorite : Icons.favorite_border,
                    color: isLiked ? const Color(0xFF1DB954) : Colors.white,
                    size: 28,
                  ),
                  onPressed: () {
                    setState(() {
                      isLiked = !isLiked;
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          isLiked ? 'Added to Liked Songs' : 'Removed from Liked Songs',
                        ),
                        backgroundColor: isLiked ? const Color(0xFF1DB954) : const Color(0xFF282828),
                        duration: const Duration(seconds: 1),
                      ),
                    );
                  },
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Progress Bar
            Column(
              children: [
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    trackHeight: 3,
                    thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 6),
                    overlayShape: const RoundSliderOverlayShape(overlayRadius: 14),
                    activeTrackColor: Colors.white,
                    inactiveTrackColor: const Color(0xFF535353),
                    thumbColor: Colors.white,
                  ),
                  child: Slider(
                    value: currentPosition,
                    onChanged: (value) {
                      setState(() {
                        currentPosition = value;
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _formatDuration(currentPosition),
                        style: const TextStyle(
                          color: Color(0xFFB3B3B3),
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        widget.track.duration,
                        style: const TextStyle(
                          color: Color(0xFFB3B3B3),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // Playback Controls
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: Icon(
                    isShuffle ? Icons.shuffle_on_outlined : Icons.shuffle,
                    color: isShuffle ? const Color(0xFF1DB954) : const Color(0xFFB3B3B3),
                    size: 24,
                  ),
                  onPressed: () {
                    setState(() {
                      isShuffle = !isShuffle;
                    });
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.skip_previous, color: Colors.white, size: 36),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Previous track'),
                        backgroundColor: Color(0xFF282828),
                        duration: Duration(seconds: 1),
                      ),
                    );
                  },
                ),
                Container(
                  width: 64,
                  height: 64,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: Icon(
                      isPlaying ? Icons.pause : Icons.play_arrow,
                      color: Colors.black,
                      size: 36,
                    ),
                    onPressed: () {
                      setState(() {
                        isPlaying = !isPlaying;
                      });
                    },
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.skip_next, color: Colors.white, size: 36),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Next track'),
                        backgroundColor: Color(0xFF282828),
                        duration: Duration(seconds: 1),
                      ),
                    );
                  },
                ),
                IconButton(
                  icon: Icon(
                    isRepeat ? Icons.repeat_one : Icons.repeat,
                    color: isRepeat ? const Color(0xFF1DB954) : const Color(0xFFB3B3B3),
                    size: 24,
                  ),
                  onPressed: () {
                    setState(() {
                      isRepeat = !isRepeat;
                    });
                  },
                ),
              ],
            ),

            const SizedBox(height: 16),

            // Bottom Actions
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.devices, color: Color(0xFFB3B3B3), size: 24),
                  onPressed: () {
                    _showDevicesDialog(context);
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.queue_music, color: Color(0xFFB3B3B3), size: 24),
                  onPressed: () {
                    _showQueueDialog(context);
                  },
                ),
              ],
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  String _formatDuration(double percentage) {
    // Parse the duration string (e.g., "3:29")
    final parts = widget.track.duration.split(':');
    if (parts.length != 2) return '0:00';
    
    final minutes = int.tryParse(parts[0]) ?? 0;
    final seconds = int.tryParse(parts[1]) ?? 0;
    final totalSeconds = minutes * 60 + seconds;
    
    final currentSeconds = (totalSeconds * percentage).round();
    final currentMinutes = currentSeconds ~/ 60;
    final remainingSeconds = currentSeconds % 60;
    
    return '$currentMinutes:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  void _showOptions(BuildContext context) {
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
              leading: const Icon(Icons.album, color: Colors.white),
              title: const Text('Go to album', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pop(context);
                Navigator.pop(context); // Go back to album
              },
            ),
            ListTile(
              leading: const Icon(Icons.person, color: Colors.white),
              title: const Text('Go to artist', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Opening artist profile...'),
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
                    content: Text('Sharing ${widget.track.title}'),
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

  void _showDevicesDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF282828),
        title: const Text('Available Devices', style: TextStyle(color: Colors.white)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.phone_android, color: Color(0xFF1DB954)),
              title: const Text('This Phone', style: TextStyle(color: Colors.white)),
              subtitle: const Text('Currently playing', style: TextStyle(color: Color(0xFF1DB954), fontSize: 12)),
              dense: true,
            ),
            ListTile(
              leading: const Icon(Icons.speaker, color: Colors.white),
              title: const Text('Living Room Speaker', style: TextStyle(color: Colors.white)),
              dense: true,
              onTap: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Switched to Living Room Speaker'),
                    backgroundColor: Color(0xFF1DB954),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.laptop, color: Colors.white),
              title: const Text('My Computer', style: TextStyle(color: Colors.white)),
              dense: true,
              onTap: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Switched to My Computer'),
                    backgroundColor: Color(0xFF1DB954),
                  ),
                );
              },
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('CLOSE', style: TextStyle(color: Color(0xFF1DB954))),
          ),
        ],
      ),
    );
  }

  void _showQueueDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF282828),
        title: const Text('Queue', style: TextStyle(color: Colors.white)),
        content: SizedBox(
          width: double.maxFinite,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'NOW PLAYING',
                style: TextStyle(
                  color: Color(0xFFB3B3B3),
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        const Color(0xFF1DB954).withOpacity(0.6),
                        const Color(0xFF191414).withOpacity(0.8),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Icon(Icons.music_note, color: Colors.white, size: 20),
                ),
                title: Text(
                  widget.track.title,
                  style: const TextStyle(color: Color(0xFF1DB954), fontSize: 14),
                  maxLines: 1,
                ),
                subtitle: Text(
                  widget.track.artistName,
                  style: const TextStyle(color: Color(0xFFB3B3B3), fontSize: 12),
                  maxLines: 1,
                ),
                dense: true,
              ),
              const SizedBox(height: 16),
              const Text(
                'NEXT IN QUEUE',
                style: TextStyle(
                  color: Color(0xFFB3B3B3),
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              if (widget.playlist != null && widget.playlist!.length > 1)
                ...widget.playlist!
                    .where((t) => t.id != widget.track.id)
                    .take(3)
                    .map((t) => ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  const Color(0xFF1DB954).withOpacity(0.4),
                                  const Color(0xFF191414).withOpacity(0.6),
                                ],
                              ),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: const Icon(Icons.music_note, color: Colors.white, size: 20),
                          ),
                          title: Text(
                            t.title,
                            style: const TextStyle(color: Colors.white, fontSize: 14),
                            maxLines: 1,
                          ),
                          subtitle: Text(
                            t.artistName,
                            style: const TextStyle(color: Color(0xFFB3B3B3), fontSize: 12),
                            maxLines: 1,
                          ),
                          dense: true,
                        ))
              else
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Text(
                    'Queue is empty',
                    style: TextStyle(color: Color(0xFF535353), fontSize: 14),
                  ),
                ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('CLOSE', style: TextStyle(color: Color(0xFF1DB954))),
          ),
        ],
      ),
    );
  }
}
