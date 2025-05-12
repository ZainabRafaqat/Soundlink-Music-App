List imageArr = [
  "assets/images/splash_screen/splash_screen1.jpg",
  "assets/images/splash_screen/splash_screen2.jpg",
  "assets/images/splash_screen/splash_screen3.jpg",
  "assets/images/splash_screen/splash_screen4.jpg",
  "assets/images/splash_screen/splash_screen5.jpg",
  "assets/images/splash_screen/splash_screen6.jpg",
  "assets/images/splash_screen/splash_screen7.jpg",
  "assets/images/splash_screen/splash_screen8.jpg",
  "assets/images/splash_screen/splash_screen9.jpg",
  "assets/images/splash_screen/splash_screen10.jpg",
  "assets/images/splash_screen/splash_screen11.jpg",
  "assets/images/splash_screen/splash_screen12.jpg",
  "assets/images/splash_screen/splash_screen13.jpg",
  "assets/images/splash_screen/splash_screen14.jpg",
  "assets/images/splash_screen/splash_screen15.jpg",
  "assets/images/splash_screen/splash_screen16.jpg",
  "assets/images/splash_screen/splash_screen17.jpg",
  "assets/images/splash_screen/splash_screen18.jpg",
  "assets/images/splash_screen/splash_screen19.jpg"
];

extension StringCasingExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');
}
