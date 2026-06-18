class ProjectDetails {
  final String title;
  final String description;
  final String imageUrl;
  final List<String> technologies;
  final List<StoreItem> publishedLocations;

  ProjectDetails({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.technologies, 
    required this.publishedLocations,
  });
}
class StoreItem {
  final String name;
  final String link;
  final bool display;

  StoreItem({
    required this.name,
    required this.link, 
    this.display = true, 
  });
}

final projectsList = [
  ProjectDetails(
    title: 'Personal Portfolio Website',
    description: 'A personal portfolio website built using Flutter, showcasing my projects, skills, and experience in a visually appealing and responsive design.',
    imageUrl: 'assets/screenshots/portfolio_screenshot.png',
    technologies: ['Flutter', 'Dart'],
    publishedLocations: [
      StoreItem(
        name: 'Github',
        link: 'https://github.com/GalaxiMaster/portfolio_site',
        display: false,
      ),
      StoreItem(
        name: 'Web',
        link: ''
      ),
    ],
  ),
  ProjectDetails(
    title: 'Photo Sync',
    description: 'A desktop client for immich that allows you to view and edit your immich photos in conjunction to local files or plugged in devices.',
    imageUrl: 'assets/screenshots/photo_sync_screenshot.png',
    technologies: ['Flutter', 'Dart'],
    publishedLocations: [
      StoreItem(
        name: 'Github',
        link: 'https://github.com/GalaxiMaster/photo_sync',
        display: false,
      ),
      StoreItem(
        name: 'Desktop',
        link: 'https://github.com/GalaxiMaster/photo_sync/releases/tag/Alpha_v0.1',
      ),
    ],
  ),
  ProjectDetails(
    title: 'Wordini',
    description: 'Wordini uses AI to close the gap in vocabulary retention. Instead of encouraging rote memorization, it tests contextual word usage to build true understanding.',
    imageUrl: 'assets/screenshots/wordini_screenshot.png',
    technologies: ['Flutter', 'Dart', 'Firebase', 'OpenAI', 'CloudFlare'],
    publishedLocations: [
      StoreItem(
        name: 'Github',
        link: 'https://github.com/GalaxiMaster/wordini',
        display: false,
      ),
      StoreItem(
        name: 'Android', 
        link: 'https://play.google.com/store/apps/details?id=com.smartspace.wordini&hl=en_AU'
      ),
      StoreItem(
        name: 'iOS',
        link: 'https://apps.apple.com/au/app/wordini/id6747973066'
      ),
    ],
  ),
  ProjectDetails(
    title: 'Exercise App',
    description: 'A mobile application for tracking workouts and managing fitness routines.',
    imageUrl: 'assets/screenshots/exercise_app_screenshot.png',
    technologies: ['Flutter', 'Dart', 'Firebase'],
    publishedLocations: [
      StoreItem(
        name: 'Github',
        link: 'https://github.com/GalaxiMaster/Exercise-App',
        display: false,
      ), 
      StoreItem(
        name: 'Android',
        link: 'https://play.google.com/store/apps/details?id=com.DylanJ.exercise_app'
      ),
    ],
  ),
  ProjectDetails(
    title: 'Social Calendar',
    description: 'App that allows users to add friends and intersect their calendars to find free time to hang out with ease.',
    imageUrl: 'assets/screenshots/social_calendar_screenshot.png',
    technologies: ['React Native', 'TypeScript', 'Supabase'],
    publishedLocations: [
      StoreItem(
        name: 'Github',
        link: 'https://github.com/GalaxiMaster/social-calendar',
        display: false,
      ),
      StoreItem(
        name: 'Android',
        link: 'https://github.com/GalaxiMaster/social-calendar/releases/tag/Alpha_v0.1'
      ),      
      StoreItem(
        name: 'Web',
        link: 'https://social-calendar-checker.vercel.app/'
      ),
    ],
  ),
  ProjectDetails(
    title: 'Goober Net',
    description: 'Instagram clone for my friends and I to share photos and videos with each other.',
    imageUrl: 'assets/screenshots/goober_net_screenshot.png',
    technologies: ['Flutter', 'Dart', 'Firebase', 'Cloudflare R2'],
    publishedLocations: [
      StoreItem(
        name: 'Github',
        link: 'https://github.com/GalaxiMaster/gooberNet',
        display: false,
      ),
      StoreItem(
        name: 'Android',
        link: 'https://github.com/GalaxiMaster/gooberNet/releases/tag/Alpha_v0.1'
      ),
    ],
  ),
];

final Map<String, String> storeMap = {
  'Android': 'play_store',
  'iOS': 'apple_store',
  'Desktop': 'desktop',
  'Web': 'website',
  'Github': 'github',
};