program nilai_akhir;
{I.S. : }
{F.S. : }
uses crt;
const
     maxmk  = 7;
     maxmhs = 45;
type
     larik      = array[1..maxmhs] of string;
     matriks1   = array[1..maxmk,1..maxmhs] of string;
     matriks2   = array[1..maxmk,1..maxmhs] of integer;
var
     matkul,nim       : larik;
     indeks           : matriks1;
     nilai            : matriks2;
     n,m              : integer;

function idx(nila : integer):string;
{I.S. : }
{F.S. : }
begin
   case (nila) of
      80..100 : idx := '  A  ';
      70..79  : idx := '  B  ';
      60..69  : idx := '  C  ';
      50..59  : idx := '  D  ';
      0..49   : idx := '  E  ';
   end; //endcase
end; //endfunction


procedure isidata (var matkul,nim : larik; var m,n : integer);
{I.S. : }
{F.S. : }
var
     i,j : integer;
begin
     write('Banyaknya Mata Kuliah : '); readln(n);
     write('Banyaknya Mahasiswa   : '); readln(m);
     clrscr;
     //validasi banyaknya mata kuliah & mahasiswa
     while (n > maxmk) or (m > maxmhs) do
     begin
          writeln('Banyaknya Mata Kuliah atau Mahasiswa tidak sesuai!');
          writeln('Isi kembali banyaknya Mata Kuliah (1-7) dan Mahasiswa (1-100)!');
          write('Banyaknya Mata Kuliah : '); readln(n);
          write('Banyaknya Mahasiswa   : '); readln(m);
     end; //endwhile
     clrscr;
     //mengisi nama matkul
     i := 1;
     writeln('DAFTAR NILAI MAHASISWA');
     writeln;
     gotoxy(1,2); write('----------');
     gotoxy(1,3); write('|   NIM  ');
     gotoxy(1,4); write('----------');
     repeat
     begin
          gotoxy(i*10+1,2); write('-----------');
          gotoxy(i*10+1,4); write('-----------');
          gotoxy(i*10+1,3); write('|');
          gotoxy(i*10+3,3); readln(matkul[i]);
          gotoxy(i*10+11,3); write('|');
          i := i + 1;
     end;
     until i = n+1;
     //mengisi nim
     window(1,1,11,45);
     for i := 1 to m do
     begin
           gotoxy(1,i+4); write('|         |');
           gotoxy(1,i+5); write('-----------');
           gotoxy(3,i+4); readln(nim[i]);
     end; //endfor
     //mengisi nilai
     window(12,5,(n*10)+11,m+5); textbackground(white); clrscr;
     textcolor(black);
     for i := 1 to m do
     begin
          for j := 1 to n do
          begin
               gotoxy(j*10-7,i); readln(nilai[i,j]);
               gotoxy(j*10,i); write('|');
               indeks[i,j] := idx(nilai[i,j]);
               gotoxy(j*10-7,i); write(indeks[i,j]);
               gotoxy(j*10,i); write('|');
          end;
     end;
end; //endprocedure

//program utama
begin
     isidata(matkul,nim,m,n);
     readln;
end.
