import 'package:flutter/material.dart' hide CarouselController;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const MyPortoApp());
}

class MyPortoApp extends StatelessWidget {
  const MyPortoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'My Portofolio',
      debugShowCheckedModeBanner: false,
      home: DetailScreen(),
    );
  }
}

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  // Fungsi untuk membuka URL
  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 32, 32, 32),
      appBar: _buildAppBar(),
      body: SafeArea(
        child: ListView(
          children: [
            _buildIntroductionSection(),
            _buildInterestsSection(),
            _buildSectionTitle("My UI/UX Project:"),
            _buildUiUxProjects(),
            _buildSectionTitle("My Flutter Project:"),
            _buildFlutterProjects(),
            _buildFooter(),
          ],
        ),
      ),
      floatingActionButton: _buildSpeedDial(),
    );
  }

  // 1. AppBar
  AppBar _buildAppBar() {
    return AppBar(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
      ),
      backgroundColor: const Color.fromARGB(255, 24, 27, 29),
      surfaceTintColor: const Color.fromARGB(255, 24, 27, 29),
      toolbarHeight: 120,
      title: const Row(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(15, 0, 25, 0),
            child: CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage('assets/img/myself.jpg'),
            ),
          ),
          Text(
            "Akhdan Yafi Widiyanto",
            style: TextStyle(
                color: Colors.white, fontFamily: 'sans', fontSize: 25),
          ),
        ],
      ),
      actions: [
        _buildPopupMenuButton(),
      ],
    );
  }

  // 2. Tombol Pop-up Menu di AppBar
  PopupMenuButton<String> _buildPopupMenuButton() {
    return PopupMenuButton<String>(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      color: const Color.fromARGB(255, 45, 50, 53),
      icon: const Padding(
        padding: EdgeInsets.all(30),
        child: Row(
          children: [
            Text(
              "Terhubung denganku",
              style: TextStyle(
                  color: Colors.white, fontSize: 20, fontFamily: 'sans'),
            ),
            SizedBox(width: 15),
            Icon(
              Icons.connect_without_contact_rounded,
              color: Colors.white,
            ),
          ],
        ),
      ),
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        _buildPopupMenuItem('buka_linkedin', 'Linkedin', 'assets/icon/linkedin.png'),
        _buildPopupMenuItem('buka_instagram', 'Instagram', 'assets/icon/instagram.png'),
        _buildPopupMenuItem('buka_github', 'Github', 'assets/icon/github.png'),
      ],
      onSelected: (String value) {
        if (value == 'buka_linkedin') {
          _launchUrl('https://www.linkedin.com/in/akhdanyafi/');
        } else if (value == 'buka_github') {
          _launchUrl('https://github.com/akhdanyafi');
        } else if (value == 'buka_instagram') {
          _launchUrl('https://instagram.com/yav.ii_w');
        }
      },
    );
  }

  PopupMenuItem<String> _buildPopupMenuItem(String value, String title, String iconPath) {
    return PopupMenuItem<String>(
      value: value,
      child: Row(
        children: [
          Text(title, style: const TextStyle(color: Colors.white)),
          const SizedBox(width: 10),
          Image.asset(iconPath, width: 18, height: 18),
        ],
      ),
    );
  }

  Widget _buildIntroductionSection() {
    final List<String> imageList = [
      'assets/img/myself.jpg',
      'assets/img/maself.jpg',
    ];

    return Padding(
      padding: const EdgeInsets.all(60),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Expanded(
            child: SizedBox(
              height: 500,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Hii, Its mee", 
                    style: TextStyle(
                      color: Colors.white, 
                      fontFamily: 'sanssemibold', 
                      fontSize: 50
                    )
                  ),
                  SizedBox(height: 30),
                  Text(
                    // <-- TEKS NARASI PANJANG DIKEMBALIKAN
                    "Haloo semuanya, kenalin aku Akhdan Yafi Widiyanto, Tech Anthusiast, Mahasiswa informatika Universitas Al - Azhar Indonesia, saat ini aku menduduki semester 5, saat ini saya sedang mendalami tentang flutter, dan sql atau basis data, aku punya ketertarikan yang tinggi dalam teknologi diantaranya yaitu flutter, saya juga mampu berkerja dengan tim ataupun sendiri, senang bertemu dengan kalian semua..", 
                    style: TextStyle(
                      color: Colors.white, 
                      fontFamily: 'sanssemibold', 
                      fontSize: 20
                    )
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 40),
          Expanded(
            child: SizedBox(
              height: 600,
              child: CarouselSlider.builder(
                itemCount: imageList.length,
                itemBuilder: (context, index, realIndex) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: AssetImage(imageList[index]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
                options: CarouselOptions(
                    height: 600,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    viewportFraction: 0.85),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 3. Bagian "Interested In"
  Widget _buildInterestsSection() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 50.0),
      child: Column(
        children: [
          _buildSectionTitle("Interested In:"),
          const SizedBox(height: 30),
          SizedBox(
            width: 600,
            height: 600,
            child: CarouselSlider(
              items: [
                _buildInterestCard('assets/icon/icon_flutter.png', "Flutter UI Devoloper", const Color.fromARGB(255, 3, 134, 173)),
                _buildInterestCard('assets/icon/figma.png', "UI/UX Desaigner", const Color.fromARGB(255, 23, 27, 29)),
                _buildInterestCard('assets/icon/sql_server.png', "SQL Language Query", const Color.fromARGB(255, 1, 60, 94)),
              ],
              options: CarouselOptions(
                  height: 600,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  viewportFraction: 0.8),
            ),
          ),
        ],
      ),
    );
  }
  
  // Helper untuk membuat Card di "Interested In"
  Widget _buildInterestCard(String iconPath, String title, Color color) {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: color,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(iconPath, width: 150, height: 150),
            const SizedBox(height: 20),
            Text(title, style: const TextStyle(color: Colors.white, fontSize: 30, fontFamily: 'sans')),
          ],
        ),
      ),
    );
  }


  Widget _buildUiUxProjects() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(60.0, 30.0, 60.0, 30.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildProjectCard(
            imageUrl: 'assets/img/fotokopi_uai.png',
            description: """Kami merancang UI/UX Sistem Website Fotokopi Universitas Al Azhar Indonesia, sebuah solusi untuk mengatasi masalah antrian panjang, pencatatan manual, dan keterbatasan informasi layanan fotokopi di kampus.

Alur sistem secara singkat:

1. Pengguna melakukan pemesanan secara online.
2. Mengunggah file & memilih jenis kertas/layanan
3. Melakukan pembayaran digital.
4. Menerima notifikasi status.

Proyek ini memberi kami pengalaman berharga dalam menciptakan desain yang tidak hanya menarik secara visual, tetapi juga mampu menghadirkan pengalaman pengguna yang sederhana, efisien, dan intuitif.

Berikut untuk link prototype UI/UX Selengkapnya: https://www.figma.com/design/ei9Vu9YG9DwFmnBGyoiC42/KELOMPOK-4-RPL?node-id=0-1&t=yojceLsvVGamOdZE-1""",
          ),
          const SizedBox(width: 30),
          _buildProjectCard(
            imageUrl: 'assets/img/zuppa.jpeg',
            description: """Aplikasi "Zuppa Soup Pemuda" adalah sebuah prototipe platform pemesanan makanan berbasis mobile yang dirancang khusus untuk brand Zuppa Soup Pemuda. Aplikasi ini bertujuan untuk memberikan kemudahan dan pengalaman baru bagi pelanggan setia maupun calon pelanggan dalam memesan hidangan zuppa soup favorit mereka secara langsung dari perangkat seluler.
            
Dengan fokus pada efisiensi dan kemudahan, aplikasi ini dirancang untuk menjembatani antara pelanggan dengan outlet tanpa perantara pihak ketiga, sehingga proses pemesanan menjadi lebih sederhana dan personal.
            
Berikut untuk link prototype UI/UX Selengkapnya:
            
https://www.figma.com/design/6G5i1GVKQS4PvzIYtwcCGC/Zuppa-Soup?node-id=0-1&t=AiiDLsCsc8aP4dxC-1""",
          ),
        ],
      ),
    );
  }


  Widget _buildFlutterProjects() {
     return Padding(
      padding: const EdgeInsets.fromLTRB(60.0, 30.0, 60.0, 30.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildProjectCard(
            imageUrl: 'assets/img/goevent.png',
            title: "Go Event APK",
            description: '''Pada tanggal 2 Agustus 2025 saya berhasil menyelesaikan projek UAS saya yaitu membuat aplikasi mobile berbasis Flutter bernama Go Event .
            
Aplikasi ini dirancang untuk mempermudah pengguna dalam menemukan dan mengelola acara.
            
Fitur utama yang harus ada dalam kriteria UAS pada Go Event:
            
1. Mendapatkan list event terbaru
2. Register user
3. Login user
4. Register event baru
            
Selain itu, aplikasi ini juga sudah terintegrasi dengan API publik dari 103.160.63.165/api-docs-interactive.
            
- Nama aplikasi: Go Event
- Teknologi: Flutter + REST API
            
Proyek UAS saya ini menjadi pengalaman dan pembelajaran berharga dalam membangun aplikasi mobile dengan Flutter, memanfaatkan API, serta mengimplementasikan fitur autentikasi dan CRUD sederhana.
Saat ini saya masih dalam tahap pembelajaran Flutter, dan proyek ini menjadi salah satu langkah awal saya untuk terus berkembang di dunia mobile development.
            
Berikut untuk link dokumentasi dari github: https://github.com/akhdanyafi/GoEvent-Apk.git''',
          ),
          const Expanded(child: SizedBox()), /
        ],
      ),
    );
  }

  Widget _buildProjectCard({required String imageUrl, String? title, required String description}) {
    return Expanded(
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: const Color.fromARGB(255, 29, 26, 26),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                width: 800,
                height: 400,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(image: AssetImage(imageUrl), fit: BoxFit.contain),
                ),
              ),
              const SizedBox(height: 30),
              if (title != null)
                Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: Text(title, style: const TextStyle(color: Colors.white, fontSize: 25)),
                ),
              Text(description, style: const TextStyle(color: Colors.white)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(60.0, 30.0, 60.0, 0),
      child: Text(title, style: const TextStyle(color: Colors.white, fontSize: 30)),
    );
  }

  Widget _buildFooter() {
    return Container(
      height: 50,
      color: const Color.fromARGB(255, 24, 27, 29),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Website ini dibuat oleh AkhdanYafi dengan flutter",
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(width: 100),
            _buildSocialIcon(FontAwesomeIcons.github, 'https://github.com/akhdanyafi'),
            const SizedBox(width: 40),
            _buildSocialIcon(FontAwesomeIcons.instagram, 'https://instagram.com/yav.ii_w'),
            const SizedBox(width: 40),
            _buildSocialIcon(FontAwesomeIcons.linkedin, 'https://www.linkedin.com/in/akhdanyafi/'),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialIcon(IconData icon, String url) {
    return IconButton(
      onPressed: () => _launchUrl(url),
      icon: FaIcon(icon, color: Colors.white, size: 20),
    );
  }

  Widget _buildSpeedDial() {
    return SpeedDial(
      icon: Icons.connect_without_contact_rounded,
      activeIcon: Icons.close,
      backgroundColor: const Color.fromARGB(255, 46, 50, 56),
      foregroundColor: Colors.white,
      spacing: 12,
      spaceBetweenChildren: 12,
      children: [
        _buildSpeedDialChild(FontAwesomeIcons.github, 'Github', 'https://github.com/akhdanyafi'),
        _buildSpeedDialChild(FontAwesomeIcons.instagram, 'Instagram', 'https://instagram.com/yav.ii_w'),
        _buildSpeedDialChild(FontAwesomeIcons.linkedin, 'Likedin', 'https://www.linkedin.com/in/akhdanyafi/'),
      ],
    );
  }
  
  SpeedDialChild _buildSpeedDialChild(IconData icon, String label, String url) {
    return SpeedDialChild(
      child: FaIcon(icon),
      label: label,
      backgroundColor: const Color.fromARGB(255, 46, 50, 56),
      labelBackgroundColor: Colors.white,
      foregroundColor: Colors.white,
      onTap: () => _launchUrl(url),
    );
  }
}
