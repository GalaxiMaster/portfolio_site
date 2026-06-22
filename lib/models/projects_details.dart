class ProjectDetails {
  final String title;
  final String description;
  final String imageUrl;
  final List<String> technologies;
  final List<StoreItem> publishedLocations;
  final List<String> keyFeatures;

  ProjectDetails({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.technologies, 
    required this.publishedLocations, 
    required this.keyFeatures,
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
    keyFeatures: [
      'Responsive Layout: Fully optimized user experience across mobile, tablet, and desktop viewports.',
      'Interactive Showcase: Dedicated sections demonstrating project architecture, technical skill sets, and professional experience.',
      'Single-Codebase Deployment: Developed using Flutter to target web-based hosting platforms efficiently from a unified architectural foundation.',
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
    keyFeatures: [
      'Immich Integration: Serves as a desktop client to view and modify Immich-hosted media files seamlessly.',
      'Local & External Storage Handling: Syncs and manages media between local directories, connected hardware devices, and cloud storage.',
      'Cross-Platform Desktop Compilation: Tailored performance profiles targeting desktop OS layers to manipulate local file systems with native efficiency.',
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
    keyFeatures: [
      'AI-Driven Contextual Testing: Deploys OpenAI models to evaluate real-time vocabulary usage instead of static rote memorization.',
      'Cross-Platform Cloud Sync: Utilizes Firebase and Cloudflare to ensure secure user authentication.',
      'Production-Grade App Store Releases: Fully deployed and optimized production distributions across Google Play and Apple App Store pipelines.',
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
        link: 'https://play.google.com/apps/testing/com.DylanJ.exercise_app'
      ),
    ], 
    keyFeatures: [
      'Workout Tracking: Enables users to input their workouts data and view historical data at a glance',
      'Routine Management: Allows users to build, modify, and execute custom fitness schedules with cross device sync.',
      'Real-Time Backend Persistence: Leverages Firebase infrastructure for immediate synchronization of user training records and session histories.',
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
    keyFeatures: [
      'Schedule Intersection Engine: Automatically correlates multiple calendar data structures to compute optimal, overlapping free time windows.',
      'Social Networking Graph: Built-in friend management system powered by Supabase for secure data access and real-time synchronization.',
      'Hybrid Deployment Matrix: Simultaneous distribution across Android environments and web ecosystems via Vercel hosting.',
    ],
  ),
  ProjectDetails(
    title: 'Goober Net',
    description: 'Instagram clone for my friends and I to share photos and videos with each other.',
    imageUrl: 'assets/screenshots/goober_net_screenshot.png',
    technologies: ['Flutter', 'Dart', 'Firebase', 'CloudFlare'],
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
    keyFeatures: [
      'Media Hosting & Streaming: Utilizes Cloudflare R2 object storage to handle high-bandwidth photo and video uploads and deliveries.',
      'Social Feed Core: Feature-complete private social network mechanics including user feeds, media sharing, and storage scaling.',
      'Secure Private Infrastructure: Architected exclusively for credentialed peer groups to isolate media delivery from public exposure.',
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