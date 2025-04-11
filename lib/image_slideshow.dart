import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart'; // Add this import

class ImageSlideshow extends StatefulWidget {
  const ImageSlideshow({super.key});

  @override
  State<ImageSlideshow> createState() => _ImageSlideshowState();
}

class _ImageSlideshowState extends State<ImageSlideshow> {
  final PageController _pageController = PageController();
  final List<String> _images = [
    'assets/images/f11.png',
    'assets/images/f12.png',
    'assets/images/f13.png',
    'assets/images/f14.jpg',
    'assets/images/f15.jpg',
    'assets/images/f16.jpg',
    'assets/images/f17.jpg',
    'assets/images/f18.jpg',
    'assets/images/f19.jpg',
    'assets/images/f20.jpg',
  ];
  int _currentPage = 0;
  Timer? _timer;
  bool _isPlaying = true;

  @override
  void initState() {
    super.initState();
    _startAutoPlay();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  void _startAutoPlay() {
    _timer = Timer.periodic(const Duration(seconds: 2), (Timer timer) {
      if (_isPlaying) {
        _goToNextPage();
      }
    });
  }

  void _goToNextPage() {
    if (_currentPage < _images.length - 1) {
      _currentPage++;
    } else {
      _currentPage = 0;
    }
    _animateToPage(_currentPage);
  }

  void _goToPreviousPage() {
    if (_currentPage > 0) {
      _currentPage--;
    } else {
      _currentPage = _images.length - 1;
    }
    _animateToPage(_currentPage);
  }

  void _animateToPage(int page) {
    _pageController.animateToPage(
      page,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  void _togglePlayPause() {
    setState(() {
      _isPlaying = !_isPlaying;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Image Slideshow
        AspectRatio(
          aspectRatio: 16 / 9,
          child: Stack(
            alignment: Alignment.center,
            children: [
              PageView.builder(
                controller: _pageController,
                itemCount: _images.length,
                onPageChanged: (int page) {
                  setState(() => _currentPage = page);
                },
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 8,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        _images[index],
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                  ).animate().fadeIn(duration: 500.ms);
                },
              ),

              // Navigation Arrows
              Positioned(
                left: 16,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                  onPressed: _goToPreviousPage,
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.black38,
                    padding: const EdgeInsets.all(16),
                  ),
                ),
              ),
              Positioned(
                right: 16,
                child: IconButton(
                  icon: const Icon(Icons.arrow_forward_ios, color: Colors.white),
                  onPressed: _goToNextPage,
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.black38,
                    padding: const EdgeInsets.all(16),
                  ),
                ),
              ),

              // Play/Pause Button
              Positioned(
                bottom: 20,
                child: IconButton(
                  icon: Icon(
                    _isPlaying ? Icons.pause : Icons.play_arrow,
                    color: Colors.white,
                    size: 30,
                  ),
                  onPressed: _togglePlayPause,
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.black38,
                    padding: const EdgeInsets.all(12),
                  ),
                ),
              ),

              // Dots Indicator
              Positioned(
                bottom: 20,
                right: 20,
                child: Row(
                  children: List.generate(_images.length, (index) {
                    return Container(
                      width: 10,
                      height: 10,
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _currentPage == index
                            ? Colors.white
                            : Colors.white.withOpacity(0.5),
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
        ),

        // Styled Caption with Google Fonts
       // Padding(
         // padding: const EdgeInsets.only(top: 16),
         // child: Container(
           // decoration: BoxDecoration(
           //   color: Color(0xFFDCD5CD),
            //  borderRadius: BorderRadius.circular(8),
           // ),
           // padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
           // child: Row(
             // mainAxisAlignment: MainAxisAlignment.center,
             // children: [
              //  IconButton(
               //   icon: const Icon(Icons.skip_previous),
                //  onPressed: _goToPreviousPage,
                //  color: const Color(0xFF22382C),
              //  ),
               // Expanded(
                //  child: Text(
                 //   _getCaption(_currentPage),
                   // style: GoogleFonts.prompt( // Added Google Fonts
                    //  color: const Color(0xFF22382C), // Your color
                     // fontSize: MediaQuery.of(context).size.width > 600 ? 20 : 16,
                     // fontWeight: FontWeight.bold,
                     // letterSpacing: 0.5,
                  //  ),
                  //  textAlign: TextAlign.center,
                 // ).animate().fadeIn(duration: 300.ms),
               // ),
               // IconButton(
                 // icon: const Icon(Icons.skip_next),
                 // onPressed: _goToNextPage,
                 // color: const Color(0xFF22382C),
              //  ),
             // ],
          //  ),
        //  ),
       // ),
      ],
    );
  }

  //String _getCaption(int index) {
    //final captions = [
      //'Luxury Living Spaces',
      //'Modern Architecture',
      //'Premium Amenities',
      //'Beautiful Landscaping',
      //'Community Facilities'
   // ];
   // return captions[index];
 // }
}