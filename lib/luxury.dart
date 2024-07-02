import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class LuxuryTransportPage extends StatefulWidget {
  const LuxuryTransportPage({Key? key}) : super(key: key);

  @override
  _LuxuryTransportPageState createState() => _LuxuryTransportPageState();
}

class _LuxuryTransportPageState extends State<LuxuryTransportPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..forward();
    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0.0, 0.5),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Luxury Transport',
          style: GoogleFonts.playfairDisplay(
            color: const Color(0xFFD4AF37),
            fontSize: 24,
          ),
        ),
        backgroundColor: const Color(0xFF002B5B),
      ),
      body: SingleChildScrollView(
        child: SlideTransition(
          position: _offsetAnimation,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 250,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: const NetworkImage('https://images.pexels.com/photos/1545743/pexels-photo-1545743.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.5),
                        BlendMode.darken,
                      ),
                    ),
                  ),
                  child: Center(
                    child: DefaultTextStyle(
                      style: GoogleFonts.playfairDisplay(
                        color: const Color(0xFFD4AF37),
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                      ),
                      child: AnimatedTextKit(
                        animatedTexts: [
                          TyperAnimatedText(
                            'Experience Ultimate Luxury',
                            speed: const Duration(milliseconds: 100),
                          ),
                        ],
                        isRepeatingAnimation: false,
                        totalRepeatCount: 1,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Our Fleet',
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF002B5B),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'We provide top-notch luxury transport services with a fleet of high-end vehicles to cater to your every need. Our collection includes:',
                  style: GoogleFonts.montserrat(
                    fontSize: 16,
                    color: Colors.grey[800],
                  ),
                ),
                const SizedBox(height: 20),
                VehicleCard(
                  title: 'Rolls Royce Phantom',
                  imageUrl: 'https://images.pexels.com/photos/210019/pexels-photo-210019.jpeg',
                ),
                VehicleCard(
                  title: 'Bentley Continental',
                  imageUrl: 'https://images.pexels.com/photos/358070/pexels-photo-358070.jpeg',
                ),
                VehicleCard(
                  title: 'Lamborghini Aventador',
                  imageUrl: 'https://images.pexels.com/photos/358201/pexels-photo-358201.jpeg',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class VehicleCard extends StatelessWidget {
  final String title;
  final String imageUrl;

  const VehicleCard({Key? key, required this.title, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
            child: Image.network(
              imageUrl,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFFD4AF37),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
