/// App assets paths (Singleton)
class AppAssets {
  AppAssets._();
  static final AppAssets _instance = AppAssets._();
  static AppAssets get instance => _instance;

  // Images
  static const String logo = 'assets/images/logo.png';
  static const String background = 'assets/images/background.png';
  static const String earbuds = 'assets/images/earbuds.png';
  static const String box = 'assets/images/box.png';
  static const String shadow = 'assets/images/shadow.svg';
  static const String user = 'assets/images/user.png';
  static const String copy = 'assets/images/copy.svg';
  static const String user1 = 'assets/images/user-1.svg';
  static const String user2 = 'assets/images/user-2.svg';
  static const String whatsapp = 'assets/images/whatsapp.png';
  static const String twitter = 'assets/images/twitter.png';
  static const String linkedin = 'assets/images/linkdin.png';
  static const String notification = 'assets/images/notification.png';
  static const String flash = 'assets/images/flash.png';
  static const String google = 'assets/images/google.svg';
  static const String apple = 'assets/images/apple.svg';

  // Icons (if needed)
  // static const String iconName = 'assets/icons/icon_name.png';
}
