import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:green_estate/contact_section.dart';
import 'package:green_estate/featured_properties.dart';
import 'package:green_estate/fullscreen_hero.dart';
import 'package:green_estate/location_map.dart';
import 'package:green_estate/promotion_section.dart';
import 'package:green_estate/registration_form.dart';
import 'package:green_estate/video_section.dart';
import 'package:green_estate/progress_section.dart';
import 'package:green_estate/image_slideshow.dart';
import 'package:green_estate/structure_section.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ItemScrollController _itemScrollController = ItemScrollController();
  final ItemPositionsListener _itemPositionsListener = ItemPositionsListener.create();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
    );

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: 75,
        backgroundColor: const Color(0xFF22382C),
        elevation: 0,
        leading: PopupMenuButton<String>(
          icon: Icon(Icons.menu), // ไอคอน 3 ขีด
          onSelected: (value) => _scrollTo(int.parse(value)),
          color: const Color(0xFF727C73),
          itemBuilder: (BuildContext context) => [
            PopupMenuItem(value: '0', child: Text('หน้าแรก', style: GoogleFonts.prompt(
          fontSize: 16,
        ),)),
            PopupMenuItem(value: '1', child: Text('รายละเอียดโครงการ', style: GoogleFonts.prompt(
              fontSize: 16,
            ),)),
            PopupMenuItem(value: '3', child: Text('นัดหมายเข้าชมโครงการ', style: GoogleFonts.prompt(
              fontSize: 16,
            ),)),
            PopupMenuItem(value: '4', child: Text('รูปบ้าน', style: GoogleFonts.prompt(
              fontSize: 16,
            ),)),
            PopupMenuItem(value: '5', child: Text('วิดิโอ', style: GoogleFonts.prompt(
              fontSize: 16,
            ),)),
            PopupMenuItem(value: '6', child: Text('ความคืบหน้าโครงการ', style: GoogleFonts.prompt(
              fontSize: 16,
            ),)),
            PopupMenuItem(value: '7', child: Text('แผนที่', style: GoogleFonts.prompt(
              fontSize: 16,
            ),)),
            PopupMenuItem(value: '8', child: Text('ติดต่อเรา', style: GoogleFonts.prompt(
              fontSize: 16,
            ),)),
          ],
        ),
        title: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 200),
          child: Image.network('https://res.cloudinary.com/dsenp6ilm/image/upload/v1744430293/f5_wxvgqk.png',
            filterQuality: FilterQuality.low,
            cacheWidth: 300,
            fit: BoxFit.contain,
          ),
        ),
        centerTitle: true,
      ),
      body: ScrollablePositionedList.builder(
        itemScrollController: _itemScrollController,
        itemPositionsListener: _itemPositionsListener,
        itemCount: 10,
        itemBuilder: (context, index) {
          switch (index) {
            case 0: return const FullScreenHero();
            case 1: return const PromotionSection();
            case 2: return const StuctureSection();
            case 3: return const RegistrationForm();
            case 4: return const ImageSlideshow();
            case 5: return const VideoSection();
            case 6: return const FeaturedProperties();
            case 7: return const LocationMap();
            case 8: return const ContactSection();
            case 9: return Container( // Footer section
              padding: const EdgeInsets.all(20),
              color: const Color(0xFF22382C),
              child: const Center(
                child: Text(
                  '© 2025 Bloom Project. All rights reserved.',
                  style: TextStyle(color: Colors.white70),
                ),
              ),
            );
            default: return Container();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF22382C),
        foregroundColor: Colors.white,
        onPressed: () => _scrollTo(0),
        child: const Icon(Icons.arrow_upward),
      ),
    );
  }

  void _scrollTo(int index) {
    _itemScrollController.scrollTo(
      index: index,
      duration: 500.ms,
      curve: Curves.easeInOut,
    );
  }

}