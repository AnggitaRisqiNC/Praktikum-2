create database praktikum2;
use praktikum2;
create table Mahasiswa (nim char(11) primary key, nama varchar(50), jenis_kelamin enum('Laki-laki', 'Perempuan'), tgl_lahir date, jalan varchar(100), kota varchar(50), kodepos varchar(10), no_hp varchar(15), kd_ds char(10), foreign key (kd_ds) references Dosen(kd_ds));
create table Dosen (kd_ds char(10) primary key, nama varchar(50));
create table MataKuliah (kd_mk char(10) primary key, nama varchar(50), sks int);
create table JadwalMengajar (kd_ds char(10), kd_mk char(10), hari enum('senin', 'selasa', 'rabu', 'kamis', 'jumat', 'sabtu', 'minggu'), jam time, ruang varchar(10), primary key (kd_ds, kd_mk), foreign key (kd_ds) references Dosen(kd_ds), foreign key (kd_mk) references MataKuliah(kd_mk));
create table KRSMahasiswa (nim char(10), kd_mk char(5), kd_ds char(10), semester int, nilai decimal(5, 2), primary key (nim, kd_mk), foreign key (nim) references Mahasiswa(nim), foreign key(kd_mk) references MataKuliah(kd_mk), foreign key (kd_ds) references Dosen(kd_ds));
desc Mahasiswa;
desc Dosen;
desc MataKuliah;
desc JadwalMengajar;
desc KRSMahasiswa;
insert into Mahasiswa (nim, nama, jenis_kelamin, tgl_lahir, jalan, kota, kodepos, no_hp, kd_ds)
value  ('11223344', 'Ari Santoso', 'Laki-laki', '1998-10-12', NULL, 'Bekasi', NULL, NULL, NULL),
       ('11223345', 'Ario Talib', 'Laki-laki', '1999-11-16', NULL, 'Cikarang', NULL, NULL, NULL),
       ('11223346', 'Dina Marlina', 'Perempuan', '1997-12-01', NULL, 'Karawang', NULL, NULL, NULL),
       ('11223347', 'Lisa Ayu', 'Perempuan', '1996-01-02', NULL, 'Bekasi', NULL, NULL, NULL),
       ('11223348', 'Tiara Wahidah', 'Perempuan', '1908-02-05', NULL, 'Bekasi', NULL, NULL, NULL),
       ('11223349', 'Anton Sinaga', 'Laki-laki', '1988-03-10', NULL, 'Cikarang', NULL, NULL, NULL);
select * from Mahasiswa;
update Mahasiswa set tgl_lahir='1979-08-31' where nim='11223344';
select * from Mahasiswa where nama='Ari Santoso';
delete from Mahasiswa where nim='11223346';
select * from Mahasiswa where tgl_lahir>='1996-01-02';
select * from Mahasiswa where kota='Bekasi' and jenis_kelamin='Perempuan';
select * from Mahasiswa where kota = 'Bekasi' and (jenis_kelamin = 'Laki-laki' or (jenis_kelamin = 'Perempuan' and datediff(curdate(), tgl_lahir)/365 > 22));
select nama, concat(jalan, kota, kodepos) as alamat from Mahasiswa;
select * from Mahasiswa order by nama asc;