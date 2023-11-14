# Identitas Diri
**Nama: Muhammad Fakhri Robbani**

**NPM: 2206026252**

**Kelas: PBP C**

# Daftar Isi
* [Tugas 7](#Tugas-8:-Flutter-Navigation,-Layouts,-Forms,-and-Input-Elements)
* [Tugas 8](#Tugas-7:-Elemen-Dasar-Flutter)

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
