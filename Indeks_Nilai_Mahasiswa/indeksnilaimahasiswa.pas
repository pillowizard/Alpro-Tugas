program indeks_nilai_mahasiswa;
{I.S. : user memasukan banyaknya mata kuliah (kolom), banyaknya mahasiswa (baris),
        mata kuliah, nim, dan nilai}
{F.S. : menampilkan daftar indeks nilai mahasiswa}

//kamus global
uses crt;
const
   maxmk  = 8;
   maxmhs = 45;
type
   larik    = array[1..maxmhs] of string;
   matriks1 = array[1..maxmhs,1..maxmk] of string;
   matriks2 = array[1..maxmhs,1..maxmk] of integer;
var
   matakuliah, nim : larik;
   nilaimutu       : matriks1;
   nilaiakhir      : matriks2;
   kolom, baris    : integer;

procedure tampiltabel(var kolom, baris : integer);
{I.S. : user memasukan banyaknya mata kuliah (kolom), banyaknya mahasiswa (baris),
        mata kuliah, nim, dan nilai}
{F.S. : menampilkan daftar indeks nilai mahasiswa}
var //kamus lokal
   i, j : integer;
begin
   gotoxy(25,7);  write('Program Indeks Nilai Mahasiswa');
   gotoxy(25,8);  write('------------------------------');
   gotoxy(28,10); write('Banyaknya Mata Kuliah : '); readln(kolom);
   gotoxy(28,11); write('Banyaknya Mahasiswa   : '); readln(baris);
   clrscr;

   //validasi banyaknya mata kuliah & mahasiswa
   while (kolom > maxmk) or (baris > maxmhs) do
   begin
      textbackground(red);
      writeln('--------------------------------------------------------------------------------');
      writeln('|     Banyaknya Mata Kuliah Maksimal 8 dan Banyaknya Mahasiswa Maksimal 45     |');
      writeln('|     Silahkan Ulangi!                                                         |');
      writeln('--------------------------------------------------------------------------------');
      textbackground(black);
      gotoxy(25,7);  write('Program Indeks Nilai Mahasiswa');
      gotoxy(25,8);  write('------------------------------');
      gotoxy(26,10); write('Banyaknya Mata Kuliah : '); readln(kolom);
      gotoxy(26,11); write('Banyaknya Mahasiswa   : '); readln(baris);
   end; //endwhile
   clrscr;

   window(1,1,80,15);
   textcolor(white);
   textbackground(green);
   gotoxy(1,1);
   write('--------------------------------------------------------------------------------');
   gotoxy(1,2);
   write('|                                 CARA PENGISIAN TABEL                         |');
   gotoxy(1,3);
   write('--------------------------------------------------------------------------------');
   gotoxy(1,4);
   write('|                                  Kode Mata  Kuliah                           |');
   gotoxy(1,5);
   write('|           (1) Agama dan Etika            (5) Pengantar Ilmu Komputer         |');
   gotoxy(1,6);
   write('|           (2) Kalkulus I                 (6) Software Terapan I              |');
   gotoxy(1,7);
   write('|           (3) Fisika Dasar               (7) Aplikasi IT I                   |');
   gotoxy(1,8);
   write('|           (4) Praktikum Fisika Dasar     (8) Algotitma dan Pemrograman       |');
   gotoxy(1,9);
   write('--------------------------------------------------------------------------------');
   gotoxy(1,10);
   write('|                 Baris pertama diisi dengan angka kode mata kuliah            |');
   gotoxy(1,11);
   write('|                  Baris kedua dan seterusnya mengisi NIM dan Nilai            |');
   gotoxy(1,12);
   write('|                         NIM diisi dengan 8 digit angka                       |');
   gotoxy(1,13);
   write('|                        Nilai diisi dengan angka 1 - 100                      |');
   gotoxy(1,14);
   write('--------------------------------------------------------------------------------');
   window(1,17,100,68);
   textbackground(black);
   textcolor(white);
   gotoxy(25,3); write('DAFTAR INDEKS NILAI MAHASISWA');
   gotoxy(1,4); write('-----------');
   gotoxy(1,5); write('|   NIM    ');
   gotoxy(1,6); write('-----------');

   i := 1;
   repeat
   begin
      gotoxy(i*10+2,4); write('-----------');
      gotoxy(i*10+2,5); write('|');
      gotoxy(i*10+4,5); write('MK_',i);
      gotoxy(i*10+12,5); write('|');
      gotoxy(i*10+2,6); write('-----------');
      i := i + 1;
   end; //endrepeat
   until i = kolom + 1;

   for i := 1 to baris do
   begin
      If (i > 9)
         then
         begin
            gotoxy(1,i+6); write('|  NIM_',i,'  |');
         end
         else
         begin
            gotoxy(1,i+6); write('|  NIM_',i,'   |');
         end; //endif

      for j := 1 to kolom do
      begin
         gotoxy(j*10+4,i+6); write('Nilai');
         gotoxy(j*10+12,i+6); write('|');
      end; //endfor
      gotoxy(1,i+7); write('------------');
   end; //endfor

   //garis penutup tabel
   for j := 1 to kolom do
   begin
      gotoxy(j*10+3,i+7); write('----------');
   end; //endfor
end; //endprocedure

function mkuliah (matakuliah : integer) : string;
{I.S. : matakuliah sudah terdefinisi}
{F.S. : menghasilkan fungsi mkuliah}
begin
   case (matakuliah) of
      1 : mkuliah := 'Agama';
      2 : mkuliah := 'Kalkul';
      3 : mkuliah := 'Fisdas';
      4 : mkuliah := 'PFisdas';
      5 : mkuliah := 'PIK';
      6 : mkuliah := 'Softer';
      7 : mkuliah := 'Apl IT';
      8 : mkuliah := 'Alpro';
   end; //endcase
end; //endfunction

function indeksnilai(nilaiakhir : integer):string;
{I.S. : nilaiakhir sudah terdefinisi}
{F.S. : menghasilkan fungsi indeks nilai}
begin
   case (nilaiakhir) of
      80..100 : indeksnilai := '    A    ';
      70..79  : indeksnilai := '    B    ';
      60..69  : indeksnilai := '    C    ';
      50..59  : indeksnilai := '    D    ';
      0..49   : indeksnilai := '    E    ';
   end; //endcase
end; //endfunction

procedure isidata (kolom, baris : integer);
{I.S. : }
{F.S. : }
var
   i, j, matkul : integer;
begin
   //mengisi mata kuliah
   i := 1;
   repeat
   begin
      gotoxy(i*10+4,5); write('    ');
      gotoxy(i*10+4,5); readln(matkul);

      //validasi mengisi mata kuliah
         while(matkul > 8) or (matkul < 1) do
         begin
            gotoxy(i*10+6,i+6); write('   ');
            gotoxy(15,1);     write('Mata Kuliah diisi dengan angka 1 - 8, Silahkan Ulangi!');
            gotoxy(i*10+6,i+6); readln(matkul);
            gotoxy(25,1);     DELLINE;
            gotoxy(25,1); INSLINE;
         end; //endwhile

      matakuliah[i] := mkuliah(matkul);
      gotoxy(i*10+4,5); write(' ');
      gotoxy(i*10+4,5); write(matakuliah[i]);
      i := i + 1;
   end; //endrepeat
   until i = kolom + 1;

   //mengisi nim dan nilai akhir
   for i := 1 to baris do
   begin
      gotoxy(3,i+6); write('       ');
      gotoxy(3,i+6); readln(nim[i]);
      for j := 1 to kolom do
      begin
         gotoxy(j*10+4,i+6); write('       ');
         gotoxy(j*10+6,i+6); readln(nilaiakhir[i,j]);

         //validasi mengisi nilai
         while(nilaiakhir[i,j] > 100) or (nilaiakhir [i,j] < 1) do
         begin
            gotoxy(j*10+6,i+6); write('    ');
            gotoxy(15,1);     write('Nilai diisi dengan angka 1 - 100, Silahkan Ulangi!');
            gotoxy(j*10+6,i+6); readln(nilaiakhir[i,j]);
            gotoxy(25,1);     DELLINE;
            gotoxy(25,1);     INSLINE;
         end; //endwhile

         nilaimutu[i,j] := indeksnilai(nilaiakhir[i,j]);
         gotoxy(j*10+3,i+6); write(nilaimutu[i,j]);
      end; //endfor
   end; //endfor
end; //endprocedure

//program utama
begin
   tampiltabel(kolom, baris);
   isidata(kolom, baris);
   readln;
end.
