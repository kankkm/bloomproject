import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PromotionSection extends StatelessWidget {
  const PromotionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
      //color: Colors.black54,
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 800) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Image.network('https://res.cloudinary.com/dsenp6ilm/image/upload/v1744430296/f8_ybjxzw.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'รายละเอียดโครงการ',
                          style: GoogleFonts.prompt(
                            color: const Color(0xFF22382C),
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'บ้านเดี่ยวใกล้โรงพยาบาล สว่างแดนดิน',
                          style: GoogleFonts.prompt(  // Using Prompt font
                            color: const Color(0xFF362E24),
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'BLOOM PROJECT สว่างแดนดิน 1, โครงการที่พักอาศัย บ้านชั้นเดียวจำนวน 4 หลัง',
                          style: GoogleFonts.prompt(color: const Color(0xFF362E24),fontSize: 16),
                        ),
                        Text(
                          'บริหารโครงการโดย : BLOOM PROJECT',
                          style: GoogleFonts.prompt(color: const Color(0xFF362E24),fontSize: 16),
                        ),
                        Text(
                          'ก่อสร้างโดย : ทรัพย์ยิ่งเจริญ คอนสตรัคชั่น',
                          style: GoogleFonts.prompt(color: const Color(0xFF362E24),fontSize: 16),
                        ),
                        const SizedBox(height: 30),
                      ],
                    ),
                  ),
                ),
              ],
            );
          } else {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Image.asset(
                    'assets/images/f8.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'รายละเอียดโครงการ',
                        style: GoogleFonts.prompt(
                          color: const Color(0xFF22382C),
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'บ้านเดี่ยวใกล้โรงพยาบาล สว่างแดนดิน',
                        style: GoogleFonts.prompt(  // Using Prompt font
                          color: const Color(0xFF362E24),
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        'BLOOM PROJECT สว่างแดนดิน 1, โครงการที่พักอาศัย',
                        style: GoogleFonts.prompt(color: const Color(0xFF362E24),fontSize: 16),
                      ),
                      Text(
                        'บ้านชั้นเดียวจำนวน 4 หลัง',
                        style: GoogleFonts.prompt(color: const Color(0xFF362E24),fontSize: 16),
                      ),
                      Text(
                        'บริหารโครงการโดย : BLOOM PROJECT',
                        style: GoogleFonts.prompt(color: const Color(0xFF362E24),fontSize: 16),
                      ),
                      Text(
                        'ก่อสร้างโดย : ทรัพย์ยิ่งเจริญ คอนสตรัคชั่น',
                        style: GoogleFonts.prompt(color: const Color(0xFF362E24),fontSize: 16),
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}