# Music Catalog App - Navigation Flow Diagram

## 📊 Visual Navigation Architecture

```
┌─────────────────────────────────────────────────────────────────┐
│                     MainNavigationScreen                         │
│                  (Bottom Navigation Bar)                         │
│                                                                  │
│  ┌────────────┐    ┌──────────────┐    ┌────────────┐         │
│  │   Home     │    │ My Playlists │    │   Search   │         │
│  │  (Index 0) │    │   (Index 1)  │    │  (Index 2) │         │
│  └────────────┘    └──────────────┘    └────────────┘         │
└─────────────────────────────────────────────────────────────────┘
       │                     │                    │
       │                     │                    │
       ▼                     ▼                    ▼
┌─────────────┐      ┌──────────────┐     ┌─────────────┐
│    HOME     │      │ MY PLAYLISTS │     │   SEARCH    │
│  Screen 1   │      │   Screen 2   │     │  Screen 3   │
├─────────────┤      ├──────────────┤     ├─────────────┤
│ • appBar    │      │ • appBar     │     │ • appBar    │
│ • drawer    │      │ • floatingAB │     │ • body      │
│ • bottomNav │      │ • bottomNav  │     │ • bottomNav │
│ • body      │      │ • body       │     │             │
└─────────────┘      └──────────────┘     └─────────────┘
       │                                           │
       │ Tap Album                                 │ Tap Album/Artist
       │                                           │
       ├───────────────────────────────────────────┤
       │                                           │
       ▼                                           ▼
┌─────────────────────────────────────────────────────────┐
│                  ALBUM DETAIL                           │
│                   Screen 4                              │
├─────────────────────────────────────────────────────────┤
│ • appBar (with back button)                             │
│ • body (Column/Row layout):                             │
│   - Row: Album cover + Metadata                         │
│   - Row: Play/Save controls                             │
│   - Column: Track list                                  │
│     - Row: Header (#, Title, Duration)                  │
│     - Column: Individual track rows                     │
└─────────────────────────────────────────────────────────┘
       │
       │ Tap Artist Name
       │
       ▼
┌─────────────────────────────────────────────────────────┐
│                 ARTIST PROFILE                          │
│                   Screen 5                              │
├─────────────────────────────────────────────────────────┤
│ • appBar (with back button)                             │
│ • endDrawer (Social media & merch links)                │
│ • body (Column/Row layout):                             │
│   - Column: Hero section                                │
│     - Row: Artist image + Follow button                 │
│   - Column: About section                               │
│   - Column: Discography                                 │
│     - Row: Section header                               │
│     - Row: Horizontal scrollable albums                 │
│   - Column: Popular Tracks                              │
│     - Row: Section header                               │
│     - Column: Vertical track list                       │
└─────────────────────────────────────────────────────────┘


┌─────────────────────────────────────────────────────────┐
│                    SETTINGS                             │
│                   Screen 6                              │
├─────────────────────────────────────────────────────────┤
│ • appBar (with back button)                             │
│ • body (ListView):                                      │
│   - User profile section                                │
│   - Account settings                                    │
│   - Playback preferences                                │
│   - Notification settings                               │
│   - Other options                                       │
│                                                         │
│ Accessible from:                                        │
│ - Home screen drawer → Settings                         │
└─────────────────────────────────────────────────────────┘
```

---

## 🔄 Navigation Types

### 1. Persistent Navigation (Bottom Navigation Bar)
**Always visible on:**
- ✅ Home/Discover
- ✅ My Playlists
- ✅ Search

**Pattern:** Tap to switch between screens, state is preserved

---

### 2. Sequential Navigation (Push/Pop)

#### Primary Flow (3+ steps):
```
Home → Album Detail → Artist Profile
 └─→ Tap Album  └─→ Tap Artist
```

#### Alternative Flows:
```
Search → Album Detail → Artist Profile
Search → Artist Profile (direct)
Home Drawer → Settings
```

**Pattern:** Navigate forward with `Navigator.push()`, back with AppBar back button or `Navigator.pop()`

---

## 🎯 Scaffold Component Distribution

```
Component              │ Screen 1 │ Screen 2 │ Screen 3 │ Screen 4 │ Screen 5 │ Screen 6
─────────────────────────────────────────────────────────────────────────────────────────
appBar                 │    ✅    │    ✅    │    ✅    │    ✅    │    ✅    │    ✅
drawer                 │    ✅    │    ❌    │    ❌    │    ❌    │    ❌    │    ❌
endDrawer              │    ❌    │    ❌    │    ❌    │    ❌    │    ✅    │    ❌
bottomNavigationBar    │    ✅    │    ✅    │    ✅    │    ❌    │    ❌    │    ❌
floatingActionButton   │    ❌    │    ✅    │    ❌    │    ❌    │    ❌    │    ❌
body (required)        │    ✅    │    ✅    │    ✅    │    ✅    │    ✅    │    ✅
```

**Total Unique Components:** 5 (exceeds minimum of 4) ✅

---

## 📱 User Journey Examples

### Journey 1: Discover New Album
```
1. App Launch → Home Screen
2. View Featured Albums (horizontal scroll)
3. Tap "Nevermind" album
4. Navigate to Album Detail
5. View track list
6. Tap "Play" button
```

### Journey 2: Explore Artist
```
1. App Launch → Home Screen
2. Tap "Nevermind" album
3. Navigate to Album Detail
4. Tap "Nirvana" (artist name)
5. Navigate to Artist Profile
6. View discography, popular tracks
7. Tap endDrawer icon
8. Access social media links
```

### Journey 3: Search and Create Playlist
```
1. App Launch → Home Screen
2. Tap "Search" in Bottom Nav
3. Navigate to Search Screen
4. Enter "Bohemian Rhapsody"
5. Tap "My Playlists" in Bottom Nav
6. Navigate to My Playlists Screen
7. Tap FloatingActionButton (+)
8. Create new playlist
```

### Journey 4: Adjust Settings
```
1. App Launch → Home Screen
2. Open Drawer (hamburger menu)
3. Tap "Settings"
4. Navigate to Settings Screen
5. Toggle audio quality preferences
6. Tap back button to return
```

---

## 🏗️ Layout Architecture

### Album Detail Screen (Complex Layout)
```
SingleChildScrollView
└── Column (Main)
    ├── Container (Header)
    │   └── Row
    │       ├── Container (Album Art) [150x150]
    │       └── Column
    │           ├── Text (Title - 24px bold)
    │           ├── GestureDetector
    │           │   └── Text (Artist - clickable)
    │           ├── Text (Year)
    │           └── Text (Track count)
    ├── Row (Controls)
    │   ├── Expanded
    │   │   └── ElevatedButton (Play)
    │   └── Expanded
    │       └── OutlinedButton (Save)
    └── Column (Track List)
        ├── Row (Header)
        │   ├── Text (#)
        │   ├── Expanded → Text (Title)
        │   └── Text (Duration)
        └── Column (Tracks)
            └── [Multiple] Row
                ├── Text (Number)
                ├── Expanded
                │   └── Column
                │       ├── Text (Song title)
                │       └── Text (Artist)
                ├── Text (Duration)
                └── IconButton (Options)
```

### Artist Profile Screen (Complex Layout)
```
SingleChildScrollView
└── Column (Main)
    ├── Container (Hero - 250px)
    │   └── Stack
    │       ├── Column (Center)
    │       │   ├── CircleAvatar (120px diameter)
    │       │   └── Text (Artist name - 28px)
    │       └── Positioned (Bottom)
    │           └── Row
    │               ├── ElevatedButton (Follow)
    │               └── IconButton (More)
    ├── Column (About)
    │   ├── Text (Header)
    │   └── Text (Bio)
    ├── Column (Discography)
    │   ├── Row (Header)
    │   │   ├── Text ('Albums')
    │   │   └── TextButton ('See All')
    │   └── SizedBox (220px height)
    │       └── ListView (Horizontal)
    │           └── [Multiple] Column
    │               ├── Container (Album 160x160)
    │               ├── Text (Title)
    │               └── Text (Year)
    └── Column (Popular Tracks)
        ├── Row (Header)
        │   ├── Text ('Popular Tracks')
        │   └── TextButton ('See All')
        └── Column
            └── [Multiple] ListTile
                ├── Container (Badge)
                ├── Column (Details)
                │   ├── Text (Title)
                │   └── Text (Duration)
                └── Row (Actions)
                    ├── IconButton (Like)
                    └── IconButton (Play)
```

---

## ✨ Interactive Features

### Gesture Recognition
- **Tap:** Navigate, play, select
- **Scroll:** Horizontal (albums), Vertical (lists)
- **Swipe:** Drawer open/close

### User Feedback
- **SnackBar:** Instant notifications
- **Dialogs:** Confirmations, input
- **Bottom Sheets:** Options menus
- **Loading States:** (Can be added)

### State Management
- **StatefulWidget:** Playlists, Search, Settings
- **setState():** UI updates on interaction
- **Navigation State:** Preserved across bottom nav

---

## 🎓 Educational Value

This application demonstrates:
1. **Proper Scaffold Usage** - All 5 major components
2. **Navigation Patterns** - Both persistent and sequential
3. **Layout Composition** - Complex Row/Column hierarchies
4. **Code Organization** - Modular, maintainable structure
5. **User Experience** - Intuitive flow and feedback
6. **Flutter Best Practices** - Clean, documented code

---

**Ready for Demonstration and Evaluation** ✅
