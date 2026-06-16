class ProjectDetails {
  final String title;
  final String description;
  final String imageUrl;
  final List<String> technologies;
  final List<String> publishedLocations;

  ProjectDetails({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.technologies, 
    required this.publishedLocations,
  });
}

final projectsList = [
  ProjectDetails(
    title: 'Personal Portfolio Website',
    description: 'A personal portfolio website built using Flutter, showcasing my projects, skills, and experience in a visually appealing and responsive design.',
    imageUrl: 'assets/screenshots/portfolio_screenshot.png',
    technologies: ['Flutter', 'Dart'],
    publishedLocations: ['Web'],
  ),
  ProjectDetails(
    title: 'Photo Sync',
    description: 'A desktop client for immich that allows you to view and edit your immich photos in conjunction to local files or plugged in devices.',
    imageUrl: 'assets/screenshots/photo_sync_screenshot.png',
    technologies: ['Flutter', 'Dart'],
    publishedLocations: ['Desktop'],
  ),
  ProjectDetails(
    title: 'Wordini',
    description: 'Wordini uses AI to close the gap in vocabulary retention. Instead of encouraging rote memorization, it tests contextual word usage to build true understanding.',
    imageUrl: 'assets/screenshots/wordini_screenshot.png',
    technologies: ['Flutter', 'Dart', 'Firebase', 'OpenAI', 'Cloudflare'],
    publishedLocations: ['Android', 'iOS'],
  ),
  ProjectDetails(
    title: 'Exercise App',
    description: 'A mobile application for tracking workouts and managing fitness routines.',
    imageUrl: 'assets/screenshots/exercise_app_screenshot.png',
    technologies: ['Flutter', 'Dart', 'Firebase'],
    publishedLocations: ['Android'],
  ),
  ProjectDetails(
    title: 'Social Calendar',
    description: 'App that allows users to add friends and intersect their calendars to find free time to hang out with ease.',
    imageUrl: 'assets/screenshots/social_calendar_screenshot.png',
    technologies: ['React Native', 'TypeScript', 'Supabase'],
    publishedLocations: ['Android', 'Web'],
  ),
  ProjectDetails(
    title: 'Goober Net',
    description: 'Instagram clone for my friends and I to share photos and videos with each other.',
    imageUrl: 'assets/screenshots/goober_net_screenshot.png',
    technologies: ['Flutter', 'Dart', 'Firebase', 'Cloudflare R2'],
    publishedLocations: ['Android'],
  ),
];