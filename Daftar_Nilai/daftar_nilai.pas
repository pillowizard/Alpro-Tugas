program Daftar_Nilai;
{I.S.: user memasukan data mahasiswa (1:N)}
{F.S.: menampiilkan daftar nilai mahasiswa}
uses crt;
//kamus global
const
   MaksMhs = 5;
type
   Dt_Mhs = record
      NIM, Nama : string;
      Nilai     : integer;
      Indeks    : char;
   end;  //endrecord
   Mahasiswa = array[1..MaksMhs] of Dt_Mhs;
var
   Mhs : Mahasiswa;
   N : integer;

function IndeksNilai (Nilai : integer) : char;
{I.S.: nilai sudah terdefinisi}
{F.S.: menghasilkan fungsi indeks nilai}
begin
   Case (Nilai) of
      80..100 : IndeksNilai := 'A';
      70..79  : IndeksNilai := 'B';
      60..69  : IndeksNilai := 'C';
      50..59  : IndeksNilai := 'D';
      0..49   : IndeksNilai := 'E';
   end; //endcase
end; //endfunction

function rata_rata(var total,n : integer):real;
{I.S. : total (total nilai) dan n (banyaknya data) sudah terdefinisi}
{F.S. : fungsi rata-rata sudah terdefinisi}
begin
     rata_rata := total/n;
end;

function nmax(var Mhs : mahasiswa; n : integer):integer;
{I.S. : }
{F.S. : }
var
   tinggi,i : integer;
begin
     tinggi := Mhs[1].Nilai;
     for i := 2 to N do
     begin
         If(Mhs[i].Nilai > tinggi)
               then
                   tinggi := Mhs[i]. Nilai;
     end;
     nmax := tinggi;
end;

function nmin(var Mhs : mahasiswa; n : integer):integer;
{I.S. : }
{F.S. : }
var
   rendah,i : integer;
begin
     rendah := Mhs[1].Nilai;
     for i  := 2 to N do
     begin
         If(Mhs[i].Nilai < rendah)
               then
                   rendah := Mhs[i]. Nilai;
     end;
     nmin := rendah;
end;

procedure IsiData(var Mhs : Mahasiswa; var N : integer);
{I.S.: user memasukan data mahasiswa (1:N)}
{F.S.: menghasilkan data mahasiswa (1:N)}
var
   i : integer;
begin
   //memasukan banyaknya data (N)
   write('Banyaknya Data : '); readln(N);
   //membuat header tabel
   clrscr;
   writeln('                DAFTAR NILAI MAHASISWA             ');
   writeln('---------------------------------------------------');
   writeln('| No |    NIM   | Nama Mahasiswa | Nilai | Indeks |');
   writeln('===================================================');
   //memasukan data mahasiswa (1:N)
   for i := 1 to N do
   begin
      gotoxy(1,i+4);
      write('|    |          |                |       |        |');
      //meampilkan nomor urut
      gotoxy(3,i+4); write(i);
      //memasukkan NIM
      gotoxy(8,i+4); readln(Mhs[i].NIM);
      //memasukkan Nama
      gotoxy(19,i+4); readln(Mhs[i].Nama);
      //memasukkan Nilai
      gotoxy(37,i+4); readln(Mhs[i].Nilai);
      //memanggil fungsi indeks nilai
      Mhs[i].Indeks := IndeksNilai(Mhs[i].Nilai);
      //menampilkan indeks nilai
      gotoxy(46,i+4); write(Mhs[i].Indeks);
   end;//endfor
   //garis penutup tabel
   writeln;
   writeln('---------------------------------------------------');
end; //endprocedure

procedure urutNIM (var Mhs : Mahasiswa; N : integer);
{I.S.: data mahasiswa (1:N) sudah terdefinisi}
{F.S.: menghasilkan data mahasiswa yang sudah terurut berdasarkan NIM secara Ascending menggunakan metode Maximum Sort}
var
   i,j,max : integer;
   Temp : Dt_Mhs;
begin
   for i := 1 to (N-1) do
   begin
      Max := 1;
      for j := 2 to ((N+1)-i) do
      begin
         if (Mhs[j].NIM > Mhs[max].NIM)
            then
               max := j;
      end; //endfor
      Temp     := Mhs[j];
      Mhs[j]   := Mhs[max];
      Mhs[max] := Temp;
   end; //endfor
end; //endprocedure

procedure TampilData(Mhs : Mahasiswa;  N : integer);
{I.S.: data mahasiswa (1:N) sudah terdefinisi}
{F.S.: menampilkan daftar nilao mahasiswa}
var
   i,total,IdxA,IdxB,IdxC,IdxD,IdxE : integer;
begin
   //membuat header tabel
   clrscr;
   writeln('                DAFTAR NILAI MAHASISWA             ');
   writeln('---------------------------------------------------');
   writeln('| No |    NIM   | Nama Mahasiswa | Nilai | Indeks |');
   writeln('---------------------------------------------------');
   IdxA := 0;
   IdxB := 0;
   IdxC := 0;
   IdxD := 0;
   IdxE := 0;
   total := 0;
   for i := 1 to N do
   begin
      //menentukan banyaknya indeks
      case (Mhs[i].Indeks) of
           'A' : IdxA := IdxA + 1;
           'B' : IdxB := IdxB + 1;
           'C' : IdxC := IdxC + 1;
           'D' : IdxD := IdxD + 1;
           'E' : IdxE := IdxE + 1;
      end; //endcase
      gotoxy(1,i+4);
      write('|    |          |                |       |        |');
      //meampilkan nomor urut
      gotoxy(3,i+4); write(i);
      //memasukkan NIM
      gotoxy(8,i+4); write(Mhs[i].NIM);
      //memasukkan Nama
      gotoxy(19,i+4); write(Mhs[i].Nama);
      //memasukkan Nilai
      gotoxy(37,i+4); write(Mhs[i].Nilai);
      //menampilkan indeks nilai
      gotoxy(46,i+4); write(Mhs[i].Indeks);
      total := total + Mhs[i].Nilai;
   end;//endfor
   //garis penutup tabel
   writeln;
   writeln('---------------------------------------------------');
   writeln;
   writeln('Rata-rata Nilai : ',rata_rata(total,N):0:1);
   writeln('Nilai Tertinggi : ',nmax(Mhs,N));
   writeln('Nilai Terendah  : ',nmin(Mhs,N));
   writeln('Jumlah Indeks A : ',IdxA);
   writeln('Jumlah Indeks B : ',IdxB);
   writeln('Jumlah Indeks C : ',IdxC);
   writeln('Jumlah Indeks D : ',IdxD);
   writeln('Jumlah Indeks E : ',IdxE);
end; //endprocedure

procedure CariNIM(Mhs : Mahasiswa; N : integer);
{I.S.: data mahasiswa (1:N) sudah terdefinisi}
{F.S.: menampilkan data mahasiswa berdasarkan NIM tertentu menggunakan metode sequential search dengan boolean}
var
   i       : integer;
   NIMCari : string;
   Ketemu  : boolean;
begin
   clrscr;
   write('NIM yang Dicari : '); readln(NIMCari);
   clrscr;
   i := 1;
   Ketemu := false;
   while (Not Ketemu) and (i <= N) do
   begin
      if(Mhs[i].NIM = NIMCari)
      then
         Ketemu := true
      else
         i := i + 1;
   end; //endwhile
   if(Ketemu)
   then
   begin
      writeln('NIM yang Dicari : ', NIMCari);
      writeln('Nama Mahasiswa  : ', Mhs[i].Nama);
      writeln('Nilai           : ', Mhs[i].Nilai);
      writeln('Indeks Nilai    : ', Mhs[i].Indeks);
   end
   else
      writeln('NIM ',NIMCari,' tidak ditemukan!');
   readln;
end; //endprocedure

procedure CariNilai(Mhs : Mahasiswa; N : integer);
{I.S.: data mahasiswa (1:N) sudah terdefinisi}
{F.S.: menampilkan data mahasiswa berdasarkan Nilai tertentu menggunakan metode sequential search dengan boolean}
var
   i,j,No    : integer;
   NilaiCari : integer;
   Ketemu    : boolean;
begin
   clrscr;
   write('Nilai yang Dicari : '); readln(NilaiCari);
   clrscr;
   i := 1;
   Ketemu := false;
   while (Not Ketemu) and (i <= N) do
   begin
      if(Mhs[i].Nilai = NilaiCari)
      then
         Ketemu := true
      else
         i := i + 1;
   end; //endwhile
   if(Ketemu)
   then
   begin
      writeln('    DAFTAR NILAI MAHASISWA   ');
      writeln('Nilai  : ', NilaiCari);
      writeln('-----------------------------');
      writeln('|    NIM   | Nama Mahasiswa |');
      writeln('-----------------------------');
      No := 0;
      for j := i to N do
      begin
         if(Mhs[j].Nilai = NilaiCari)
         then
         begin
            No := No + 1;
            gotoxy(1,No+5);
            writeln('|          |                |');
            gotoxy(3,No+5); write(Mhs[j].NIM);
            gotoxy(14,No+5); write(Mhs[j].Nama);
         end; //endif
      end; //endfor
      //garis penutup tabel
      writeln;
      writeln('-----------------------------');
      writeln('Jumlah Mahasiswa Nilai ',NilaiCari,' sebanyak ',No,' Mahasiswa');
   end
   else
      writeln('Nilai ',NilaiCari,' tidak ditemukan!');
   readln;
end; //endprocedure

//program utama
begin
   IsiData(Mhs,N);
   readln;
   CariNIM(Mhs,N);
   CariNilai(Mhs,N);
   //UrutNIM(Mhs,N);
   //TampilData(Mhs,N);
   readln;
end.
