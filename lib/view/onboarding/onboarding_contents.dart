// Kelas untuk menyimpan konten pada layar onboarding
class OnboardingContents {
  final String title;
  final String image;
  final String desc;

  OnboardingContents({
    required this.title,
    required this.image,
    required this.desc,
  });
}

// Daftar konten onboarding
List<OnboardingContents> contents = [
  OnboardingContents(
    title: "Shopping at FitFind",
    image: "images/i.png",
    desc:
        "Enhance your Online Shopping Experience by visiting FitFind and shopping with all its products.",
  ),
  OnboardingContents(
    title: "FitFind Hassle-free Online Shopping",
    image: "images/ii.png",
    desc: "Shop with the best quality, affordable prices and guaranteed safety",
  ),
  OnboardingContents(
    title: "FitFind Shop",
    image: "images/iii.png",
    desc: "Shop for all your fashion needs, updated and contemporary.",
  ),
];
