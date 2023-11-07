# Identitas Diri
**Nama: Muhammad Fakhri Robbani**

**NPM: 2206026252**

**Kelas: PBP C**

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
