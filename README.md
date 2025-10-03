A Flutter-based News Application that fetches and displays the latest news articles in a clean, modern UI.

It supports breaking news, recommendations, search with filters, dark mode, and detailed article views.

✨ Features

	•	📌 Breaking News Carousel – Auto-sliding top headlines
  
	•	📃 All News List – Explore full news feed with infinite scrolling
  
	•	🔎 Search Functionality – Filter news by keywords
  
	•	🎯 Category Filters – Filter by Politics, Sports, Education, Games, etc.
  
	•	🌙 Dark Mode Support – Toggle between light & dark themes
  
	•	📖 Detailed Article Page – Full-screen article view with image background
  
	•	🔄 State Management – Powered by Provider package

  🛠️ Tech Stack
  
	•	Framework: Flutter
  
	•	State Management: Provider
  
	•	Networking: Custom NewsService for API calls
  
	•	UI/UX: Material Design, Carousel Slider, Bottom Navigation
  
	•	Language: Dart

  lib/
  
│── models/            # Data models (NewsModel)

│── pages/             # Screens (News, Search, Settings, Detail)

│── providers/         # State management (NewsProvider, ThemeProvider)

│── services/          # API service layer

│── utils/             # Constants, enums, extensions

│── widgets/           # Reusable widgets (NewsTile, BottomNavigation)

│── main.dart          # Entry point





To Clone the repository

  git clone https://github.com/mrtanonur/newshive.git

  cd newshive

Install dependencies

  flutter pub get

Run the app

  flutter run
