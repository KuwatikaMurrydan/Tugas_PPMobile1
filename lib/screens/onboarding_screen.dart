import 'package:flutter/material.dart';
import '../routes/app_routes.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<Map<String, String>> onboardingPages = [
    {
      "title": "The World at Your Fingertips",
      "description":
          "Get 24/7 updates on global news – from breaking politics to cultural trends, all in one place",
      "image": "assets/images/introduction1.png",
    },
    {
      "title": "Tailored to Your Curiosity",
      "description":
          "Select your interests and receive handpicked stories. Technology, sports, or entertainment – we’ve got you covered",
      "image": "assets/images/introduction2.png",
    },
    {
      "title": "Trusted Updates in Real-Time",
      "description":
          "Instant alerts for breaking news, rigorously fact-checked by our editors before they reach you",
      "image": "assets/images/introduction3.png",
    },
  ];

  void _nextPage() {
    if (_currentIndex < onboardingPages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    } else {
      Navigator.pushReplacementNamed(context, AppRoutes.login);
    }
  }

  void _skip() {
    Navigator.pushReplacementNamed(context, AppRoutes.login);
  }

  Widget _buildPage(Map<String, String> page) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            page["image"]!,
            height: 300,
          ),
          const SizedBox(height: 30),
          Text(
            page["title"]!,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xff2D336B),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Text(
            page["description"]!,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(onPressed: _skip, child: const Text("Skip")),
              Row(
                children: List.generate(
                  onboardingPages.length,
                  (index) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: _currentIndex == index ? 16 : 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: _currentIndex == index
                          ? const Color(0xff2D336B)
                          : Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: _nextPage,
                child: Text(_currentIndex == onboardingPages.length - 1
                    ? "Get Started"
                    : "Next"),
              )
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        itemCount: onboardingPages.length,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        itemBuilder: (context, index) {
          return _buildPage(onboardingPages[index]);
        },
      ),
    );
  }
}
