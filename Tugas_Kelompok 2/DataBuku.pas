program Data_Buku;
{I.S.: }
{F.S.: }
uses crt;
const
   maxbuku = 500;
   user = 'asdf';
   pass = '1234';
type
   dtbuku = record
      kode, tahun : integer;
      judul, jenis, pengarang, penerbit, kota, keterangan : string;
   end;
   buku = array[1..maxbuku] of dtbuku;
var
   databuku           : buku;
   menu, gagal        : integer;
   username, password : string;

procedure isidatabuku (var databuku : buku);
{I.S.: }
{F.S.: }
var
   i : integer;
   option : char;
begin
   i := 1;
   repeat
      begin
         writeln('Data Buku ke ',i);
         writeln('--------------');
         write('Kode Buku    : '); readln(databuku[i].kode);
         write('Judul Buku   : '); readln(databuku[i].judul);
         write('Jenis Buku   : '); readln(databuku[i].jenis);
         write('Pengarang    : '); readln(databuku[i].pengarang);
         write('Penerbit     : '); readln(databuku[i].penerbit);
         write('Tahun Terbit : '); readln(databuku[i].tahun);
         write('Kota Terbit  : '); readln(databuku[i].kota);
         write('Keterangan   : '); readln(databuku[i].keterangan);
         writeln;
         write('Apakah anda ingin mengisi data buku lagi? (y/n) : '); readln(option);
         writeln;
         i := i + 1;
      end;
   until (option = 'n')
end;

procedure tampildatabuku (var databuku : buku);
{I.S.: }
{F.S.: }
var
   i : integer;
begin
   clrscr;
   gotoxy(1,1); write('-------------------------------------------------------------------------------------------------');
   gotoxy(1,2); write('|                                              DATA BUKU                                        |');
   gotoxy(1,3); write('-------------------------------------------------------------------------------------------------');
   gotoxy(1,4); write('| Kode |     Judul     |    Jenis    |  Pengarang  |  Penerbit  | Tahun |   Kota   | Keterangan |');
   gotoxy(1,5); write('-------------------------------------------------------------------------------------------------');

end;

//program utama
begin
   textbackground(white);
   clrscr;
   textcolor(black);
   gotoxy(34,7); write('Program Data Buku');
   gotoxy(34,8); write('-----------------');
   gotoxy(32,9); write('Username : '); readln(username);
   gotoxy(32,10); write('Password : '); readln(password);
   clrscr;
   gagal := 1;
   repeat
   begin
      //validasi username dan password
      if (username <> user) or (password <> pass)
         then
         begin
            textbackground(red);
            writeln('--------------------------------------------------------------------------------');
            writeln('|     Username atau Password Salah                                             |');
            writeln('|     Silahkan Ulangi!                                                         |');
            writeln('--------------------------------------------------------------------------------');
            writeln;
            textbackground(white);
            textcolor(black);
            gotoxy(34,7); write('Program Data Buku');
            gotoxy(34,8); write('-----------------');
            gotoxy(32,9); write('Username : '); readln(username);
            gotoxy(32,10); write('Password : '); readln(password);
            clrscr;
         end
         else
         begin
            textbackground(white);
            clrscr;
            textcolor(black);
            gotoxy(34,7); write('Menu Pilihan');
            gotoxy(34,8); write('------------');
            gotoxy(22,9); write('1. Isi Data Buku');
            gotoxy(22,10); write('2. Tampil Data Buku');
            gotoxy(22,11); write('0. Keluar');
            gotoxy(22,13); write('Pilihan Anda : ');
            readln(menu);
            //validasi menu pilihan
            if(menu > 2)
               then
               begin
                  clrscr;
                  textbackground(red);
                  writeln('--------------------------------------------------------------------------------');
                  writeln('|     Menu Tidak Tersedia                                                      |');
                  writeln('|     Tekan Enter untuk Kembali ke Menu Pilihan                                |');
                  writeln('--------------------------------------------------------------------------------');
                  readln;
               end; //endif
            case (menu) of
            1 : begin
                   clrscr;
                   isidatabuku(databuku);
                   write('Tekan Enter untuk Kembali ke Menu Pilihan');
                   readln;
                end;
            2 : begin
                   tampildatabuku(databuku);
                   readln;
                end;
            end; //endcase
         end; //endif
   gagal := gagal + 1;
   end; //endrepeat
   until (gagal = 3) and (menu = 0);
end.
