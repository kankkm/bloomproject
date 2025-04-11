import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StuctureSection extends StatelessWidget {
  const StuctureSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 10),
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 800) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Column(
                          children: [
                            Text(
                              'ผังโครงการ',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.prompt(
                                color: const Color(0xFF22382C),
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'บ้าน 3 ห้องนอน 2 ห้องน้ำ 2 ที่จอดรถ',
                              style: GoogleFonts.prompt(
                                color: const Color(0xFF362E24),
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'แปลง A1 (แปลงมุม) พื้นที่ใช้สอย 90 ตรม. ที่ดิน 55 ตร.วา',
                              style: GoogleFonts.prompt(
                                color: const Color(0xFF362E24),
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              'แปลง A2 พื้นที่ใช้สอย 90 ตรม. ที่ดิน 46 ตร.วา',
                              style: GoogleFonts.prompt(
                                color: const Color(0xFF362E24),
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              'แปลง A3 พื้นที่ใช้สอย 90 ตรม. ที่ดิน 45 ตร.วา',
                              style: GoogleFonts.prompt(
                                color: const Color(0xFF362E24),
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              'แปลง A4 (แปลงมุม) พื้นที่ใช้สอย 90 ตรม. ที่ดิน 52 ตร.วา',
                              style: GoogleFonts.prompt(
                                color: const Color(0xFF362E24),
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ],
                    )

                  ),
                ),
                const SizedBox(width: 0), // เว้นเล็กน้อยระหว่างข้อความกับรูป
                Expanded(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxHeight: 700),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: AspectRatio(
                        aspectRatio: 720 / 1019,
                        child: Image.asset(
                          'assets/images/f9.jpg',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          } else {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Image.asset(
                    'assets/images/f9.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'ผังโครงการ',
                        style: GoogleFonts.prompt(
                          color: const Color(0xFF22382C),
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'บ้าน 3 ห้องนอน 2 ห้องน้ำ 2 ที่จอดรถ',
                        style: GoogleFonts.prompt(
                          color: const Color(0xFF362E24),
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'แปลง A1 (แปลงมุม) พื้นที่ใช้สอย 90 ตรม. ที่ดิน 55 ตร.วา',
                        style: GoogleFonts.prompt(color: const Color(0xFF362E24), fontSize: 16),
                      ),
                      Text(
                        'แปลง A2 พื้นที่ใช้สอย 90 ตรม. ที่ดิน 46 ตร.วา',
                        style: GoogleFonts.prompt(color: const Color(0xFF362E24), fontSize: 16),
                      ),
                      Text(
                        'แปลง A3 พื้นที่ใช้สอย 90 ตรม. ที่ดิน 45 ตร.วา',
                        style: GoogleFonts.prompt(color: const Color(0xFF362E24), fontSize: 16),
                      ),
                      Text(
                        'แปลง A4 (แปลงมุม) พื้นที่ใช้สอย 90 ตรม. ที่ดิน 52 ตร.วา',
                        style: GoogleFonts.prompt(color: const Color(0xFF362E24), fontSize: 16),
                      ),
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
