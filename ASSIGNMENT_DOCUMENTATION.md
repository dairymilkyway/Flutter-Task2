# Music Catalog App - ITEL131-T Assignment

## Project Overview
A comprehensive Flutter application demonstrating mastery of Scaffold structure and navigation patterns for the Multi-View Mobile Application Development course.

**Theme:** A Comprehensive Music Catalog App (Focusing on Albums, Artists, and Playlists)

---

## 📱 Application Structure

### Six (6) Distinct Views

#### Screen 1: Home/Discover
**File:** `lib/screens/home_screen.dart`

**Scaffold Components:**
- ✅ `appBar` - Navigation title and notifications
- ✅ `drawer` - Global navigation menu (Library, Liked Songs, Settings)
- ✅ `bottomNavigationBar` - Persistent navigation (inherited from MainNavigationScreen)
- ✅ `body` - Featured albums and popular playlists

**Rationale:** The main landing page needs global navigation and a search/settings entry point.

---

#### Screen 2: My Playlists
**File:** `lib/screens/my_playlists_screen.dart`

**Scaffold Components:**
- ✅ `appBar` - Screen title
- ✅ `bottomNavigationBar` - Persistent navigation (inherited from MainNavigationScreen)
- ✅ `floatingActionButton` - Quick create new playlist action
- ✅ `body` - Grid view of user playlists

**Rationale:** Needs global navigation and a button to quickly create a new playlist.

---

#### Screen 3: Search
**File:** `lib/screens/search_screen.dart`

**Scaffold Components:**
- ✅ `appBar` - Screen title
- ✅ `bottomNavigationBar` - Persistent navigation (inherited from MainNavigationScreen)
- ✅ `body` - Search bar and filtered results (albums, artists, tracks)

**Rationale:** Essential for focused searching with a persistent view.

---

#### Screen 4: Album Detail
**File:** `lib/screens/album_detail_screen.dart`

**Scaffold Components:**
- ✅ `appBar` - Album title with back button and options menu
- ✅ `body` - Album information and track list

**Rationale:** A drill-down screen that needs a title and a back button, but no persistent global navigation.

**Layout Structure (Row/Column Hierarchy):**
```
Column (Main scroll view)
├── Container (Header section)
│   └── Row
│       ├── Container (Album artwork - 150x150)
│       └── Column (Album metadata)
│           ├── Text (Album title)
│           ├── Text (Artist name - clickable)
│           ├── Text (Release year)
│           └── Text (Track count)
├── Row (Play/Download controls)
│   ├── ElevatedButton (Play)
│   └── OutlinedButton (Save)
├── Column (Track list section)
│   ├── Row (Header)
│   │   ├── Text (#)
│   │   ├── Text (Title)
│   │   └── Text (Duration)
│   └── Column (List of track rows)
│       └── Row (Individual track)
│           ├── Text (Track number)
│           ├── Column (Song details)
│           │   ├── Text (Title)
│           │   └── Text (Artist)
│           ├── Text (Duration)
│           └── IconButton (More options)
```

---

#### Screen 5: Artist Profile
**File:** `lib/screens/artist_profile_screen.dart`

**Scaffold Components:**
- ✅ `appBar` - Artist name with back button and share action
- ✅ `endDrawer` - Quick links to social media and merch store
- ✅ `body` - Artist information, discography, and popular tracks

**Rationale:** Needs a dedicated title/back button. The endDrawer can house quick links to the artist's social media or merch store.

**Layout Structure (Row/Column Hierarchy):**
```
Column (Main scroll view)
├── Container (Hero section - 250px height)
│   └── Column
│       ├── CircleAvatar (Artist image)
│       ├── Text (Artist name)
│       └── Row (Action buttons)
│           ├── ElevatedButton (Follow)
│           └── IconButton (More options)
├── Column (About section)
│   ├── Text (Section header: 'About')
│   └── Text (Biography)
├── Column (Discography section)
│   ├── Row (Section header)
│   │   ├── Text ('Albums')
│   │   └── TextButton ('See All')
│   └── Horizontal ListView (Album cards)
│       └── Column (Album card)
│           ├── Container (Album cover)
│           ├── Text (Album title)
│           └── Text (Release year)
├── Column (Popular Tracks section)
│   ├── Row (Section header)
│   │   ├── Text ('Popular Tracks')
│   │   └── TextButton ('See All')
│   └── Column (Vertical list of tracks)
│       └── ListTile (Track item)
│           ├── Container (Track number badge)
│           ├── Column (Track details)
│           │   ├── Text (Title)
│           │   └── Text (Duration)
│           └── Row (Action buttons)
│               ├── IconButton (Like)
│               └── IconButton (Play)
```

---

#### Screen 6: Settings/User Profile
**File:** `lib/screens/settings_screen.dart`

**Scaffold Components:**
- ✅ `appBar` - Settings title with back button
- ✅ `body` - User profile and configuration options

**Rationale:** A simple screen for configurations, primarily utilizing an appBar for the title and a back button.

---

## 🧭 Navigation Flow Strategy

### A. Persistent Navigation (BottomNavigationBar)

**Implementation:** `lib/main.dart` - `MainNavigationScreen`

**Three accessible views:**
1. **Home/Discover** (Index 0)
2. **My Playlists** (Index 1)
3. **Search** (Index 2)

Users can switch between these screens at any time using the bottom navigation bar.

---

### B. Sequential Navigation (Drill-down Pattern)

**Path:** Home → Album Detail → Artist Profile

**Step-by-step flow:**

1. **Home/Discover Screen**
   - User sees featured albums displayed in a horizontal scrollable list
   - User taps on a featured Album tile

2. **Navigation to Album Detail**
   ```dart
   Navigator.push(
     context,
     MaterialPageRoute(
       builder: (context) => AlbumDetailScreen(album: album),
     ),
   );
   ```

3. **Album Detail Screen**
   - User views album information and track list
   - User taps on the Artist's name link (underlined and styled as clickable)

4. **Navigation to Artist Profile**
   ```dart
   Navigator.push(
     context,
     MaterialPageRoute(
       builder: (context) => ArtistProfileScreen(artist: artist),
     ),
   );
   ```

5. **Artist Profile Screen**
   - User views artist biography, discography, and popular tracks
   - User can navigate back using the AppBar back button

**Additional Sequential Paths:**
- Search → Album Detail → Artist Profile
- Search → Artist Profile

---

## 📂 Project Structure

```
lib/
├── main.dart                          # App entry point with bottom navigation
├── data/
│   └── sample_data.dart              # Sample albums, artists, tracks, playlists
├── models/
│   ├── album.dart                    # Album model
│   ├── artist.dart                   # Artist model
│   ├── playlist.dart                 # Playlist model
│   └── track.dart                    # Track model
└── screens/
    ├── home_screen.dart              # Screen 1: Home/Discover
    ├── my_playlists_screen.dart      # Screen 2: My Playlists
    ├── search_screen.dart            # Screen 3: Search
    ├── album_detail_screen.dart      # Screen 4: Album Detail
    ├── artist_profile_screen.dart    # Screen 5: Artist Profile
    └── settings_screen.dart          # Screen 6: Settings/User Profile
```

---

## ✅ Scaffold Component Usage Summary

| Screen | appBar | drawer | endDrawer | bottomNavigationBar | floatingActionButton | body |
|--------|--------|--------|-----------|---------------------|----------------------|------|
| 1. Home/Discover | ✅ | ✅ | ❌ | ✅ | ❌ | ✅ |
| 2. My Playlists | ✅ | ❌ | ❌ | ✅ | ✅ | ✅ |
| 3. Search | ✅ | ❌ | ❌ | ✅ | ❌ | ✅ |
| 4. Album Detail | ✅ | ❌ | ❌ | ❌ | ❌ | ✅ |
| 5. Artist Profile | ✅ | ❌ | ✅ | ❌ | ❌ | ✅ |
| 6. Settings | ✅ | ❌ | ❌ | ❌ | ❌ | ✅ |

**Unique Scaffold Components Used:** 5
- ✅ `appBar` (all screens)
- ✅ `drawer` (Home/Discover)
- ✅ `endDrawer` (Artist Profile)
- ✅ `bottomNavigationBar` (Home, My Playlists, Search)
- ✅ `floatingActionButton` (My Playlists)
- ✅ `body` (all screens - required, doesn't count toward minimum)

**Requirement:** Minimum 4 unique Scaffold components ✅ **EXCEEDED (5 components)**

---

## 🚀 Running the Application

### Prerequisites
- Flutter SDK installed
- Android Studio / VS Code with Flutter extensions
- An emulator or physical device

### Commands

1. **Get dependencies:**
   ```bash
   flutter pub get
   ```

2. **Run the app:**
   ```bash
   flutter run
   ```

3. **Build for release:**
   ```bash
   flutter build apk
   ```

---

## 🎯 Key Features Demonstrated

### Navigation Patterns
- ✅ **Persistent Navigation** using BottomNavigationBar
- ✅ **Sequential Navigation** using Navigator.push()
- ✅ **Drawer Navigation** for global menu access
- ✅ **End Drawer** for contextual quick actions

### Layout Mastery
- ✅ **Complex Row/Column Hierarchies** (Album Detail, Artist Profile)
- ✅ **ScrollView Implementation** (SingleChildScrollView)
- ✅ **List Views** (Vertical and Horizontal)
- ✅ **Grid Views** (Playlist grid)
- ✅ **Responsive Layouts** (Flexible, Expanded widgets)

### Scaffold Components
- ✅ **AppBar** with actions and back navigation
- ✅ **Drawer** for global navigation menu
- ✅ **EndDrawer** for quick links and settings
- ✅ **BottomNavigationBar** for persistent tab navigation
- ✅ **FloatingActionButton** for primary actions
- ✅ **SnackBar** for user feedback

### User Interactions
- ✅ **Tap Gestures** for navigation
- ✅ **Dialog Boxes** for confirmations
- ✅ **Bottom Sheets** for options menus
- ✅ **Form Inputs** (Search, Create Playlist)
- ✅ **Switch/Slider Controls** (Settings)

---

## 📝 Assignment Requirements Checklist

### 1. View Definition (Minimum 6) ✅
- [x] Screen 1: Home/Discover
- [x] Screen 2: My Playlists
- [x] Screen 3: Search
- [x] Screen 4: Album Detail
- [x] Screen 5: Artist Profile
- [x] Screen 6: Settings/User Profile

### 2. Scaffold Component Plan (Minimum 4) ✅
- [x] Used 5 unique Scaffold components (exceeds requirement)
- [x] Each component has clear rationale
- [x] body component on all views (not counted)

### 3. Navigation Flow Strategy ✅

**A. Persistent Navigation:**
- [x] BottomNavigationBar implemented
- [x] 3 views accessible: Home, My Playlists, Search

**B. Sequential Navigation:**
- [x] Multi-step drill-down path implemented
- [x] Path: Home → Album Detail → Artist Profile
- [x] Alternative paths available from Search screen

### 4. Layout Structure Outline ✅
- [x] Album Detail: Row/Column hierarchy documented and implemented
- [x] Artist Profile: Row/Column hierarchy documented and implemented
- [x] Both screens demonstrate complex layout structures

---

## 🎨 Design Highlights

- **Material Design 3** theming
- **Consistent color scheme** with purple primary color
- **Placeholder images** using colored containers with icons
- **Responsive layouts** adapting to content
- **Clear visual hierarchy** with typography and spacing
- **Interactive feedback** with SnackBars and dialogs

---

## 📚 Learning Outcomes Demonstrated

1. **Scaffold Mastery:** Comprehensive use of all major Scaffold components
2. **Navigation Patterns:** Implementation of both persistent and sequential navigation
3. **Layout Composition:** Complex Row/Column hierarchies for real-world UI
4. **State Management:** StatefulWidgets for interactive features
5. **Code Organization:** Modular structure with separate models and screens
6. **User Experience:** Intuitive navigation flow and user feedback

---

## 👨‍💻 Development Notes

- All screens are fully functional with sample data
- Navigation flows work seamlessly
- Code is well-commented for educational purposes
- Follows Flutter best practices and conventions
- Ready for expansion with real data sources and APIs

---

## 📄 License

This is an academic project for ITEL131-T: IT Elective 2 course.

---

**Developed by:** [Your Name]  
**Course:** ITEL131-T: IT Elective 2  
**Assignment:** Multi-View Mobile Application Development  
**Date:** October 26, 2025
