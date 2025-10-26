import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notificationsEnabled = true;
  bool _autoPlay = false;
  bool _highQualityAudio = true;
  double _audioQuality = 256;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Settings'),
        backgroundColor: const Color(0xFF121212),
      ),
      body: ListView(
        children: [
          // User Profile Section
          Container(
            padding: const EdgeInsets.all(24.0),
            color: const Color(0xFF181818),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 40,
                  backgroundColor: Color(0xFF535353),
                  child: Icon(Icons.person, size: 40, color: Colors.white),
                ),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Music Lover',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'musiclover@example.com',
                      style: TextStyle(
                        color: const Color(0xFFB3B3B3),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),

          // Account Settings
          _buildSectionHeader('ACCOUNT'),
          _buildListTile(
            Icons.person_outline,
            'Edit Profile',
            Icons.chevron_right,
            () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Opening profile editor...'),
                  backgroundColor: Color(0xFF282828),
                ),
              );
            },
          ),
          _buildListTile(
            Icons.lock_outline,
            'Change Password',
            Icons.chevron_right,
            () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Opening password change...'),
                  backgroundColor: Color(0xFF282828),
                ),
              );
            },
          ),
          _buildListTile(
            Icons.credit_card,
            'Subscription',
            Icons.chevron_right,
            () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Opening subscription...'),
                  backgroundColor: Color(0xFF282828),
                ),
              );
            },
          ),

          const SizedBox(height: 16),

          // Playback Settings
          _buildSectionHeader('PLAYBACK'),
          SwitchListTile(
            secondary: const Icon(Icons.autorenew, color: Color(0xFFB3B3B3)),
            title: const Text('Auto-play', style: TextStyle(color: Colors.white)),
            subtitle: const Text(
              'Automatically play similar songs',
              style: TextStyle(color: Color(0xFFB3B3B3), fontSize: 12),
            ),
            value: _autoPlay,
            activeColor: const Color(0xFF1DB954),
            onChanged: (bool value) {
              setState(() {
                _autoPlay = value;
              });
            },
          ),
          SwitchListTile(
            secondary: const Icon(Icons.high_quality, color: Color(0xFFB3B3B3)),
            title: const Text('High Quality Audio', style: TextStyle(color: Colors.white)),
            subtitle: const Text(
              'Better sound quality, more data',
              style: TextStyle(color: Color(0xFFB3B3B3), fontSize: 12),
            ),
            value: _highQualityAudio,
            activeColor: const Color(0xFF1DB954),
            onChanged: (bool value) {
              setState(() {
                _highQualityAudio = value;
              });
            },
          ),
          ListTile(
            leading: const Icon(Icons.graphic_eq, color: Color(0xFFB3B3B3)),
            title: const Text('Audio Quality', style: TextStyle(color: Colors.white)),
            subtitle: Text(
              '${_audioQuality.toInt()} kbps',
              style: const TextStyle(color: Color(0xFFB3B3B3), fontSize: 12),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SliderTheme(
              data: SliderTheme.of(context).copyWith(
                activeTrackColor: const Color(0xFF1DB954),
                inactiveTrackColor: const Color(0xFF535353),
                thumbColor: const Color(0xFF1DB954),
              ),
              child: Slider(
                value: _audioQuality,
                min: 128,
                max: 320,
                divisions: 3,
                label: '${_audioQuality.toInt()} kbps',
                onChanged: (double value) {
                  setState(() {
                    _audioQuality = value;
                  });
                },
              ),
            ),
          ),

          const SizedBox(height: 16),

          // Notification Settings
          _buildSectionHeader('NOTIFICATIONS'),
          SwitchListTile(
            secondary: const Icon(Icons.notifications_outlined, color: Color(0xFFB3B3B3)),
            title: const Text('Push Notifications', style: TextStyle(color: Colors.white)),
            subtitle: const Text(
              'Get notified about new releases',
              style: TextStyle(color: Color(0xFFB3B3B3), fontSize: 12),
            ),
            value: _notificationsEnabled,
            activeColor: const Color(0xFF1DB954),
            onChanged: (bool value) {
              setState(() {
                _notificationsEnabled = value;
              });
            },
          ),
          _buildListTile(
            Icons.email_outlined,
            'Email Notifications',
            Icons.chevron_right,
            () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Opening email settings...'),
                  backgroundColor: Color(0xFF282828),
                ),
              );
            },
          ),

          const SizedBox(height: 16),

          // Other Settings
          _buildSectionHeader('OTHER'),
          _buildListTile(
            Icons.language,
            'Language',
            Icons.chevron_right,
            () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Opening language settings...'),
                  backgroundColor: Color(0xFF282828),
                ),
              );
            },
            subtitle: 'English',
          ),
          _buildListTile(
            Icons.storage,
            'Storage',
            Icons.chevron_right,
            () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Opening storage settings...'),
                  backgroundColor: Color(0xFF282828),
                ),
              );
            },
            subtitle: 'Manage downloaded music',
          ),
          _buildListTile(
            Icons.help_outline,
            'Help & Support',
            Icons.chevron_right,
            () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Opening help center...'),
                  backgroundColor: Color(0xFF282828),
                ),
              );
            },
          ),
          _buildListTile(
            Icons.info_outline,
            'About',
            Icons.chevron_right,
            () {
              _showAboutDialog(context);
            },
          ),

          const SizedBox(height: 24),

          // Logout Button
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: OutlinedButton(
              onPressed: () {
                _showLogoutDialog(context);
              },
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                side: const BorderSide(color: Color(0xFF535353)),
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
              child: const Text(
                'LOG OUT',
                style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1.5),
              ),
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.bold,
          color: Color(0xFFB3B3B3),
          letterSpacing: 1.5,
        ),
      ),
    );
  }

  Widget _buildListTile(
    IconData leadingIcon,
    String title,
    IconData? trailingIcon,
    VoidCallback onTap, {
    String? subtitle,
  }) {
    return ListTile(
      leading: Icon(leadingIcon, color: const Color(0xFFB3B3B3)),
      title: Text(title, style: const TextStyle(color: Colors.white)),
      subtitle: subtitle != null
          ? Text(
              subtitle,
              style: const TextStyle(color: Color(0xFFB3B3B3), fontSize: 12),
            )
          : null,
      trailing: trailingIcon != null
          ? Icon(trailingIcon, color: const Color(0xFFB3B3B3))
          : null,
      onTap: onTap,
    );
  }

  void _showAboutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color(0xFF282828),
          title: const Text(
            'About Music Catalog',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          content: const Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Version 1.0.0', style: TextStyle(color: Color(0xFFB3B3B3))),
              SizedBox(height: 8),
              Text(
                'A comprehensive music catalog app for discovering and organizing your favorite music.',
                style: TextStyle(color: Color(0xFFB3B3B3)),
              ),
              SizedBox(height: 16),
              Text('© 2025 Music Catalog App', style: TextStyle(color: Color(0xFFB3B3B3))),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: TextButton.styleFrom(
                foregroundColor: const Color(0xFF1DB954),
              ),
              child: const Text('CLOSE', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ],
        );
      },
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color(0xFF282828),
          title: const Text(
            'Log Out',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          content: const Text(
            'Are you sure you want to log out?',
            style: TextStyle(color: Color(0xFFB3B3B3)),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: TextButton.styleFrom(
                foregroundColor: const Color(0xFFB3B3B3),
              ),
              child: const Text('CANCEL'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Logged out successfully'),
                    backgroundColor: Color(0xFF282828),
                  ),
                );
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
              ),
              child: const Text('LOG OUT', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ],
        );
      },
    );
  }
}
