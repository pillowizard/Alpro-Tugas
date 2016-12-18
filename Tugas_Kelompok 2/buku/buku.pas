program MengolahDataBuku;
{I.S. : }
{F.S. : }

uses crt;
const
     user    = 'asdf';
     pass    = '1234';
     maxbuku = 500;
type
     dtbuku = record
          kode,tahun                              : integer;
          judul,jenis,pengarang,penerbit,kota,ket : string;
     end;
     buku = array[1..maxbuku] of dtbuku;
var
     databuku           : buku;
     username, password : string;
     menu, gagal ,n     : integer;

procedure isidatabuku (var databuku : buku);
{I.S. : }
{F.S. : }
var
     i : integer;
begin
     clrscr;
     gotoxy(20,10); write('Banyaknya buku yang akan diisi: '); readln(n);
     clrscr;
     gotoxy(1,1); write('----------------------------------------------------------------------------------------');
     gotoxy(1,2); write('|                                        DATA BUKU                                     |');
     gotoxy(1,3); write('----------------------------------------------------------------------------------------');
     gotoxy(1,4); write('| Kode | Judul Buku | Jenis Buku | Pengarang | Penerbit | Tahun |   Kota  | Keterangan |');
     gotoxy(1,5); write('----------------------------------------------------------------------------------------');
     for i := 1 to n do
     begin
          gotoxy(1,i+5); write('|');
          gotoxy(8,i+5); write('|');
          gotoxy(21,i+5); write('|');
          gotoxy(34,i+5); write('|');
          gotoxy(46,i+5); write('|');
          gotoxy(57,i+5); write('|');
          gotoxy(65,i+5); write('|');
          gotoxy(75,i+5); write('|');
          gotoxy(88,i+5); write('|');
     end;
     gotoxy(1,i+6); write('----------------------------------------------------------------------------------------');
     for i:= 1 to n do
     begin
          gotoxy(3,i+5); readln(databuku[i].kode);
          gotoxy(10,i+5); readln(databuku[i].judul);
          gotoxy(23,i+5); readln(databuku[i].jenis);
          gotoxy(36,i+5); readln(databuku[i].pengarang);
          gotoxy(48,i+5); readln(databuku[i].penerbit);
          gotoxy(59,i+5); readln(databuku[i].tahun);
          gotoxy(67,i+5); readln(databuku[i].kota);
          gotoxy(77,i+5); readln(databuku[i].ket);
     end;
     gotoxy(20,i+8); write('Tekan Enter untuk Kembali ke Menu Pilihan!'); readln;
end;

procedure tampildatabuku (var databuku : buku);
{I.S. : }
{F.S. : }
var
     i,j,min,temp : integer;
begin
     clrscr;
     gotoxy(1,1); write('----------------------------------------------------------------------------------------');
     gotoxy(1,2); write('|                                        DATA BUKU                                     |');
     gotoxy(1,3); write('----------------------------------------------------------------------------------------');
     gotoxy(1,4); write('| Kode | Judul Buku | Jenis Buku | Pengarang | Penerbit | Tahun |   Kota  | Keterangan |');
     gotoxy(1,5); write('----------------------------------------------------------------------------------------');
     for i := 1 to n do
     begin
          gotoxy(1,i+5); write('|');
          gotoxy(8,i+5); write('|');
          gotoxy(21,i+5); write('|');
          gotoxy(34,i+5); write('|');
          gotoxy(46,i+5); write('|');
          gotoxy(57,i+5); write('|');
          gotoxy(65,i+5); write('|');
          gotoxy(75,i+5); write('|');
          gotoxy(88,i+5); write('|');
     end;
     gotoxy(1,i+6); write('----------------------------------------------------------------------------------------');

     for i := 1 to (n-1) do
     begin
          min := i;
          for j := i+1 to n do
          begin
              if(databuku[j].kode > databuku[min].kode)
              then
                  min := j;
          end;
          temp := databuku[min].kode;
          databuku[min].kode := databuku[i].kode;
          databuku[i].kode := temp;
     end;
     for i:= 1 to n do
     begin
          gotoxy(3,i+5); write(databuku[i].kode);
          gotoxy(10,i+5); write(databuku[i].judul);
          gotoxy(23,i+5); write(databuku[i].jenis);
          gotoxy(36,i+5); write(databuku[i].pengarang);
          gotoxy(48,i+5); write(databuku[i].penerbit);
          gotoxy(59,i+5); write(databuku[i].tahun);
          gotoxy(67,i+5); write(databuku[i].kota);
          gotoxy(77,i+5); write(databuku[i].ket);
     end;
     gotoxy(20,i+8); write('Tekan Enter untuk Kembali ke Menu Pilihan!'); readln;
end;

begin
     gagal := 0;
     repeat
     clrscr;
     gotoxy(22,10); write('Program Data Buku');
     gotoxy(22,11); write('-----------------');
     gotoxy(29,13); write('Username : '); readln(username);
     gotoxy(29,14); write('Password : '); readln(password);
     gagal := gagal+1;
     if(username <> user) or (password <> pass)
     then
     begin
            clrscr;
            writeln('--------------------------------------------------------------------------------');
            writeln('|     Username atau Password Salah                                             |');
            writeln('|     Tekan Enter untuk Ulangi!                                                |');
            writeln('--------------------------------------------------------------------------------');
           readln;
     end
     else
     begin
          repeat
          clrscr;
          gotoxy(38,5); write('Menu Pilihan');
          gotoxy(38,6); write('------------');
          gotoxy(30,8); write('1. Isi Data Buku');
          gotoxy(30,9); write('2. Tampil Data Buku');
          gotoxy(30,10); write('0. Keluar');
          gotoxy(28,12); write('Pilih Menu : '); readln(menu);
          case (menu) of
               1 : isidatabuku(databuku);
               2 : begin
                   if(n = 0)
                   then
                   begin
                       clrscr;
                       gotoxy(20,10); write('Data tidak tersedia, pilih menu 1 terlebih dahulu!'); readln;
                   end
                   else
                   begin
                       tampildatabuku(databuku);
                   end;
                   end;
          end;
          until menu = 0;
     end;

     if(gagal > 2)
     then
     begin
           clrscr;
           writeln('--------------------------------------------------------------------------------');
           writeln('|     Maaf anda sudah 3 kali gagal login!                                      |');
           writeln('|     Tekan Enter untuk keluar program!                                        |');
           writeln('--------------------------------------------------------------------------------');
     end;

     until ((username = user) and (password = pass)) or (gagal = 3);
     readln;
end.
