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
    return const MaterialApp(title: 'My Portofolio', home: DetailScreen());
  }
}

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $url');
    }
  }

  final List<String> imageList = [
    'assets/img/myself.jpg',
    'assets/img/maself.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 32, 32, 32),
      appBar: AppBar(
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
                color: Colors.white,
                fontFamily: 'sans',
                fontSize: 25,
              ),
            ),
          ],
        ),

        actions: [
          PopupMenuButton<String>(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(20),
            ),
            color: const Color.fromARGB(255, 45, 50, 53),
            icon: Padding(
              padding: EdgeInsets.all(30),
              child: Row(
                children: [
                  Text(
                    "Terhubung denganku",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'sans',
                    ),
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
              const PopupMenuItem<String>(
                value: 'buka_linkedin',
                child: Row(
                  children: [
                    Text('Linkedin', style: TextStyle(color: Colors.white)),
                    SizedBox(width: 10),
                    Image(
                      image: AssetImage('assets/icon/linkedin.png'),
                      width: 18,
                      height: 18,
                    ),
                  ],
                ),
              ),
              const PopupMenuItem<String>(
                value: 'buka_instagram',
                child: Row(
                  children: [
                    Text('Instagram', style: TextStyle(color: Colors.white)),
                    SizedBox(width: 10),
                    Image(
                      image: AssetImage('assets/icon/instagram.png'),
                      width: 18,
                      height: 18,
                    ),
                  ],
                ),
              ),
              const PopupMenuItem<String>(
                value: 'buka_github',
                child: Row(
                  children: [
                    Text('Github', style: TextStyle(color: Colors.white)),
                    SizedBox(width: 5),
                    Image(
                      image: AssetImage('assets/icon/github.png'),
                      width: 18,
                      height: 18,
                    ),
                  ],
                ),
              ),
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

            tooltip: 'Terhubung dengan',
          ),
        ],
      ),

      body: SafeArea(
        child: ListView(
          children: [
            Padding(
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
                              fontSize: 50,
                            ),
                          ),
                          SizedBox(height: 30),
                          Text(
                            "Haloo semuanya, kenalin aku Akhdan Yafi Widiyanto, Tech Anthusiast, Mahasiswa informatika Universitas Al - Azhar Indonesia, saat ini aku menduduki semester 5, saat ini saya sedang mendalami tentang flutter, dan sql atau basis data, aku punya ketertarikan yang tinggi dalam teknologi diantaranya yaitu flutter, saya juga mampu berkerja dengan tim ataupun sendiri, senang bertemu dengan kalian semua..",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'sanssemibold',
                              fontSize: 20,
                            ),
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
                          final imagePath = imageList[index];
                          return Container(
                            margin: const EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                image: AssetImage(imagePath),
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                        options: CarouselOptions(
                          height: 600,
                          autoPlay: true,
                          autoPlayInterval: const Duration(seconds: 4),
                          enlargeCenterPage: true,
                          viewportFraction: 0.85,
                          aspectRatio: 16 / 9,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.all(60),
              child: Center(
                child: Text(
                  "Interested In:",
                  style: TextStyle(color: Colors.white, fontSize: 50),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 50.0),
              child: Center(
                child: Container(
                  width: 600,
                  height: 600,
                  child: Expanded(
                    child: SizedBox(
                      child: CarouselSlider(
                        items: [
                          Card(
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            color: const Color.fromARGB(255, 3, 134, 173),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/icon/icon_flutter.png',
                                    width: 150,
                                    height: 150,
                                  ),

                                  SizedBox(height: 20),

                                  Text(
                                    "Flutter UI Devoloper",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 30,
                                      fontFamily: 'sans',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          Card(
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            color: const Color.fromARGB(255, 23, 27, 29),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/icon/figma.png',
                                    width: 150,
                                    height: 150,
                                  ),

                                  SizedBox(height: 20),

                                  Text(
                                    "UI/UX Desaigner",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 30,
                                      fontFamily: 'sans',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          Card(
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            color: const Color.fromARGB(255, 1, 60, 94),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/icon/sql_server.png',
                                    width: 150,
                                    height: 150,
                                  ),

                                  SizedBox(height: 20),

                                  Text(
                                    "SQL Language Query",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 30,
                                      fontFamily: 'sans',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],

                        options: CarouselOptions(
                          height: 600,
                          autoPlay: true,
                          autoPlayInterval: const Duration(seconds: 4),
                          enlargeCenterPage: true,
                          viewportFraction: 0.8,
                          aspectRatio: 16 / 9,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.fromLTRB(60.0, 30.0, 60.0, 30.0),
              child: Text(
                "My UI/UX Project: ",
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),

            Padding(
              padding: EdgeInsets.fromLTRB(60.0, 30.0, 60.0, 30.0),
              child: Row(
                children: [
                  Expanded(
                    child: Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      color: const Color.fromARGB(255, 29, 26, 26),
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Center(
                          child: Column(
                            children: [
                              Container(
                                width: 800,
                                height: 400,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                      'assets/img/fotokopi_uai.png',
                                    ),
                                  ),
                                ),
                              ),

                              SizedBox(height: 30),

                              Text(
                                """Kami merancang UI/UX Sistem Website Fotokopi Universitas Al Azhar Indonesia, sebuah solusi untuk mengatasi masalah antrian panjang, pencatatan manual, dan keterbatasan informasi layanan fotokopi di kampus.

Alur sistem secara singkat:

1. Pengguna melakukan pemesanan secara online.
2. Mengunggah file & memilih jenis kertas/layanan
3. Melakukan pembayaran digital.
4. Menerima notifikasi status.

Proyek ini memberi kami pengalaman berharga dalam menciptakan desain yang tidak hanya menarik secara visual, tetapi juga mampu menghadirkan pengalaman pengguna yang sederhana, efisien, dan intuitif.

Berikut untuk link prototype UI/UX Selengkapnya: https://www.figma.com/design/ei9Vu9YG9DwFmnBGyoiC42/KELOMPOK-4-RPL?node-id=0-1&t=yojceLsvVGamOdZE-1""",
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(width: 30),
                  Expanded(
                    child: Container(
                      child: Card(
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        color: const Color.fromARGB(255, 29, 26, 26),
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Center(
                            child: Column(
                              children: [
                                Container(
                                  width: 800,
                                  height: 400,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                      image: AssetImage(
                                        'assets/img/zuppa.jpeg',
                                      ),
                                    ),
                                  ),
                                ),

                                SizedBox(height: 30),

                                Text(
                                  """Aplikasi "Zuppa Soup Pemuda" adalah sebuah prototipe platform pemesanan makanan berbasis mobile yang dirancang khusus untuk brand Zuppa Soup Pemuda. Aplikasi ini bertujuan untuk memberikan kemudahan dan pengalaman baru bagi pelanggan setia maupun calon pelanggan dalam memesan hidangan zuppa soup favorit mereka secara langsung dari perangkat seluler.
                      
Dengan fokus pada efisiensi dan kemudahan, aplikasi ini dirancang untuk menjembatani antara pelanggan dengan outlet tanpa perantara pihak ketiga, sehingga proses pemesanan menjadi lebih sederhana dan personal.
                      
Berikut untuk link prototype UI/UX Selengkapnya:
                      
https://www.figma.com/design/6G5i1GVKQS4PvzIYtwcCGC/Zuppa-Soup?node-id=0-1&t=AiiDLsCsc8aP4dxC-1""",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.fromLTRB(60.0, 30.0, 60.0, 30.0),
              child: Text(
                "My Flutter Project: ",
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),

            Padding(
              padding: EdgeInsets.fromLTRB(60.0, 30.0, 60.0, 30.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        color: const Color.fromARGB(255, 29, 26, 26),
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            children: [
                              Container(
                                width: 800,
                                height: 400,
                                child: Image.asset('assets/img/goevent.png'),
                              ),

                              SizedBox(height: 0),

                              Text(
                                "Go Event APK",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                ),
                              ),

                              SizedBox(height: 30),

                              Text(
                                '''Pada tanggal 2 Agustus 2025 saya berhasil menyelesaikan projek UAS saya yaitu membuat aplikasi mobile berbasis Flutter bernama Go Event .
                      
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
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                  Expanded(child: Container()),
                ],
              ),
            ),

            Container(
              height: 50,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 24, 27, 29),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Website ini dibuat oleh AkhdanYafi dengan flutter",
                        style: TextStyle(color: Colors.white),
                      ),

                      SizedBox(width: 100),

                      IconButton(
                        onPressed: () {
                          _launchUrl('https://github.com/akhdanyafi');
                        },
                        icon: FaIcon(
                          FontAwesomeIcons.github,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),

                      SizedBox(width: 40),

                      IconButton(
                        onPressed: () {
                          _launchUrl('https://instagram.com/yav.ii_w');
                        },
                        icon: FaIcon(
                          FontAwesomeIcons.instagram,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),

                      SizedBox(width: 40),

                      IconButton(
                        onPressed: () {
                          _launchUrl('https://www.linkedin.com/in/akhdanyafi/');
                        },
                        icon: FaIcon(
                          FontAwesomeIcons.linkedin,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: SpeedDial(
        icon: Icons.connect_without_contact_rounded,
        activeIcon: Icons.close,
        backgroundColor: const Color.fromARGB(255, 46, 50, 56),
        foregroundColor: Colors.white,
        spacing: 12,
        spaceBetweenChildren: 12,

        children: [
          SpeedDialChild(
            child: const FaIcon(FontAwesomeIcons.github),
            label: 'Github',
            backgroundColor: const Color.fromARGB(255, 46, 50, 56),
            labelBackgroundColor: Colors.white,
            foregroundColor: Colors.white,
            onTap: () {
              _launchUrl('https://github.com/akhdanyafi');
            },
          ),
          SpeedDialChild(
            child: const FaIcon(FontAwesomeIcons.instagram),
            label: 'Instagram',
            backgroundColor: const Color.fromARGB(255, 46, 50, 56),
            labelBackgroundColor: Colors.white,
            foregroundColor: Colors.white,
            onTap: () {
              _launchUrl('https://instagram.com/yav.ii_w');
            },
          ),
          SpeedDialChild(
            child: const FaIcon(FontAwesomeIcons.linkedin),
            label: 'Likedin',
            backgroundColor: const Color.fromARGB(255, 46, 50, 56),
            labelBackgroundColor: Colors.white,
            foregroundColor: Colors.white,
            onTap: () {
              _launchUrl('https://www.linkedin.com/in/akhdanyafi/');
            },
          ),
        ],
      ),
    );
  }
}
