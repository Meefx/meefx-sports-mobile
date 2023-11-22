# Identitas Diri
**Nama: Muhammad Fakhri Robbani**

**NPM: 2206026252**

**Kelas: PBP C**

# Daftar Isi
* [Tugas 7](#tugas-7-elemen-dasar-flutter)
* [Tugas 8](#tugas-8-flutter-navigation-layouts-forms-and-input-elements)
* [Tugas 9](#tugas-9-integrasi-layanan-web-django-dengan-aplikasi-flutter)

# Tugas 9: Integrasi Layanan Web Django dengan Aplikasi Flutter

Pertanyaan: 

1. Apakah bisa kita melakukan pengambilan data JSON tanpa membuat model terlebih dahulu? Jika iya, apakah hal tersebut lebih baik daripada membuat model sebelum melakukan pengambilan data JSON?

    Kita bisa melakukan pengambilan data JSON tanpa membuat model terlebih dahulu. Cara ini memberikan fleksibilitas yang signifikan dalam mengelola data yang dinamis atau tidak terstruktur. Pendekatan ini sangat berguna untuk program flutter sederhana atau aplikasi yang tidak memerlukan struktur data kompleks, karena memungkinkan akses langsung tanpa perlu mendefinisikan struktur terlebih dahulu. Meskipun kemudahan implementasi dan kecepatan dapat menjadi keuntungan, risiko terkait validasi data dan konsistensi mungkin menjadi tantangan, terutama dalam konteks aplikasi besar.


    Sebaliknya, menggunakan model untuk pengambilan data JSON membawa manfaat validasi data yang signifikan. Dengan mendefinisikan model, kita dapat menetapkan tipe data, keterbatasan, dan validasi lainnya untuk memastikan integritas data. Pendekatan ini lebih cocok untuk proyek skala besar atau yang menuntut integritas data tinggi, karena membuat kode lebih mudah dibaca, dipelihara, dan memberikan struktur yang memudahkan pengelolaan dan ekspansi data. Sebagai penilaian umum, pemilihan antara keduanya harus disesuaikan dengan kebutuhan spesifik proyek, dengan mempertimbangkan kompleksitas, ukuran, dan tingkat integritas data yang dibutuhkan.

2. Jelaskan fungsi dari CookieRequest dan jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.

     CookieRequest dapat disebut sebagai sebuah mekanisme atau kelas yang mengelola operasi terkait cookie dalam permintaan HTTP di aplikasi Flutter. Fungsi umumnya melibatkan manajemen cookie, pemeliharaan sesi, keamanan dan autentikasi, serta penyesuaian preferensi pengguna. Instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter untuk memastikan konsistensi data, efisiensi dalam kode, kemudahan pemeliharaan, penerapan kebijakan keamanan yang konsisten, serta pengujian dan debugging yang lebih mudah.

3. Jelaskan mekanisme pengambilan data dari JSON hingga dapat ditampilkan pada Flutter.
    1. Menambahkan dependensi http ke proyek; dependensi ini digunakan untuk bertukar HTTP request.
    2. Membuat model sesuai dengan respons dari data yang berasal dari web service tersebut.
    3. Membuat http request ke web service menggunakan dependensi http.
    4. Mengkonversikan objek yang didapatkan dari web service ke model yang telah kita buat di langkah kedua.
    5. Menampilkan data yang telah dikonversi ke aplikasi dengan FutureBuilder.
    6. JSON difetch ke sesuai urlnya dengan header json
    7. JSON yang telah difetch akan disesuaikan bodynya menuju model Item sesuai dengan properti-properti yang ada.
4. Jelaskan mekanisme autentikasi dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.
    1. Pengguna memasukkan username dan password dengan mengisi dua TextField yang ada pada halaman awal flutter.
    2. Aplikasi kemudian membuat permintaan HTTP POST ke fugnsi login Django pada aplikasi `authentication` menggunakan CookieRequest. Data username dan password dikirimkan sebagai bagian dari body request.
    3. Django mengelola permintaan login dengan memverifikasi kredensial username dan password untuk menentukan kevalidan. Setelahnya, Django mengirimkan respons yang kemudian diakses dan diperiksa oleh aplikasi Flutter. Jika login sukses, ditandai dengan request.loggedIn bernilai true, aplikasi akan melakukan navigasi ke halaman MyHomePage dan menampilkan pesan selamat datang. Di sisi lain, jika proses login mengalami kegagalan, aplikasi akan menampilkan pesan kesalahan sebagai respons.
5. Sebutkan seluruh widget yang kamu pakai pada tugas ini dan jelaskan fungsinya masing-masing.
    * AlertDialog : untuk menampilkan dialog peringatan atau pesan ke pengguna.
    * TextButton : untuk menampilkan tombol dengan teks.
    * TextField : untuk menerima input teks dari pengguna.
    * InputDecoration : untuk mendefinisikan penampilan dan gaya dari TextField.
    * SizedBox : untuk memberikan jarak antara dua widget.
    * ElevatedButton : untuk menampilkan tombol.
    * Navigator : untuk mengelola stack rute dalam aplikasi.
    * MaterialPageRoute : untuk menyediakan efek transisi saat berpindah antar halaman.
    * CircularProgressIndicator : untuk menampilkan indikator loading.
    * ListView.builder : untuk membuat list yang efisien dengan item yang di-build saat mereka diputar ke dalam tampilan.
    * FutureBuilder : untuk membuat widget berdasarkan hasil Future, pada tugas ini dugunakan untuk membangun ListView berdasarkan hasil dari fetchItem().
    * Provider : untuk menyediakan objek yang dapat dibaca oleh widget lain yang berada di bawahnya di widget tree, pada tugas ini digunakan untuk menyediakan instance CookieRequest ke widget lain.
    * LoginPage : widget kustom untuk menampilkan halaman login.
    * ItemPage: widget kuston umtuk menampilkan halaman daftar item.
    * ItemInformation: widget kustom untuk menampilkan halaman informasi item.
    * ScaffoldMessenger : untuk menampilkan SnackBar
6.  Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial).
    1. Membuat halaman login pada proyek tugas Flutter.

        Pertama-tama, saya melakukan instalasi package `provider` dan `pbp_django_auth` kemudian pada `main.dart` saya menyediakan CookieRequest library ke semua child widgets dengan menggunakan Provider. Kemudian saya membuat berkas `login.dart` yang berisi kode berikut.


        ```dart
        import 'package:meefx_sports/screens/menu.dart';
        import 'package:flutter/material.dart';
        import 'package:pbp_django_auth/pbp_django_auth.dart';
        import 'package:provider/provider.dart';

        void main() {
            runApp(const LoginApp());
        }

        class LoginApp extends StatelessWidget {
        const LoginApp({super.key});

        @override
        Widget build(BuildContext context) {
            return MaterialApp(
                title: 'Login',
                theme: ThemeData(
                    primarySwatch: Colors.blue,
            ),
            home: const LoginPage(),
            );
            }
        }

        class LoginPage extends StatefulWidget {
            const LoginPage({super.key});

            @override
            _LoginPageState createState() => _LoginPageState();
        }

        class _LoginPageState extends State<LoginPage> {
            final TextEditingController _usernameController = TextEditingController();
            final TextEditingController _passwordController = TextEditingController();

            @override
            Widget build(BuildContext context) {
                final request = context.watch<CookieRequest>();
                return Scaffold(
                    appBar: AppBar(
                        title: const Text('Login'),
                    ),
                    body: Container(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                                TextField(
                                    controller: _usernameController,
                                    decoration: const InputDecoration(
                                        labelText: 'Username',
                                    ),
                                ),
                                const SizedBox(height: 12.0),
                                TextField(
                                    controller: _passwordController,
                                    decoration: const InputDecoration(
                                        labelText: 'Password',
                                    ),
                                    obscureText: true,
                                ),
                                const SizedBox(height: 24.0),
                                ElevatedButton(
                                    onPressed: () async {
                                        String username = _usernameController.text;
                                        String password = _passwordController.text;

                                        // Cek kredensial
                                        // Untuk menyambungkan Android emulator dengan Django pada localhost,
                                        // gunakan URL http://10.0.2.2/
                                        final response = await request.login("https://muhammad-fakhri25-tugas.pbp.cs.ui.ac.id/auth/login/", {
                                        'username': username,
                                        'password': password,
                                        });
        

                                        if (request.loggedIn) {
                                            String message = response['message'];
                                            String uname = response['username'];
                                            // ignore: use_build_context_synchronously
                                            Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(builder: (context) => MyHomePage()),
                                            );
                                            ScaffoldMessenger.of(context)
                                                ..hideCurrentSnackBar()
                                                ..showSnackBar(
                                                    SnackBar(content: Text("$message Selamat datang, $uname.")));
                                            } else {
                                            // ignore: use_build_context_synchronously
                                            showDialog(
                                                context: context,
                                                builder: (context) => AlertDialog(
                                                    title: const Text('Login Gagal'),
                                                    content:
                                                        Text(response['message']),
                                                    actions: [
                                                        TextButton(
                                                            child: const Text('OK'),
                                                            onPressed: () {
                                                                Navigator.pop(context);
                                                            },
                                                        ),
                                                    ],
                                                ),
                                            );
                                        }
                                    },
                                    child: const Text('Login'),
                                ),
                            ],
                        ),
                    ),
                );
            }
        }
        ```



        Kemudian saya mengubah home pada `main.dart` menjadi `home: LoginPage()` dan menambahkan fitur `logout` dan melakukan push replacement ke loginPage setelah logout. 

    2. Mengintegrasikan sistem autentikasi Django dengan proyek tugas Flutter.
        * Pertama-tama, saya membuat aplikasi django baru bernama `authentication` dan mengintall library `dango-cors-headers` dan menambahkan middleware nya. Kemudian saya melakukan konfigurasi terkait Cookie dan corsheaders pada `settings.py`.
        * Kemudian saya membuat fungsi login dan logout pada `authentication/views.py` dan memanfaatkan `@csrtf_excempt` pada setiap fungsinya serta routing terhadap `urls.py`. Pengiriman data login dan logout dilakukan dengan memanfaatkan JsonResponse ke Flutter.
    3. Membuat model kustom sesuai dengan proyek aplikasi Django.

        Dalam membaut model kustom, saya memanfaatkan platform `Quicktype` yang dapat langsung melakukan konfigurasi model berdasarkan data json. Kemudian hasil konfigurasi model tersebut saya masukkan ke file `Item.dart` pada direktori `lib/models`.

    4.  Membuat halaman yang berisi daftar semua item yang terdapat pada endpoint JSON di Django yang telah kamu deploy.
        * Sebelum membuat halaman daftar item, saya menginstall flutter http dan menambahkan `&lt;uses-permission android:name="android.permission.INTERNET" />` pada berkas `android/app/src/main/AndroidManifest.xml`.
        * Kemudian saya membuat file dart baru bernama `list_item.dart`. Berikut adalah kodenya

            ```dart
            import 'package:flutter/material.dart';
            // import 'package:http/http.dart' as http;
            // import 'dart:convert';
            import 'package:meefx_sports/models/item.dart';
            import 'package:meefx_sports/screens/item_information.dart';

            import 'package:meefx_sports/widgets/left_drawer.dart';
            import 'package:pbp_django_auth/pbp_django_auth.dart';
            import 'package:provider/provider.dart';

            class ItemPage extends StatefulWidget {
                const ItemPage({Key? key}) : super(key: key);

                @override
                _ItemPageState createState() => _ItemPageState();
            }

            class _ItemPageState extends State<ItemPage> {
                Future<List<Item>> fetchItem() async {
                final request = context.watch<CookieRequest>();
                var response = await request.get('https://muhammad-fakhri25-tugas.pbp.cs.ui.ac.id/get-item/');
                // melakukan decode response menjadi bentuk json
                var data = response;

                // melakukan konversi data json menjadi object Item
                List<Item> list_item = [];
                for (var d in data) {
                    if (d != null) {
                        list_item.add(Item.fromJson(d));
                    }
                }
                return list_item;
            }

            @override
            Widget build(BuildContext context) {
                return Scaffold(
                    appBar: AppBar(
                    title: const Text('Item'),
                    backgroundColor: Colors.indigo,
                    foregroundColor: Colors.white,
                    ),
                    drawer: const LeftDrawer(),
                    body: FutureBuilder(
                        future: fetchItem(),
                        builder: (context, AsyncSnapshot snapshot) {
                            if (snapshot.data == null) {
                                return const Center(child: CircularProgressIndicator());
                            } else {
                                if (!snapshot.hasData) {
                                return const Column(
                                    children: [
                                    Text(
                                        "Tidak ada data item.",
                                        style:
                                            TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                                    ),
                                    SizedBox(height: 8),
                                    ],
                                );
                            } else {
                                return ListView.builder(
                                    itemCount: snapshot.data!.length,
                                    itemBuilder: (_, index) => InkWell(
                                      onTap: () {
                                        // Navigasi ke halaman ItemInformations dengan membawa data item
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => ItemInformation(
                                              item: snapshot.data![index],
                                            ),
                                          ),
                                        );
                                      },
                                      child: Container(
                                        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                                        padding: const EdgeInsets.all(20.0),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "${snapshot.data![index].fields.name}",
                                              style: const TextStyle(
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const SizedBox(height: 10),
                                            Text("${snapshot.data![index].fields.amount}"),
                                            const SizedBox(height: 10),
                                            Text("${snapshot.data![index].fields.description}")
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }
                            }
                        }));
                }
            }
            ```

        * Kemudian saya menambahkan page daftar item ini ke left drawer pada `left_drawer.dart` dan mengaktifkan tombol Daftar Item pada main.dart agar melakukan navigasi ke halaman daftar item.
        * Kemudian, saya melakukan integrasi form pada Flutter dengan Django app dengan menambahkan fungsi yang menerima data json dari form flutter dan membentuk objek Item berdasarkan data yang dikirim. Kemudian memanfaatkan `CookieRequest` pada form flutter yang sudah dibuat sebelumnya dan menambahkan asynchronous pada button form. 
    5.  Membuat halaman detail untuk setiap item yang terdapat pada halaman daftar Item.
        * Pertama-tama, saya membuat file baru bernama `item_information.dart` dan membuat page `ItemInformation` yang menampilkan atribut dari setiap item.
        * Kemudian, saya melakukan navigasi pada `list_item.dart` dengan memanfaatkan `Navigator.push()` agar ketika item pada list diclick, akan keluar page informasi item yang diclick.

# Tugas 8: Flutter Navigation, Layouts, Forms, and Input Elements

Pertanyaan: 

1. Jelaskan perbedaan antara `Navigator.push()` dan `Navigator.pushReplacement()`, disertai dengan contoh mengenai penggunaan kedua metode tersebut yang tepat!

    `Navigator.push()` menambahkan diatas tampilan sebelumnya, sedangkan, `Navigator.pushReplacement()` mengganti tampilan sebelumnya dengan rute baru tanpa mengubah jumlah rute pada stack flutter. Penggunaan `Navigator.push()` yang paling tepat  adalah ketika pengguna ingin menampilkan halaman baru namun tetap mempertahankan halaman sebelumnya. Pengguna dapat kembali ke halaman sebelumnya dengan memanggil `Navigator.pop()` untuk kembali ke layar sebelumnya. Misalnya tampilan halaman detail produk  dapat dikembalikan dari halaman tersebut. Sedangkan penggunaan `Navigator.pushReplacement()` yang paling tepat  adalah ketika pengguna memasuki  halaman baru tanpa memperhatikan halaman sebelumnya. Misal ketika kita  login, kita bisa menggunakan perintah ini untuk masuk ke halaman utama karena kita tidak akan kembali  ke halaman login.

2. Jelaskan masing-masing layout widget pada Flutter dan konteks penggunaannya masing-masing!

    | Layout Widget      | Konteks Penggunaan                                                                                                         |
    |--------------------|-----------------------------------------------------------------------------------------------------------------------------|
    | Container          | Digunakan untuk menempatkan widget lain di dalamnya dan memberikan kontrol terhadap padding, margin, dan dekorasi (background color, border, dan sebagainya).                   |
    | Row                | Menyusun widget secara horizontal. Cocok digunakan saat ingin menyusun elemen-elemen ke samping.                             |
    | Column             | Menyusun widget secara vertikal. Digunakan saat ingin menyusun elemen-elemen ke bawah.                                      |
    | ListView           | Digunakan untuk membuat daftar yang scrollable dari widget. Berguna ketika memiliki daftar item yang melebihi ukuran layar dan memerlukan fungsi gulir.                            |
    | GridView           | Untuk menampilkan daftar item dalam bentuk grid (kotak). Cocok digunakan untuk menampilkan koleksi item dengan format grid.  |
    | Stack              | Menyusun widget di atas satu sama lain. Berguna saat ingin menumpuk beberapa widget dan menunjukkan lebih dari satu widget pada saat yang sama.                       |
    | Expanded / Flexible | Digunakan untuk mengisi ruang kosong yang tersisa dalam widget induk. Berguna ketika ingin memberikan lebih banyak ruang pada satu atau beberapa widget di dalam parent widget.|
    | SizedBox           | Digunakan untuk membuat kotak kosong dengan ukuran tertentu. Berguna untuk memberikan ruang atau jarak antara widget-widget. |
    | Wrap               | Menyusun widget ke dalam baris dan kolom, serupa dengan Row dan Column, tetapi dengan fitur wrap. Cocok digunakan saat ingin menampilkan widget yang bisa melibatkan wrapping.|
    | Card               | Digunakan untuk mengelompokkan widget-widget bersama-sama dalam sebuah kartu. Berguna untuk menyajikan informasi atau fungsi terkait sebagai satu unit yang terpisah.      |
    | Align              | Menempatkan widget ke posisi tertentu dalam parent widget. Berguna untuk menentukan posisi relatif widget dalam parent.    |
    | Positioned         | Mirip dengan Align, tetapi memberikan lebih banyak kontrol terhadap posisi dan ukuran widget dalam parent.                  |
    | AspectRatio        | Digunakan untuk memastikan bahwa widget memiliki rasio aspek tertentu. Berguna saat ingin mengontrol proporsi ukuran widget, seperti gambar atau container.             |



3. Sebutkan apa saja elemen input pada form yang kamu pakai pada tugas kali ini dan jelaskan mengapa kamu menggunakan elemen input tersebut!
* `Form` yang digunakan untuk mengatur dan validasi input nama barang, jumlah barang, dan deskripsi dari barang.
* `TextFormField` yang membuat pengguna dapat melakukan input nama, jumlah, dan deskripsi barang yang ingin ditambahkan melalui sebuah text field.
4. Bagaimana penerapan clean architecture pada aplikasi Flutter?

    Penerapan Clean Architecture pada aplikasi Flutter melibatkan struktur proyek dan pembagian fokus yang terorganisir dengan tujuan agar lebih modular dan mudah diuji. Salah satu penerapan clean architecture adalah dengan membuat folder untuk membedakan file .dart untuk screen, widget, dan sebagainya.

5. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial
    1. Membuat minimal satu halaman baru pada aplikasi, yaitu halaman formulir tambah item baru dengan ketentuan sebagai berikut:
        1. Saya membuat program Dart baru dengan nama inventory_form.dart. Saya mulai dengan membuat dua kelas InventoryFormPage yang digunakan untuk menampilkan halaman formulir, kemudian kelas _InventoryFormPageState yang digunakan untuk mengelola halaman formulir.
        2. Pada method build di _InventoryFormPageState,  saya membuat widget Scaffold untuk membuat template form. Pada widget Scaffold, saya membuat objek form untuk menangani formulir dengan validasi dan juga mengelompokkan tiga elemen masukan (nama item, jumlah item, dan deskripsi item) menggunakan TextFormField.
        3. Untuk membuat tombol Save, saya menggunakan widget ElevatedButton sebagai tombol  untuk menyimpan data ke form ketika ditekan. Saya juga melakukan validasi melalui atribut key dari Form yang  diinisialisasi dengan  GlobalKey&lt;FormState();.
    2. Mengarahkan pengguna ke halaman form tambah item baru ketika menekan tombol Tambah Item pada halaman utama.

        Saya menambahkan logika kondisional pada berkas `item_card`.dart yang akan merespons saat tombol ditekan melalui fungsi onTap(). Dalam kondisional tersebut, jika tombol yang ditekan memiliki nama "TambahItem", maka aplikasi akan mengalihkan halaman ke halaman formulir. Proses pemindahan halaman ini dicapai dengan menggunakan fungsi `Navigator.push()` dan ditujukan ke kelas `InventoryFormPage` yang bertanggung jawab membangun halaman formulir.

    3. Memunculkan data sesuai isi dari formulir yang diisi dalam sebuah pop-up setelah menekan tombol Save pada halaman formulir tambah item baru.

        Pada berkas item_form.dart, setelah menempatkan semua `TextField` untuk input data, saya menambahkan tombol "Save" menggunakan objek `ElevatedButton` dalam method build pada kelas `_ItemFormPageState`. Saat tombol ini ditekan, logika pada `onPressed()` diaktifkan, dan di dalamnya, saya melakukan validasi kembali terhadap nilai-nilai input menggunakan kunci form (key). Jika validasi berhasil, saya menggunakan method showDialog untuk menampilkan pop-up yang berisi data-data barang yang akan ditambahkan ke formulir. Dengan pendekatan ini, pengguna dapat mengisi formulir, dan setelah menekan tombol "Save", sistem akan melakukan validasi sebelum menampilkan dialog informasi item yang akan ditambahkan.

    4. Membuat sebuah drawer pada aplikasi dengan ketentuan sebagai berikut:

        Saya membuat program Dart baru yang bernama `left_drawer.dart` untuk menampilkan drawer aplikasi. Di dalam program tersebut, Saya membuat kelas bernama `LeftDrawer`, yang bersifat stateless. Dalam widget build dari kelas tersebut, Saya menggunakan `ListView` untuk memulai pembangunan drawer. Kemudian, saya menggunakan `DrawerHeader` untuk membuat bagian header drawer dengan memberikan warna indigo, judul, dan sub-judul yang sesuai.


        Setelah itu, saya membuat isi dari drawer tersebut menggunakan `ListTile` sebagai item pada `ListView ` untuk menjaga keteraturan drawer. Pada `ListTile` pertama, saya menampilkan "Halaman Utama," dan ketika ListTile tersebut ditekan, saya menggunakan `Navigator.pushReplacement()` untuk mengarahkan halaman ke kelas `MyHomePage()`, yang menampilkan halaman utama. ListTile berikutnya merupakan item drawer untuk menuju ke form penambahan item. Saya juga menggunakan `Navigator.pushReplacement()`, namun kali ini diarahkan ke kelas `ItemFormPage()`, yang berfungsi untuk mengarahkan dan menampilkan pengguna ke halaman formulir penambahan item.

# Tugas 7: Elemen Dasar Flutter

Pertanyaan: 

1. Apa perbedaan utama antara stateless dan stateful widget dalam konteks pengembangan aplikasi Flutter?

    Perbedaan utama antara stateless dan stateful widget adalah sifatnya. Stateless widget bersifat statis seperti icon dan text yang tidak memerlukan perubahan berdasarkan interaksi user. Sedangkan stateful widget bersifat dinamis seperti misalnya checkbox yang dapat mengalami perubahan ketika user melakukan interaksi (awalnya box kosong menjadi ada ceklisnya).

2. Sebutkan seluruh widget yang kamu gunakan untuk menyelesaikan tugas ini dan jelaskan fungsinya masing-masing.
    * **MyApp** yang digunakan sebagai root dari aplikasi ini dan membungkus seluruh widget yang ada pada aplikasi ini. Widget ini yang dijalankan pada program utama
    * **MaterialApp** yang digunakan untuk mengatur konfigurasi global aplikasi dan menyediakan kerangka kerja untuk membangun aplikasi.
    * **MyHomePage** yang merupakan widget halaman utama aplikasi
    * **Scaffold** yang menyediakan struktur dasar untuk tampilan halaman.
    * **AppBar** yang menampilkan header atas aplikasi dengan judul.
    * **SingleChildScrollView** yang membuat konten dapat melakukan scrolling.
    * **Padding** yang menambahkan padding ke konten.
    * **Column** yang mengatur posisi children widget secara vertikal.
    * **Text** yang menampilkan teks dengan gaya tertentu.
    * **GridView.count** yang digunakan untuk mengatur tampilan berupa grid layout.
    * **ShopCard** untuk menampilkan card tombol Lihat Item, Tambah Item, dan Logout.
    * **Material** yang digunakan untuk mengatur warna latar belakang dan tampilan dasar untuk kartu.
    * **InkWell** yang memungkinkan area kartu menjadi responsif terhadap sentuhan pengguna, sehingga dapat mendeteksi ketika kartu ditekan.
    * **Container** yang digunakan untuk mengatur struktur konten dalam kotak dengan padding yang telah ditentukan.
    * **Center** yang digunakan untuk mengatur konten di tengah kartu.
    * **Icon** widget yang menampilkan ikon tertentu.
    * **SnackBar** yang digunakan untuk menampilkan pesan kepada pengguna.
3. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step (bukan hanya sekadar mengikuti tutorial)
    1. Membuat sebuah program Flutter baru dengan tema inventory seperti tugas-tugas sebelumnya.

        Pertama-tama saya membuat sebuah flutter project dengan perintah berikut


        ```shell
        flutter create meefx_sports
        cd meefx_sports
        ```

        Setelah project dibentuk, saya membuat file bernama `menu.dart` pada direktori `meefx_sports/lib` dan mengimport package `material.dart` dari flutter. Kemudian saya memindadhkan class `MyHomePage` dan `_MyHomePageState` pada `main.dart` ke `menu.dart`. Kemudian saya melakukan import menu.dart ke main.dart agar dapat mengenali class `MyHomePage` yang sudah dipindahkan.

    2. Membuat tiga tombol sederhana dengan ikon dan teks untuk:

        Untuk membuat tiga tombol sederhana, saya terlebih dahulu mengubah warna tema aplikasi menjadi Indigo. Kemudian pada class `MyHomePage` di main.dart, saya menghapus `MyHomePage(title: 'Flutter Demo Home Page')`. Pada `menu.dart`, saya mengubah state menjadi stateless agar statis dan meningkatkan performa aplikasi. Saya juga melakukan perubahan  pada bagian `({super.key, required this.title})` menjadi `({Key? key}) : super(key: key);`. Setelah itu, saya menghapus kode pada class tersebut dari final string title hingga kebawah. Untuk membuat objek informasi itemnya, saya membuat class `ShopItem` yang memiliki atribut nama dan icon.pada class `MyHomePage`, saya menambahkan kode berikut untuk menampilkan card pada halaman utama.


        ```dart
        final List<ShopItem> items = [
            ShopItem("Lihat Item", Icons.checklist, Colors.blue),
            ShopItem("Tambah Item", Icons.add_shopping_cart, const Color.fromARGB(255, 65, 133, 167)),
            ShopItem("Logout", Icons.logout, Colors.red),
          ];
        ```

        Kemudian untuk mempercantik tampilan, saya membuat AppBar, dan membuat agar tampilan pada isi halaman page dapat di scroll serta membuat agar card yang ditampilkan tertata dengan rapi menggunakan GridView. Lalu saya juga membuat class baru bernama `ShopCard` untuk membungkus ShopItem dengan card. Pada kelas tersebut, terdapat atribut ShopItem dan memiliki widget-widget yang dibutuhkan untuk membentuk sebuah card.

    3. Memunculkan Snackbar dengan tulisan:

        Untuk menampilkan snackbar ketika tombol ditekan, saya menambahkan widget InkWell yang dapat menerima respon sentuhan dari user, setelah itu saya melakukan action dengan menampilkan Widget SnackBar yang berisi teks berdasarkan ShopItem yang ditekan. Berikut adalah kodenya

        ```dart
        InkWell(
                // Area responsive terhadap sentuhan
                onTap: () {
                  // Memunculkan SnackBar ketika diklik
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(SnackBar(
                        content: Text("Kamu telah menekan tombol ${item.name}!")));
                },
        ```
