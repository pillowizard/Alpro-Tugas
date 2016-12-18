program Identitas_Mahasiswa;
{I.S. : User memasukan NIM, Nama, Kelas dan Prodi}
{F.S. : menampilkan identitas mahasiswa}

uses crt;
var
   NIM: integer;
   Nama, Kelas, Prodi: string;

begin
     textbackground(blue); clrscr;
     write('NIM   : '); readln(NIM);
     write('Nama  : '); readln(Nama);
     write('Kelas : '); readln(Kelas);
     write('Prodi : '); readln(Prodi);
     writeln;
     textcolor(15);                  write('Saya bernama ');
     textcolor(yellow);             write(Nama);
     textcolor(15);                  write(' dengan NIM ');
     textcolor(yellow);             writeln(NIM);
     textcolor(15);                  write('berada di Kelas ');
     textcolor(yellow);             write(Kelas);
     textcolor(15);                  write(' program studi ');
     textcolor(yellow);             write(Prodi);
     textcolor(15);                  write(' UNIKOM');
     readln    ;
end.
