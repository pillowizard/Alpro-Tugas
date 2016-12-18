program indeks_nilai_mahasiswa;
{I.S. : user memasukan banyaknya mata kuliah (kolom), banyaknya mahasiswa (baris),
        mata kuliah, nim, dan nilai}
{F.S. : menampilkan daftar indeks nilai mahasiswa}

//kamus global
uses crt;
const
   maxmk  = 8;
   maxmhs = 50;
type
   larik    = array[1..maxmhs] of string;
   matriks1 = array[1..maxmk,1..maxmhs] of string;
   matriks2 = array[1..maxmk,1..maxmhs] of integer;
var
   matakuliah, nim : larik;
   nilaimutu       : matriks1;
   nilaiakhir      : matriks2;
   baris, kolom    : integer;

function indeksnilai(nilaiakhir : integer) : string;
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


procedure isidata (var matakuliah, nim : larik; var kolom, baris : integer);
{I.S. : user memasukan banyaknya mata kuliah (kolom), banyaknya mahasiswa (baris),
        mata kuliah, nim, dan nilai}
{F.S. : menampilkan daftar indeks nilai mahasiswa}
var //kamus lokal
   i, j : integer;
begin
   gotoxy(24,7);  write('Program Indeks Nilai Mahasiswa');
   gotoxy(24,8);  write('------------------------------');
   gotoxy(26,10); write('Banyaknya Mata Kuliah : '); readln(kolom);
   gotoxy(26,11); write('Banyaknya Mahasiswa   : '); readln(baris);
   clrscr;

   //validasi banyaknya mata kuliah dan mahasiswa
   while (kolom > maxmk) or (baris > maxmhs) do
   begin
      textbackground(red);
      writeln('--------------------------------------------------------------------------------');
      writeln('|     Banyaknya Mata Kuliah Maksimal 8 dan Banyaknya Mahasiswa Maksimal 50     |');
      writeln('|     Silahkan Ulangi!                                                         |');
      writeln('--------------------------------------------------------------------------------');
      writeln;
      textbackground(black);
      write('Banyaknya Mata Kuliah : '); readln(kolom);
      write('Banyaknya Mahasiswa   : '); readln(baris);
   end; //endwhile

   window(1,1,100,49);
   textbackground(green); textcolor(white);
   writeln('--------------------------------------------------------------------------------');
   writeln('|                                CARA PENGISIAN TABEL                          |');
   writeln('--------------------------------------------------------------------------------');
   writeln('|                        Baris pertama mengisi nama mata kuliah                |');
   writeln('|                  Baris Kedua dan seterusnya mengisi NIM dan nilai            |');
   writeln('|                      Mata Kuliah maksimal diisi dengan 7 huruf               |');
   writeln('|                            NIM diisi dengan 8 digit angka                    |');
   writeln('|                           Nilai diisi dengan angka 1 - 100                   |');
   writeln('--------------------------------------------------------------------------------');

   textbackground(black);
   gotoxy(30,11); write('DAFTAR INDEKS NILAI MAHASISWA');
   gotoxy(1,12); write('-----------');
   gotoxy(1,13); write('|    NIM   ');
   gotoxy(1,14); write('-----------');

   //mengisi mata kuliah
   i := 1;
   repeat
   begin
      gotoxy(i*10+2,12);  write('-----------');
      gotoxy(i*10+2,13);  write('|');
      gotoxy(i*10+12,13); write('|');
      gotoxy(i*10+2,14);  write('-----------');
      gotoxy(i*10+4,13);  readln(matakuliah[i]);
      i := i + 1;
   end; //endrepeat
   until i = kolom + 1;

   //mengisi nim dan nilai
   window(1,14,100,49);
   for i := 1 to baris do
   begin
      gotoxy(1,i+1); write('|          |');
      gotoxy(3,i+1); readln(nim[i]);
      for j := 1 to kolom do
      begin
         gotoxy(j*10+3,i+1);  write('          ');
         gotoxy(j*10+6,i+1);  readln(nilaiakhir[i,j]);
         //validasi
         while(nilaiakhir[i,j] > 100) or (nilaiakhir[i,j] < 1) do
         begin
            gotoxy(j*10+12,i+1); write('|');
            nilaimutu[i,j] := indeksnilai(nilaiakhir[i,j]);
            gotoxy(j*10+3,i+1);  write(nilaimutu[i,j]);
            gotoxy(j*10+12,i+1); write('|');
         end;
      end; //endfor
      gotoxy(1,i+2); write('------------');
   end; //endfor
end; //endprocedure

//program utama
begin
   isidata(matakuliah, nim, baris, kolom);
   readln;
end.
