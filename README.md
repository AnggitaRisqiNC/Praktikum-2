# Praktikum 2
Nama : Anggita Risqi Nur Clarita

NIM : 312210450

Kelas : TI.22.A.4

Mata Kuliah : Basis Data

Dosen Pengampu : Agung Nugroho, S.Kom., M.Kom.

## DAFTAR ISI <br>
| No | Description | Link |
|-----|------|-----|
|1|Soal Praktikum 2|[Click Here](#soal-praktikum-2)|
|2|Skema ERD|[Click Here](#data-model-mapping)|
|3|A. Tugas Praktikum|[Click Here](#a-tugas-praktikum)|
|4|B. Tugas Praktikum|[Click Here](#b-tugas-praktikum)|
|5|PDF|[Click Here](#pdf-script-dan-output)|

## Soal Praktikum 2
[Link Soal](https://drive.google.com/file/d/1iEXNWjfuvEUgdR1sHPWkTMHqmngRIvkq/view)

### Skema ER-D
![image](https://github.com/AnggitaRisqiNC/Praktikum-2/blob/main/screenshot/ERD.png)

### Data Model Mapping
* **Mahasiswa** (nim, nama, jenis_kelamin, tgl_lahir, jalan, kota, kodepos, no_hp, kd_ds)
* **Dosen** (kd_ds, nama)
* **Matakuliah** (kd_mk, nama, sks)
* **JadwalMengajar** (kd_ds, kd_mk, hari, jam, ruang)
* **KRSMahasiswa** (nim, kd_mk, kd_ds, semester, nilai)

## A. Tugas Praktikum
### Buat DDL Script berdasarkan skema ER-D tersebut diatas
**Script :**
```sql
-- Tabel Mahasiswa
create table Mahasiswa (
  nim char(11) primary key,
  nama varchar(50),
  jenis_kelamin enum('Laki-laki', 'Perempuan'),
  tgl_lahir date,
  jalan varchar(100),
  kota varchar(50),
  kodepos varchar(10),
  no_hp varchar(15),
  kd_ds char(10),
  foreign key (kd_ds) references Dosen(kd_ds)
);

-- Tabel Dosen
create table Dosen (
  kd_ds char(10) primary key,
  nama varchar(50)
);

-- Tabel Matakuliah
create table MataKuliah (
  kd_mk char(10) primary key,
  nama varchar(50),
  sks int
);

-- Tabel JadwalMengajar
create table JadwalMengajar (
  kd_ds char(10),
  kd_mk char(10),
  hari enum('Senin', 'Selasa', 'Rabu', 'Kamis', 'Jumat', 'Sabtu', 'Minggu'),
  jam time,
  ruang varchar(10),
  primary key (kd_ds, kd_mk),
  foreign key (kd_ds) references Dosen(kd_ds),
  foreign key (kd_mk) references MataKuliah(kd_mk)
);

-- Tabel KRSMahasiswa
create table KRSMahasiswa (
  nim char(10),
  kd_mk char(5),
  kd_ds char(10),
  semester int,
  nilai decimal(5, 2),
  primary key (nim, kd_mk),
  foreign key (nim) references Mahasiswa(nim),
  foreign key (kd_mk) references MataKuliah(kd_mk),
  foreign key (kd_ds) references Dosen(kd_ds)
);
```

**Penjelasan**
Dalam script di atas, telah dibuat tabel-tabel sesuai dengan skema ERD yang telah disebutkan. Tabel-tabel tersebut antara lain: Mahasiswa, Dosen, Matakuliah, JadwalMengajar, dan KRSMahasiswa.

Setiap tabel memiliki kolom-kolom yang sesuai dengan atribut-atribut yang terdapat dalam skema ERD, dan beberapa di antaranya memiliki tipe data yang sesuai seperti VARCHAR, CHAR, ENUM, DATE, TIME, INT, dan DECIMAL. Tabel-tabel tersebut juga memiliki relasi antar tabel yang diimplementasikan menggunakan foreign key.

### Jalankan script DDL tersebut pada DBMS MySQL
**Output :**
```sql
desc Mahasiswa;
```
![image](https://github.com/AnggitaRisqiNC/Praktikum-2/blob/main/screenshot/1.png)

```sql
desc Dosen;
```
![image](https://github.com/AnggitaRisqiNC/Praktikum-2/blob/main/screenshot/2.png)

```sql
desc MataKuliah;
```
![image](https://github.com/AnggitaRisqiNC/Praktikum-2/blob/main/screenshot/3.png)

```sql
desc JadwalMengajar;
```
![image](https://github.com/AnggitaRisqiNC/Praktikum-2/blob/main/screenshot/4.png)

```sql
desc KRSMahasiswa;
```
![image](https://github.com/AnggitaRisqiNC/Praktikum-2/blob/main/screenshot/5.png)

## B. Tugas Praktikum
Berdasarkan table Mahasiswa pada praktikum sebelumnya: (nim, nama, jenis_kelamin, tgl_lahir, jalan, kota, kodepos, no_hp, kd_ds)

### 1.	Isi data pada table tersebut sebanyak minimal 5 record data.
![image](https://github.com/AnggitaRisqiNC/Praktikum-2/blob/main/screenshot/Tabel.png)

**Script :**
```sql
insert into Mahasiswa (nim, nama, jenis_kelamin, tgl_lahir, jalan, kota, kodepos, no_hp, kd_ds)
value  ('11223344', 'Ari Santoso', 'Laki-laki', '1998-10-12', NULL, 'Bekasi', NULL, NULL, NULL),
       ('11223345', 'Ario Talib', 'Laki-laki', '1999-11-16', NULL, 'Cikarang', NULL, NULL, NULL),
       ('11223346', 'Dina Marlina', 'Perempuan', '1997-12-01', NULL, 'Karawang', NULL, NULL, NULL),
       ('11223347', 'Lisa Ayu', 'Perempuan', '1996-01-02', NULL, 'Bekasi', NULL, NULL, NULL),
       ('11223348', 'Tiara Wahidah', 'Perempuan', '1908-02-05', NULL, 'Bekasi', NULL, NULL, NULL),
       ('11223349', 'Anton Sinaga', 'Laki-laki', '1988-03-10', NULL, 'Cikarang', NULL, NULL, NULL);
```

#### Tampilkan semua isi/record tabel!
```sql
select * from Mahasiswa;
```
![image](https://github.com/AnggitaRisqiNC/Praktikum-2/blob/main/screenshot/6.png)

#### Ubah data tanggal lahir mahasiswa yang bernama Ari menjadi: 1979-08-31!
```sql
update Mahasiswa set tgl_lahir = '1979-08-31' where nim = '11223344';
```
![image](https://github.com/AnggitaRisqiNC/Praktikum-2/blob/main/screenshot/7.png)

#### Tampilkan satu baris / record data yang telah diubah tadi yaitu record dengan nama Ari saja!
```sql
select * from Mahasiswa where nama = 'Ari Santoso';
```
![image](https://github.com/AnggitaRisqiNC/Praktikum-2/blob/main/screenshot/8.png)

#### Hapus Mahasiswa yang bernama Dina!
```sql
delete from Mahasiswa where nim = '11223346';
```
![image](https://github.com/AnggitaRisqiNC/Praktikum-2/blob/main/screenshot/9.png)

#### Tampilkan record atau data yang tanggal kelahirannya lebih dari atau sama dengan 1996-01-02!
```sql
select * from Mahasiswa where tgl_lahir >= '1996-01-02';
```
![image](https://github.com/AnggitaRisqiNC/Praktikum-2/blob/main/screenshot/10.png)

#### Tampilkan semua Mahasiswa yang berasal dari Bekasi dan berjenis kelamin perempuan!
```sql
select * from Mahasiswa where kota = 'Bekasi' and jenis_kelamin = 'Perempuan';
```
![image](https://github.com/AnggitaRisqiNC/Praktikum-2/blob/main/screenshot/11.png)

#### Tampilkan semua Mahasiswa yang berasal dari Bekasi dengan kelamin laki-laki atau Mahasiswa yang berumur lebih dari 22 tahun dengan kelamin wanita!
```sql
select * from Mahasiswa where kota = 'Bekasi' and (jenis_kelamin = 'Laki-laki' or (jenis_kelamin = 'Perempuan' and datediff(curdate(), tgl_lahir)/365 > 22));
```
atau bisa menggunakan script berikut :

```sql
select * from Mahasiswa where kota = 'Bekasi' and (jenis_kelamin = 'Laki-laki' or (jenis_kelamin = 'Perempuan' and tgl_lahir <= date_sub(now(), interval 22 year)));
```
![image](https://github.com/AnggitaRisqiNC/Praktikum-2/blob/main/screenshot/12.png)

#### Tampilkan data nama dan alamat mahasiswa saja dari tabel tersebut!
```sql
select nama, concat(jalan, kota, kodepos) as alamat from Mahasiswa;
```
![image](https://github.com/AnggitaRisqiNC/Praktikum-2/blob/main/screenshot/13.png)

#### Tampilkan data mahasiswa terurut berdasarkan nama!
```sql
select * from Mahasiswa order by nama asc;
```
![image](https://github.com/AnggitaRisqiNC/Praktikum-2/blob/main/screenshot/14.png)

### Apa bedanya penggunaan BETWEEN dan penggunaan operator >= dan <= ?
* (misal: `tgl_lahir BETWEEN '1990-10-10' AND '1992-10-11'`)
* (misal: `tgl_lahir >= '1990-10-10' AND tgl_lahir <= '1992-10-11'`)

**Kesimpulan :**
1.	Penggunaan **BETWEEN**:
Penggunaan *BETWEEN* dalam SQL digunakan untuk memeriksa apakah suatu nilai berada dalam rentang nilai tertentu, yang ditentukan dengan dua nilai batas (start dan end). Misalnya: `tgl_lahir BETWEEN '1990-10-10' AND '1992-10-11'`. Operator BETWEEN akan memeriksa apakah nilai ‘tgl_lahir’ berada di antara tanggal '1990-10-10' dan '1992-10-11' secara inklusif, artinya nilai yang sama dengan tanggal batas awal atau tanggal batas akhir juga akan diterima.

2.	Penggunaan operator **>=** dan **<=**:
Penggunaan operator >= (*greater than or equal to*) dan <= (*less than or equal to*) dalam SQL juga digunakan untuk memeriksa apakah suatu nilai berada dalam rentang nilai tertentu. Misalnya: `tgl_lahir >= '1990-10-10' AND tgl_lahir <= '1992-10-11'`. Operator >= akan memeriksa apakah nilai ‘tgl_lahir’ lebih besar atau sama dengan tanggal '1990-10-10', dan operator <= akan memeriksa apakah nilai tgl_lahir lebih kecil atau sama dengan tanggal '1992-10-11'. Dalam kasus ini, kedua operator tersebut akan memeriksa secara inklusif, artinya nilai yang sama dengan tanggal batas awal atau tanggal batas akhir juga akan diterima.

**Kesimpulannya**, baik penggunaan **BETWEEN** maupun penggunaan **operator >= dan <=** bisa digunakan untuk memeriksa rentang nilai pada kolom tanggal (seperti tgl_lahir) dalam SQL. Pemilihan antara keduanya tergantung pada preferensi dan kebutuhan pengguna, serta kebijakan penggunaan yang diterapkan dalam sistem atau aplikasi yang sedang digunakan.

## PDF (Script dan Output)
[Link PDF](https://drive.google.com/file/d/1gFt5Tzy0Yy8l6M90hX-OJFnhvIs4NJC1/view?usp=sharing)

## Finish