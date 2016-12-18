program koperasi;
{I.S. : }
{F.S. : }
uses crt;
const
     username = 'koperasi';
     password = '12345678';
     maxdata  = 1000;
type
     dt_a = record
          id          :integer;
          ktp         :string[16];
          nama        :string[20];
          alamat      :string[20];
          penghasilan :integer;
          pekerjaan   :string[15];
          status      :char;
          saldo       :integer;
     end;

     pinjaman = record
         id          : integer;
         id_a        : integer;
         jumlah      : integer;
         jbulan      : integer;
         sisa        : integer;
         sbulan      : integer;
         tanggal     : string;
     end;

     simpanan = record
         id          : integer;
         id_a        : integer;
         jumlah      : integer;
         setoran     : integer;
         tanggal     : string;
     end;

     angsuran = record
         id          : integer;
         id_p        : integer;
         jumlah      : real;
         ke          : integer;
         tanggal     : string;
     end;

     dataang = array[1..maxdata] of dt_a;
     datapin = array[1..maxdata] of pinjaman;
     datasim = array[1..maxdata] of simpanan;
     dataags = array[1..maxdata] of angsuran;

var
     dataa      : dataang;
     datap      : datapin;
     datas      : datasim;
     datag      : dataags;
     banyakang  : integer;
     banyakpin  : integer;
     banyaksim  : integer;
     banyakags  : integer;
     a          : file of dt_a;
     b          : file of pinjaman;
     c          : file of simpanan;
     d          : file of angsuran;
     bs         : boolean;

procedure database1;
{I.S. : }
{F.S. : }
begin
     assign(a,'ang.dat');
     {I-};
     reset(a);
     {I+};
end;

procedure database2;
{I.S. : }
{F.S. : }
begin
     assign(b,'pin.dat');
     {I-};
     reset(b);
     {I+};
end;

procedure database3;
{I.S. : }
{F.S. : }
begin
     assign(c,'sim.dat');
     {I-};
     reset(c);
     {I+};
end;

procedure database4;
{I.S. : }
{F.S. : }
begin
     assign(d,'ags.dat');
     {I-};
     reset(d);
     {I+};
end;

procedure login(var bs : boolean);
{I.S. : }
{F.S. : }
var
     gagal     : integer;
     c         : char;
     user,pass : string;
begin
     gagal := 0;
     repeat
           clrscr;
           bs := false;
           gotoxy(30,10);write('  ---===LOGIN===---');
           gotoxy(30,11);write('=-=-=-=-=-=-=-=-=-=-=');
           gotoxy(30,12);write(' Username : ');
           gotoxy(30,13);write(' Password : ');
           gotoxy(30,14);write('=-=-=-=-=-=-=-=-=-=-=');
           gotoxy(42,12);readln(user);
           gotoxy(42,13);
           pass := '';
           //password bintang
           repeat
                 c := Readkey;
                 if(c = #0)
                 then
                 begin
                      Readkey
                 end
                 else
                 if(c = #8)
                 then
                 begin
                      pass:=copy(pass,1,length(pass)-1);
                      gotoxy(whereX-1,whereY);
                      clreol;
                 end
                 else
                 if(c <> #13)
                 then
                 begin
                      pass := pass+c;
                      write('*');
                 end;
           until(c = #13);
           if(user <> username) or (pass <> password)
           then
           begin
                clrscr;
                gagal := gagal+1;
                if(gagal > 2)
                then
                begin
                     clrscr;
                     gotoxy(15,10);write('=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=');
                     gotoxy(15,11);write('   Maaf anda sudah gagal login sebanyak 3 kali  ' );
                     gotoxy(15,12);write('       Untuk keluar program, tekan ENTER!        ');
                     gotoxy(15,13);write('=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=');
                     readln;
                     exit;
                end;
                gotoxy(15,10);write('=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=');
                gotoxy(15,11);write(' Username atau password yang anda masukkan salah ');
                gotoxy(15,12);write('    Untuk mencoba kembali, tekan ENTER!          ');
                gotoxy(15,13);write('=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=');
                readln;
           end;
           if(user = username) and (pass = password)
           then
           begin
                bs := true;
           end;
     until(bs);
end;

procedure simpan_data_anggota;
var
   i:integer;
begin
     database1;
     rewrite(a);
     for i:=1 to banyakang do
         write(a,dataa[i]);
     close(a);
     readln;
end;

procedure simpan_data_pinjaman;
var
   i : integer;
begin
     database2;
     rewrite(b);
     for i:=1 to banyakpin do
         write(b,datap[i]);
     close(b);
     readln;
end;
procedure simpan_data_simpanan;
var
   i : integer;
begin
     database3;
     rewrite(c);
     for i:=1 to banyaksim do
         write(c,datas[i]);
     close(c);
     readln;
end;
procedure simpan_data_angsuran;
var
   i : integer;
begin
     database4;
     rewrite(d);
     for i:=1 to banyakags do
         write(d,datag[i]);
     close(d);
     readln;
end;

procedure baca_data_anggota;
var
   databaru:dt_a;
begin
     database1;
     if ioresult=0 then
     begin
          banyakang:=0;
          while eof(a)=false do
          begin
               read(a,databaru);
               if banyakang<maxdata then
               begin
                    banyakang:=banyakang+1;
                    dataa[banyakang]:=databaru;
               end;
          end;
          close(a);
     end
     else
     begin
          writeln('File Anggota tidak ditemukan!');
          readln;
     end;
end;

procedure baca_data_pinjaman;
var
   databaru:pinjaman;
begin
     database2;
     if ioresult=0 then
     begin
          banyakpin:=0;
          while eof(b)=false do
          begin
               read(b,databaru);
               if banyakpin<maxdata then
               begin
                    banyakpin:=banyakpin+1;
                    datap[banyakpin]:=databaru;
               end;
          end;
          close(b);
     end
     else
     begin
          writeln('File Pinjaman tidak ditemukan!');
          readln;
     end;
end;

procedure baca_data_simpanan;
var
   databaru:simpanan;
begin
     database3;
     if ioresult=0 then
     begin
          banyaksim:=0;
          while eof(c)=false do
          begin
               read(c,databaru);
               if banyaksim<maxdata then
               begin
                    banyaksim:=banyaksim+1;
                    datas[banyaksim]:=databaru;
               end;
          end;
          close(c);
     end
     else
     begin
          writeln('File Simpanan tidak ditemukan!');
          readln;
     end;
end;

procedure baca_data_angsuran;
var
   databaru:angsuran;
begin
     database4;
     if ioresult=0 then
     begin
          banyakags:=0;
          while eof(d)=false do
          begin
               read(d,databaru);
               if banyakags<maxdata then
               begin
                    banyakags:=banyakags+1;
                    datag[banyakags]:=databaru;
               end;
          end;
          close(d);
     end
     else
     begin
          writeln('File Angsuran tidak ditemukan!');
     end;
end;

procedure data_tabel_pinjaman(i:integer);
{I.S. : }
{F.S. : }
begin
      clrscr;
      gotoxy(1,1);
      write('=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=');
      gotoxy(1,2);
      write('|  ID  | ID Anggota |      Jumlah     | Jumlah Bulan |      Sisa       | Sisa Bulan |   Tanggal   |');
      gotoxy(1,3);
      write('=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=');
      gotoxy(1,4);write('|');
      gotoxy(3,4);write(datap[i].id);
      gotoxy(8,4);write('|');
      gotoxy(13,4);write(datap[i].id_a);
      gotoxy(21,4);write('|');
      gotoxy(23,4);write('Rp. ',datap[i].jumlah);
      gotoxy(39,4);write('|');
      gotoxy(47,4);write(datap[i].jbulan);
      gotoxy(54,4);write('|');
      gotoxy(56,4);write('Rp. ',datap[i].sisa);
      gotoxy(72,4);write('|');
      gotoxy(80,4);write(datap[i].sbulan);
      gotoxy(85,4);write('|');
      gotoxy(87,4);write(datap[i].tanggal);
      gotoxy(99,4);write('|');
      gotoxy(1,5);
      write('=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=');
end;

procedure lihat_data_pinjaman;
var
   i:integer;
begin
     clrscr;
     if(banyakpin>0)
     then
     begin
          gotoxy(1,1);
          write('=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=');
          gotoxy(1,2);
          write('|  ID  | ID Anggota |      Jumlah     | Jumlah Bulan |      Sisa       | Sisa Bulan |   Tanggal   |');
          gotoxy(1,3);
          write('=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=');
          for i := 1 to banyakpin do
          begin
               gotoxy(1,i+3);write('|');
               gotoxy(3,i+3);write(datap[i].id);
               gotoxy(8,i+3);write('|');
               gotoxy(13,i+3);write(datap[i].id_a);
               gotoxy(21,i+3);write('|');
               gotoxy(23,i+3);write('Rp. ',datap[i].jumlah);
               gotoxy(39,i+3);write('|');
               gotoxy(47,i+3);write(datap[i].jbulan);
               gotoxy(54,i+3);write('|');
               gotoxy(56,i+3);write('Rp. ',datap[i].sisa);
               gotoxy(72,i+3);write('|');
               gotoxy(80,i+3);write(datap[i].sbulan);
               gotoxy(85,i+3);write('|');
               gotoxy(87,i+3);write(datap[i].tanggal);
               gotoxy(99,i+3);write('|');
          end;
          gotoxy(1,i+4);
          write('=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=');
          gotoxy(28,i+6);writeln('Terdapat ',banyakpin,' data tersimpan!');
          gotoxy(28,i+7);write('Tekan enter untuk kembali ke menu sebelumnya!');
          readln;
     end
     else
     begin
         writeln('Data belum ada');
         readln;
     end; //endif
end;

procedure data_tabel_simpanan(i:integer);
{I.S. : }
{F.S. : }
begin
      clrscr;
      gotoxy(1,1);
      write('=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=');
      gotoxy(1,2);
      write('|  ID  | ID Anggota |      Jumlah     |      Setoran      |   Tanggal   |');
      gotoxy(1,3);
      write('=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=');
      gotoxy(1,4);write('|');
      gotoxy(3,4);write(datas[i].id);
      gotoxy(8,4);write('|');
      gotoxy(13,4);write(datas[i].id_a);
      gotoxy(21,4);write('|');
      gotoxy(23,4);write('Rp. ',datas[i].jumlah);
      gotoxy(39,4);write('|');
      gotoxy(41,4);write('Rp. ',datas[i].setoran);
      gotoxy(59,4);write('|');
      gotoxy(61,4);write(datas[i].tanggal);
      gotoxy(73,4);write('|');
      gotoxy(1,5);
      write('=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=');
end;

procedure lihat_data_simpanan;
var
   i:integer;
begin
     clrscr;
     if(banyaksim>0)
     then
     begin
          gotoxy(1,1);
          write('=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=');
          gotoxy(1,2);
          write('|  ID  | ID Anggota |      Jumlah     |      Setoran      |   Tanggal   |');
          gotoxy(1,3);
          write('=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=');
          for i := 1 to banyaksim do
          begin
               gotoxy(1,i+3);write('|');
               gotoxy(3,i+3);write(datas[i].id);
               gotoxy(8,i+3);write('|');
               gotoxy(13,i+3);write(datas[i].id_a);
               gotoxy(21,i+3);write('|');
               gotoxy(23,i+3);write('Rp. ',datas[i].jumlah);
               gotoxy(39,i+3);write('|');
               gotoxy(41,i+3);write('Rp. ',datas[i].setoran);
               gotoxy(59,i+3);write('|');
               gotoxy(61,i+3);write(datas[i].tanggal);
               gotoxy(73,i+3);write('|');
          end;
          gotoxy(1,i+4);
          write('=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=');
          gotoxy(28,i+6);writeln('Terdapat ',banyaksim,' data tersimpan!');
          gotoxy(28,i+7);write('Tekan enter untuk kembali ke menu sebelumnya!');
          readln;
     end
     else
     begin
         writeln('Data belum ada');
         readln;
     end; //endif
end;

procedure data_tabel_angsuran(i:integer);
{I.S. : }
{F.S. : }
begin
      clrscr;
      gotoxy(1,1);
      write('=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=');
      gotoxy(1,2);
      write('|  ID  | ID Pinjaman |      Jumlah     | Ke |');
      gotoxy(1,3);
      write('=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=');
      gotoxy(1,4);write('|');
      gotoxy(3,4);write(datag[i].id);
      gotoxy(8,4);write('|');
      gotoxy(13,4);write(datag[i].id_p);
      gotoxy(22,4);write('|');
      gotoxy(24,4);write('Rp. ',datag[i].jumlah);
      gotoxy(40,4);write('|');
      gotoxy(42,4);write(datag[i].ke);
      gotoxy(45,4);write('|');
      gotoxy(1,5);
      write('=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=');
end;

procedure lihat_data_angsuran;
var
   i:integer;
begin
     clrscr;
     if(banyakang>0)
     then
     begin
          gotoxy(1,1);
          write('=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=');
          gotoxy(1,2);
          write('|  ID  | ID Pinjaman |      Jumlah     | Ke |');
          gotoxy(1,3);
          write('=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=');
          for i := 1 to banyakang do
          begin
               gotoxy(1,i+3);write('|');
               gotoxy(3,i+3);write(datag[i].id);
               gotoxy(8,i+3);write('|');
               gotoxy(13,i+3);write(datag[i].id_p);
               gotoxy(22,i+3);write('|');
               gotoxy(24,i+3);write('Rp. ',datag[i].jumlah);
               gotoxy(40,i+3);write('|');
               gotoxy(42,i+3);write(datag[i].ke);
               gotoxy(45,i+3);write('|');
          end;
          gotoxy(1,i+4);
          write('=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=');
          gotoxy(28,i+6);writeln('Terdapat ',banyakang,' data tersimpan!');
          gotoxy(28,i+7);write('Tekan enter untuk kembali ke menu sebelumnya!');
          readln;
     end
     else
     begin
         writeln('Data belum ada');
         readln;
     end; //endif
end;

procedure data_tabel_anggota(i:integer);
{I.S. : }
{F.S. : }
begin
      clrscr;
      gotoxy(1,1);
      write('=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=');
      gotoxy(1,2);
      write('|  ID  |       Nama       |         Alamat         |   Penghasilan   | Pekerjaan | Status |      Saldo      |');
      gotoxy(1,3);
      write('=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=');
      gotoxy(1,4);write('|');
      gotoxy(3,4);write(dataa[i].id);
      gotoxy(8,4);write('|');
      gotoxy(10,4);write(dataa[i].nama);
      gotoxy(27,4);write('|');
      gotoxy(29,4);write(dataa[i].alamat);
      gotoxy(52,4);write('|');
      gotoxy(54,4);write('Rp. ',dataa[i].penghasilan);
      gotoxy(70,4);write('|');
      gotoxy(72,4);write(dataa[i].pekerjaan);
      gotoxy(82,4);write('|');
      gotoxy(84,4);write(dataa[i].status);
      gotoxy(91,4);write('|');
      gotoxy(93,4);write('Rp. ',dataa[i].saldo);
      gotoxy(109,4);write('|');
      gotoxy(1,5);
      write('=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=');
end;

procedure lihat_data_anggota;
var
   i:integer;
begin
     clrscr;
     if(banyakang>0)
     then
     begin
          gotoxy(1,1);
          write('=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=');
          gotoxy(1,2);
          write('|  ID  |       Nama       |         Alamat         |   Penghasilan   | Pekerjaan | Status |      Saldo      |');
          gotoxy(1,3);
          write('=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=');
          for i := 1 to banyakang do
          begin
               gotoxy(1,i+3);write('|');
               gotoxy(3,i+3);write(dataa[i].id);
               gotoxy(8,i+3);write('|');
               gotoxy(10,i+3);write(dataa[i].nama);
               gotoxy(27,i+3);write('|');
               gotoxy(29,i+3);write(dataa[i].alamat);
               gotoxy(52,i+3);write('|');
               gotoxy(54,i+3);write('Rp. ',dataa[i].penghasilan);
               gotoxy(70,i+3);write('|');
               gotoxy(72,i+3);write(dataa[i].pekerjaan);
               gotoxy(82,i+3);write('|');
               gotoxy(84,i+3);write(dataa[i].status);
               gotoxy(91,i+3);write('|');
               gotoxy(93,i+3);write('Rp. ',dataa[i].saldo);
               gotoxy(109,i+3);write('|');
          end;
          gotoxy(1,i+4);
          write('=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=');
          gotoxy(28,i+6);writeln('Terdapat ',banyakang,' data tersimpan!');
          gotoxy(28,i+7);write('Tekan enter untuk kembali ke menu sebelumnya!');
          readln;
     end
     else
     begin
         writeln('Data belum ada');
         readln;
     end; //endif
end;

//cari data

procedure pencarian_data_anggota;
{I.S. : }
{F.S. : }
var
   n,code,i,No,j,dicari:integer;
   dicarin,pil:string;
begin
     clrscr;
     if banyakang>0 then
     begin
          gotoxy(23,1);writeln('Cari Data Anggota');
          gotoxy(23,2);writeln('1. Cari Data Berdasarkan ID Anggota');
          gotoxy(23,3);writeln('2. Cari Data Berdasarkan Nama Anggota');
          gotoxy(23,4);writeln('0. Kembali');
          repeat
               gotoxy(23,6);write('Pilih : ');
               readln(pil);
               val(pil,n,code);
               if(code<>0)then
               begin
               gotoxy(7,8);writeln('Masukan angka !');
               end;
          until(code=0);
          if(n = 1)
          then
          begin
               gotoxy(23,10);write('ID Anggota Yang Dicari : ');
               readln(dicari);
               i:=1;
               while(dataa[i].id<>dicari)and(i<banyakang) do
                    i:=i+1;
                    if dataa[i].id=dicari then
                    begin
                    gotoxy(23,11);writeln('Data Anggota');
                    data_tabel_anggota(i);
             writeln('Data ditemukan diposisi ke-',i);
          end
          else
              writeln('Data tidak ditemukan');
          end
          else
          if(n=2)
          then
          begin
               gotoxy(23,10);write('Nama Anggota Yang Dicari : ');readln(dicarin);
               i:=1;
               while(dataa[i].nama<>dicarin)and(i<banyakang) do
                    i:=i+1;
                    if(dataa[i].nama=dicarin)
                    then
                    begin
                    gotoxy(23,11);writeln('Data Anggota dt_a');
                    clrscr;
                    gotoxy(1,1);
                    write('=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=');
                    gotoxy(1,2);
                    write('|  ID  |       Nama       |         Alamat         |   Penghasilan   | Pekerjaan | Status |      Saldo      |');
                    gotoxy(1,3);
                    write('=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=');
                    No := 0;
                    for j := 1 to banyakang do
                    begin
                      if(dataa[j].nama = dicarin)
                      then
                      begin
                        No := No + 1;
                        gotoxy(1,No+3);write('|');
                        gotoxy(3,No+3);write(dataa[i].id);
                        gotoxy(8,No+3);write('|');
                        gotoxy(10,No+3);write(dataa[i].nama);
                        gotoxy(27,No+3);write('|');
                        gotoxy(29,No+3);write(dataa[i].alamat);
                        gotoxy(52,No+3);write('|');
                        gotoxy(54,No+3);write('Rp. ',dataa[i].penghasilan);
                        gotoxy(70,No+3);write('|');
                        gotoxy(72,No+3);write(dataa[i].pekerjaan);
                        gotoxy(82,No+3);write('|');
                        gotoxy(84,No+3);write(dataa[i].status);
                        gotoxy(91,No+3);write('|');
                        gotoxy(93,No+3);write('Rp. ',dataa[i].saldo);
                        gotoxy(109,No+3);write('|');
                      end;
                    end;
                    writeln;
                    writeln('=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=');
                    writeln;
                    writeln('Data ditemukan sebanyak ',No,' data.');
                    writeln('Tekan enter untuk kembali ke menu sebelumnya!'); readln;
          end
          else
              writeln('Data tidak ditemukan');
          end; //endif
     end
     else
     begin
         writeln('Data kosong, anda tidak bisa melakukan pencarian');
         writeln('Tekan enter untuk melanjutkan!');readln;
     end;
end;

procedure pencarian_data_pinjaman;
{I.S. : }
{F.S. : }
var
   n,code,i,No,j,dicari:integer;
   pil:string;
begin
     clrscr;
     if banyakpin>0 then
     begin
          gotoxy(23,1);writeln('Cari Data Pinjaman');
          gotoxy(23,2);writeln('1. Cari Data Berdasarkan ID Pinjaman');
          gotoxy(23,3);writeln('2. Cari Data Berdasarkan ID Anggota');
          gotoxy(23,4);writeln('0. Kembali');
          repeat
               gotoxy(23,4);write('Pilih : ');
               readln(pil);
               val(pil,n,code);
               if(code<>0)then
               begin
               gotoxy(7,4);writeln('Masukan angka !');
               end;
          until(code=0);
          if(n = 1)
          then
          begin
               gotoxy(23,5);write('ID Pinjaman Yang Dicari : ');
               readln(dicari);
               i:=1;
               while(datap[i].id<>dicari)and(i<banyakpin) do
                    i:=i+1;
                    if datap[i].id=dicari then
                    begin
                    gotoxy(23,6);writeln('Data Pinjaman');
                    data_tabel_pinjaman(i);
             writeln('Data ditemukan diposisi ke-',i);
          end
          else
              writeln('Data tidak ditemukan');
          end
          else
          if(n=2)
          then
          begin
               gotoxy(23,5);write('ID Anggota Yang Dicari : ');readln(dicari);
               i:=1;
               while(datap[i].id_a<>dicari)and(i<banyakpin) do
                    i:=i+1;
                    if(datap[i].id_a=dicari)
                    then
                    begin
                    gotoxy(23,6);writeln('Data Pinjaman');
                    clrscr;
                    gotoxy(1,1);
                    write('=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=');
                    gotoxy(1,2);
                    write('|  ID  | ID Anggota |      Jumlah     | Jumlah Bulan |      Sisa       | Sisa Bulan |   Tanggal   |');
                    gotoxy(1,3);
                    write('=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=');
                    No := 0;
                    for j := 1 to banyakpin do
                    begin
                      if(datap[j].id_a = dicari)
                      then
                      begin
                        No := No + 1;
                        gotoxy(1,No+3);write('|');
                        gotoxy(3,No+3);write(datap[i].id);
                        gotoxy(8,No+3);write('|');
                        gotoxy(13,No+3);write(datap[i].id_a);
                        gotoxy(21,No+3);write('|');
                        gotoxy(23,No+3);write('Rp. ',datap[i].jumlah);
                        gotoxy(39,No+3);write('|');
                        gotoxy(47,No+3);write(datap[i].jbulan);
                        gotoxy(54,No+3);write('|');
                        gotoxy(56,No+3);write('Rp. ',datap[i].sisa);
                        gotoxy(72,No+3);write('|');
                        gotoxy(80,No+3);write(datap[i].sbulan);
                        gotoxy(85,No+3);write('|');
                        gotoxy(87,No+3);write(datap[i].tanggal);
                        gotoxy(99,No+3);write('|');
                      end;
                    end;
                    writeln;
                    write('=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=');
                    writeln;
                    writeln('Data ditemukan sebanyak ',No,' data.');
                    writeln('Tekan enter untuk kembali ke menu sebelumnya!'); readln;
          end
          else
              writeln('Data tidak ditemukan');
          end; //endif
     end
     else
     begin
         writeln('Data kosong, anda tidak bisa melakukan pencarian');
         writeln('Tekan enter untuk melanjutkan!');readln;
     end;
end;

procedure pencarian_data_simpanan;
{I.S. : }
{F.S. : }
var
   n,code,i,No,j,dicari:integer;
   pil:string;
begin
     clrscr;
     if banyaksim>0 then
     begin
          gotoxy(23,1);writeln('Cari Data Simpanan');
          gotoxy(23,2);writeln('1. Cari Data Berdasarkan ID Simpanan');
          gotoxy(23,3);writeln('2. Cari Data Berdasarkan ID Anggota');
          gotoxy(23,4);writeln('0. Kembali');
          repeat
               gotoxy(23,4);write('Pilih : ');
               readln(pil);
               val(pil,n,code);
               if(code<>0)then
               begin
               gotoxy(7,4);writeln('Masukan angka !');
               end;
          until(code=0);
          if(n = 1)
          then
          begin
               gotoxy(23,5);write('ID Simpanan Yang Dicari : ');
               readln(dicari);
               i:=1;
               while(datas[i].id<>dicari)and(i<banyaksim) do
                    i:=i+1;
                    if datas[i].id=dicari then
                    begin
                    gotoxy(23,6);writeln('Data Simpanan');
                    data_tabel_simpanan(i);
             writeln('Data ditemukan diposisi ke-',i);
          end
          else
              writeln('Data tidak ditemukan');
          end
          else
          if(n=2)
          then
          begin
               gotoxy(23,5);write('ID Anggota Yang Dicari : ');readln(dicari);
               i:=1;
               while(datas[i].id_a<>dicari)and(i<banyaksim) do
                    i:=i+1;
                    if(datas[i].id_a=dicari)
                    then
                    begin
                    gotoxy(23,6);writeln('Data Simpanan');
                    clrscr;
                    gotoxy(1,1);
                    write('=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=');
                    gotoxy(1,2);
                    write('|  ID  | ID Anggota |      Jumlah     |      Setoran      |   Tanggal   |');
                    gotoxy(1,3);
                    write('=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=');
                    No := 0;
                    for j := 1 to banyaksim do
                    begin
                      if(datas[j].id_a = dicari)
                      then
                      begin
                        No := No + 1;
                        gotoxy(1,No+3);write('|');
                        gotoxy(3,No+3);write(datas[i].id);
                        gotoxy(8,No+3);write('|');
                        gotoxy(13,No+3);write(datas[i].id_a);
                        gotoxy(21,No+3);write('|');
                        gotoxy(23,No+3);write('Rp. ',datas[i].jumlah);
                        gotoxy(39,No+3);write('|');
                        gotoxy(41,No+3);write('Rp. ',datas[i].setoran);
                        gotoxy(59,No+3);write('|');
                        gotoxy(61,No+3);write(datas[i].tanggal);
                        gotoxy(73,No+3);write('|');
                      end;
                    end;
                    writeln;
                    write('=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=');
                    writeln;
                    writeln('Data ditemukan sebanyak ',No,' data.');
                    writeln('Tekan enter untuk kembali ke menu sebelumnya!'); readln;
          end
          else
              writeln('Data tidak ditemukan');
          end; //endif
     end
     else
     begin
         writeln('Data kosong, anda tidak bisa melakukan pencarian');
         writeln('Tekan enter untuk melanjutkan!');readln;
     end;
end;

procedure pencarian_data_angsuran;
{I.S. : }
{F.S. : }
var
   n,code,i,No,j,dicari:integer;
   pil:string;
begin
     clrscr;
     if banyakags>0 then
     begin
          gotoxy(23,1);writeln('Cari Data Angsuran');
          gotoxy(23,2);writeln('1. Cari Data Berdasarkan ID Angsuran');
          gotoxy(23,3);writeln('2. Cari Data Berdasarkan ID Pinjaman');
          gotoxy(23,4);writeln('0. Kembali');
          repeat
               gotoxy(23,4);write('Pilih : ');
               readln(pil);
               val(pil,n,code);
               if(code<>0)then
               begin
               gotoxy(7,4);writeln('Masukan angka !');
               end;
          until(code=0);
          if(n = 1)
          then
          begin
               gotoxy(23,5);write('ID Angsuran Yang Dicari : ');
               readln(dicari);
               i:=1;
               while(datag[i].id<>dicari)and(i<banyakags) do
                    i:=i+1;
                    if datag[i].id=dicari then
                    begin
                    gotoxy(23,6);writeln('Data Angsuran');
                    data_tabel_angsuran(i);
             writeln('Data ditemukan diposisi ke-',i);
          end
          else
              writeln('Data tidak ditemukan');
          end
          else
          if(n=2)
          then
          begin
               gotoxy(23,5);write('ID Pinjaman Yang Dicari : ');readln(dicari);
               i:=1;
               while(datag[i].id_p<>dicari)and(i<banyakags) do
                    i:=i+1;
                    if(datag[i].id_p=dicari)
                    then
                    begin
                    gotoxy(23,6);writeln('Data Angsuran');
                    clrscr;
                    gotoxy(1,1);
                    write('=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=');
                    gotoxy(1,2);
                    write('|  ID  | ID Pinjaman |      Jumlah     | Ke |');
                    gotoxy(1,3);
                    write('=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=');
                    No := 0;
                    for j := 1 to banyaksim do
                    begin
                      if(datag[j].id_p = dicari)
                      then
                      begin
                        No := No + 1;
                        gotoxy(1,No+3);write('|');
                        gotoxy(3,No+3);write(datag[i].id);
                        gotoxy(8,No+3);write('|');
                        gotoxy(13,No+3);write(datag[i].id_p);
                        gotoxy(22,No+3);write('|');
                        gotoxy(24,No+3);write('Rp. ',datag[i].jumlah);
                        gotoxy(40,No+3);write('|');
                        gotoxy(42,No+3);write(datag[i].ke);
                        gotoxy(45,No+3);write('|');
                      end;
                    end;
                    writeln;
                    write('=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=');
                    writeln;
                    writeln('Data ditemukan sebanyak ',No,' data.');
                    writeln('Tekan enter untuk kembali ke menu sebelumnya!'); readln;
          end
          else
              writeln('Data tidak ditemukan');
          end; //endif
     end
     else
     begin
         writeln('Data kosong, anda tidak bisa melakukan pencarian');
         writeln('Tekan enter untuk melanjutkan!');readln;
     end;
end;

//isi data

procedure tambah_data_anggota;
var
   i,a,dicari:integer;
begin
     clrscr;
     gotoxy(23,1);write  ('      ---TAMBAH DATA BARU---     ');
     gotoxy(23,2);writeln('=================================');
     gotoxy(23,3);write('ID ANGGOTA          : ');readln(dicari);
     i:=1;
     while(dataa[i].id<>dicari)and(i<banyakang) do
     i:=i+1;
     if dataa[i].id=dicari then
     begin
          writeln('ID Anggota Sudah Terdaftar');
          readln;
          tambah_data_anggota;
     end
     else
     begin
          banyakang:=banyakang+1;
          dataa[banyakang].id:=dicari;
          gotoxy(23,4);write('NAMA ANGGOTA        : ');readln(dataa[banyakang].nama);
          gotoxy(23,5);write('NO KTP ANGGOTA      : ');readln(dataa[banyakang].ktp);
          gotoxy(23,6);write('ALAMAT ANGGOTA      : ');readln(dataa[banyakang].alamat);
          gotoxy(23,7);write('PENGHASILAN         : ');readln(dataa[banyakang].penghasilan);
          gotoxy(23,8);write('PEKERJAAN           : ');readln(dataa[banyakang].pekerjaan);
          gotoxy(23,9);write('STATUS              : ');readln(dataa[banyakang].status);
          gotoxy(23,10);write('PEMBAYARAN POKOK    : Rp. 25000');
          gotoxy(23,11);write('MENABUNG            : Rp. ');readln(a);
          gotoxy(23,12);write('=================================');
          dataa[banyakang].saldo := 20000+a;
     end;
     readln;
end;

procedure tambah_data_pinjaman;
var
   i,a,b,dicari:integer;
begin
     clrscr;
     gotoxy(23,1);write  ('      ---PINJAMAN BARU---     ');
     gotoxy(23,2);writeln('=================================');
     gotoxy(23,3);  write(' ID ANGGOTA          : ');readln(dicari);
     i:=1;
     while(dataa[i].id<>dicari)and(i<banyakang) do
     i:=i+1;
     if(dataa[i].id=dicari)
     then
     begin
          clrscr;
          writeln('Data Anggota Ditemukan');
          data_tabel_anggota(i);
          gotoxy(23,12);write('Besar Pinjaman      : Rp. ');readln(a);
          b := 4 * dataa[i].saldo;
          while(a > b)do
          begin
               gotoxy(23,11);write('Besar Pinjaman Maksimal 4 x Jumlah Saldo!');
               gotoxy(23,12);write('Besar Pinjaman      : Rp. ');readln(a);
          end;
          banyakpin := banyakpin+1;
          gotoxy(23,13);write('Lama Pinjaman       :    Bulan (Kelipatan 10, Maks 30).');
          gotoxy(45,13);readln(datap[banyakpin].jbulan);
          gotoxy(23,14);write('Tanggal Setor       :                   (dd/mm/yyyy)');
          gotoxy(46,14);readln(datap[banyakpin].tanggal);
          datap[banyakpin].id := banyakpin;
          datap[banyakpin].jumlah := a;
          datap[banyakpin].id_a := dicari;
          datap[banyakpin].sisa := a;
          datap[banyakpin].sbulan := datap[banyakpin].jbulan;
     end
     else
     begin
          writeln('Data Anggota Tidak Ditemukan!');
          readln;
          tambah_data_pinjaman;
     end;
end;

procedure menabung;
var
   i,dicari:integer;
begin
     clrscr;
     gotoxy(23,1);write  ('         ---SIMPANAN---     ');
     gotoxy(23,2);writeln('=================================');
     gotoxy(23,3);  write(' ID ANGGOTA          : ');readln(dicari);
     i:=1;
     while(dataa[i].id<>dicari)and(i<banyakang) do
     i:=i+1;
     if(dataa[i].id=dicari)
     then
     begin
          clrscr;
          writeln('Data Anggota Ditemukan');
          data_tabel_anggota(i);
          banyaksim := banyaksim+1;
          datas[banyaksim].id := banyaksim;
          gotoxy(23,10);write(' Jumlah Saldo        : Rp. ',dataa[i].saldo);
          gotoxy(23,11);write(' Jumlah Setoran      : Rp. ');readln(datas[banyaksim].setoran);
          datas[banyaksim].jumlah := dataa[i].saldo + datas[banyaksim].setoran;
          datas[banyaksim].id_a := dicari;
          gotoxy(23,12);write(' Tanggal Setor       :                   (dd/mm/yyyy)');
          gotoxy(46,12);readln(datas[banyaksim].tanggal);
     end
     else
     begin
          writeln('Data Anggota Tidak Ditemukan!');
          menabung;
     end;
end;

procedure mengangsur;
var
   i,dicari:integer;
begin
     clrscr;
     gotoxy(23,1);write  ('         ---ANGSURAN---     ');
     gotoxy(23,2);writeln('=================================');
     gotoxy(23,3);  write(' ID PINJAMAN         : ');readln(dicari);
     i:=1;
     while(datap[i].id<>dicari)and(i<banyakpin) do
     i:=i+1;
     if(datap[i].id=dicari)
     then
     begin
          clrscr;
          writeln('Data Pinjaman Ditemukan');
          data_tabel_pinjaman(i);
          banyakags := banyakags+1;
          datag[banyakags].jumlah := 1.2 * datap[i].jumlah / datap[i].jbulan;
          gotoxy(23,5);write(' Jumlah Angsuran     : Rp. ',datag[banyakags].jumlah);
          datag[banyakags].id_p := dicari;
          datag[banyakags].ke := datap[i].jbulan-datap[i].sbulan+1;
          gotoxy(23,6);write(' Tanggal Mengangsur  : ');readln(datag[banyakags].tanggal);
          write(' (dd/mm/yyyy).');
     end
     else
     begin
          writeln('Data Anggota Tidak Ditemukan!');
          menabung;
     end;
end;

//hapus data anggota

procedure hapus_data;
var
   j,i,idhapus:integer;
   jawaban:char;
begin
     clrscr;
     if(banyakang>0)
     then
     begin
          gotoxy(23,1);write('ID Anggota yang akan dihapus : ');
          readln(idhapus);
          i:=1;
          while (dataa[i].id<>idhapus)and(i<banyakang) do
          i:=i+1;
          if(dataa[i].id=idhapus)then
          begin
               gotoxy(23,2);write('Data yang akan dihapus : ');
               data_tabel_anggota(i);
               gotoxy(23,8);write('Yakin mau dihapus [Y/T] ? : ');readln(jawaban);
               if upcase(jawaban)='Y' then
               begin
                    for j:=i to banyakang-1 do
                    dataa[j]:=dataa[j+1];
                    banyakang:=banyakang-1;
               end
               else
               begin
                    gotoxy(23,9);writeln('Data tidak jadi dihapus');
               end;
           end
           else
           begin
                gotoxy(23,2);writeln('Data Tidak Ditemukan');
           end;
     end
     else
     begin
         writeln('Data tidak tersedia!');
         writeln('Tekan Enter Untuk Melanjutkan');readln;
     end;
end;

//edit data anggota

function validasi_code(kode:integer):boolean;
var
   i:integer;
begin
    validasi_code:=true;
    i:=1;
    while (dataa[i].id<>kode) and (i<banyakang) do
    i:=i+1;
    if(dataa[i].id=kode)
    then
        validasi_code:=false;
end;

procedure edit_mod_data;
var
   i,j,id,posisiedit:integer;
begin
     if(banyakang>0)
     then
     begin
          clrscr;
          gotoxy(23,1);write('ID Anggota yang akan diedit : ');
          readln(posisiedit);
          i:=1;
          while (dataa[i].id<>posisiedit)and(i<banyakang) do
          i:=i+1;
          if(dataa[i].id=posisiedit)
          then
          begin
               gotoxy(23,2);write('Data yang akan diedit : ');
               data_tabel_anggota(i);
               gotoxy(23,7);write('ID ANGGOTA          : ');readln(id);
               j:=1;
               while(dataa[j].id<>id)and(j<banyakang) do
               j:=j+1;
               if(dataa[j].id=id)
               then
               begin
                  repeat
                        writeln('ID Anggota Sudah Terdaftar');
                        gotoxy(23,7);write('ID ANGGOTA          : ');readln(id);
                  until (dataa[j].id<>id) and(validasi_code(id)=true);
                  //edit_mod_data;
               end;
               dataa[i].id:=id;
               gotoxy(23,8);write('NAMA ANGGOTA        : ');readln(dataa[i].nama);
               gotoxy(23,9);write('NO KTP ANGGOTA      : ');readln(dataa[i].ktp);
               gotoxy(23,10);write('ALAMAT ANGGOTA      : ');readln(dataa[i].alamat);
               gotoxy(23,11);write('PENGHASILAN         : ');readln(dataa[i].penghasilan);
               gotoxy(23,12);write('PEKERJAAN           : ');readln(dataa[i].pekerjaan);
               gotoxy(23,13);write('STATUS              : ');readln(dataa[i].status);
          end
          else
              writeln('ID Anggota Tidak Ditemukan');
     end
     else
         writeln('Edit tidak bisa dilakukan karena kosong');
         writeln('Tekan Enter Untuk Melanjutkan');readln;
end;

//procedure pengurut data (bubble sort - ascending)

procedure urutkan_data_anggota;
var
   n,code,i,j,imin:integer;
   pil:string;
   temp:dt_a;
begin
     gotoxy(23,13);writeln('1.Pengurutan menurut id anggota');
     gotoxy(23,14);writeln('2.Pengurutan menurut nama anggota');
     gotoxy(23,15);writeln('--------------------------------');
     repeat
           gotoxy(23,16);write('#  pilihan : ');
           readln(pil);
           val(pil,n,code);
           if(code<>0)
           then
           begin
                gotoxy(7,16);writeln('Masukan angka !');
           end;
     until(code=0);
     if(n=2)then
     begin
          writeln('Mulai Pengurutan Berdasarkan Nama Anggota..... ');
          for i:=1 to (banyakang-1) do
          begin
               imin:=i;
               for j:=i+1 to banyakang do
               begin
                    if(dataa[imin].nama>dataa[j].nama)
                    then
                    imin:=j;
               end;
               temp:=dataa[i];
               dataa[i]:=dataa[imin];
               dataa[imin]:=temp;
          end;
          writeln('Pengurutan Selesai, Teken Enter Untuk Melanjutkan');
          readln;
          lihat_data_anggota;
     end
     else
     if(n=1)
     then
     begin
          writeln('Mulai Pengurutan Berdasarkan ID Anggota..... ');
          for i:=1 to (banyakang-1) do
          begin
               imin:=i;
               for j:=i+1 to banyakang do
               begin
                    if(dataa[imin].id>dataa[j].id)
                    then
                    imin:=j;
               end;
               temp:=dataa[i];
               dataa[i]:=dataa[imin];
               dataa[imin]:=temp;
          end;
          writeln('Pengurutan Selesai, Teken Enter Untuk Melanjutkan');
          readln;
          lihat_data_anggota;
     end;
     readln;
end;

procedure urutkan_data_pinjaman;
var
   n,code,i,j,imin:integer;
   pil:string;
   temp:pinjaman;
begin
     gotoxy(23,13);writeln('1.Pengurutan menurut id pinjaman');
     gotoxy(23,14);writeln('2.Pengurutan menurut besar pinjaman');
     gotoxy(23,15);writeln('-----------------------------------');
     repeat
           gotoxy(23,16);write('#  pilihan : ');
           readln(pil);
           val(pil,n,code);
           if(code<>0)
           then
           begin
                gotoxy(7,16);writeln('Masukan angka !');
           end;
     until(code=0);
     if(n=2)then
     begin
          writeln('Mulai Pengurutan Berdasarkan besar pinjaman..... ');
          for i:=1 to (banyakpin-1) do
          begin
               imin:=i;
               for j:=i+1 to banyakpin do
               begin
                    if(datap[imin].jumlah>datap[j].jumlah)
                    then
                    imin:=j;
               end;
               temp:=datap[i];
               datap[i]:=datap[imin];
               datap[imin]:=temp;
          end;
          writeln('Pengurutan Selesai, Teken Enter Untuk Melanjutkan');
          readln;
          lihat_data_pinjaman;
     end
     else
     if(n=1)
     then
     begin
          writeln('Mulai Pengurutan Berdasarkan ID Pinjaman..... ');
          for i:=1 to (banyakpin-1) do
          begin
               imin:=i;
               for j:=i+1 to banyakpin do
               begin
                    if(datap[imin].id>datap[j].id)
                    then
                    imin:=j;
               end;
               temp:=datap[i];
               datap[i]:=datap[imin];
               datap[imin]:=temp;
          end;
          writeln('Pengurutan Selesai, Teken Enter Untuk Melanjutkan');
          readln;
          lihat_data_pinjaman;
     end;
     readln;
end;

procedure urutkan_data_simpanan;
var
   n,code,i,j,imin:integer;
   pil:string;
   temp:simpanan;
begin
     gotoxy(23,13);writeln('1.Pengurutan menurut id simpanan');
     gotoxy(23,14);writeln('2.Pengurutan menurut besar simpanan');
     gotoxy(23,15);writeln('-----------------------------------');
     repeat
           gotoxy(23,16);write('#  pilihan : ');
           readln(pil);
           val(pil,n,code);
           if(code<>0)
           then
           begin
                gotoxy(7,16);writeln('Masukan angka !');
           end;
     until(code=0);
     if(n=2)then
     begin
          writeln('Mulai Pengurutan Berdasarkan besar simpanan..... ');
          for i:=1 to (banyaksim-1) do
          begin
               imin:=i;
               for j:=i+1 to banyaksim do
               begin
                    if(datas[imin].jumlah>datas[j].jumlah)
                    then
                    imin:=j;
               end;
               temp:=datas[i];
               datas[i]:=datas[imin];
               datas[imin]:=temp;
          end;
          writeln('Pengurutan Selesai, Teken Enter Untuk Melanjutkan');
          readln;
          lihat_data_simpanan;
     end
     else
     if(n=1)
     then
     begin
          writeln('Mulai Pengurutan Berdasarkan ID Simpanan..... ');
          for i:=1 to (banyaksim-1) do
          begin
               imin:=i;
               for j:=i+1 to banyaksim do
               begin
                    if(datas[imin].id>datas[j].id)
                    then
                    imin:=j;
               end;
               temp:=datas[i];
               datas[i]:=datas[imin];
               datas[imin]:=temp;
          end;
          writeln('Pengurutan Selesai, Teken Enter Untuk Melanjutkan');
          readln;
          lihat_data_simpanan;
     end;
     readln;
end;

procedure urutkan_data_angsuran;
var
   n,code,i,j,imin:integer;
   pil:string;
   temp:angsuran;
begin
     gotoxy(23,13);writeln('1.Pengurutan menurut id angsuran');
     gotoxy(23,14);writeln('2.Pengurutan menurut besar angsuran');
     gotoxy(23,15);writeln('-----------------------------------');
     repeat
           gotoxy(23,16);write('#  pilihan : ');
           readln(pil);
           val(pil,n,code);
           if(code<>0)
           then
           begin
                gotoxy(7,16);writeln('Masukan angka !');
           end;
     until(code=0);
     if(n=2)then
     begin
          writeln('Mulai Pengurutan Berdasarkan besar angsuran..... ');
          for i:=1 to (banyakags-1) do
          begin
               imin:=i;
               for j:=i+1 to banyakags do
               begin
                    if(datag[imin].jumlah>datag[j].jumlah)
                    then
                    imin:=j;
               end;
               temp:=datag[i];
               datag[i]:=datag[imin];
               datag[imin]:=temp;
          end;
          writeln('Pengurutan Selesai, Teken Enter Untuk Melanjutkan');
          readln;
          lihat_data_angsuran;
     end
     else
     if(n=1)
     then
     begin
          writeln('Mulai Pengurutan Berdasarkan ID Angsuran..... ');
          for i:=1 to (banyakags-1) do
          begin
               imin:=i;
               for j:=i+1 to banyakags do
               begin
                    if(datag[imin].id>datag[j].id)
                    then
                    imin:=j;
               end;
               temp:=datag[i];
               datag[i]:=datag[imin];
               datag[imin]:=temp;
          end;
          writeln('Pengurutan Selesai, Teken Enter Untuk Melanjutkan');
          readln;
          lihat_data_angsuran;
     end;
     readln;
end;

procedure bayarpokok;
var
     i,dicari : integer;
     jawab : char;
begin
     clrscr;
     gotoxy(25,1);write('=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=');
     gotoxy(25,2);write('P E M B A Y A R A N  P O K O K ');
     gotoxy(25,3);write('=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=');
     gotoxy(25,4);write('ID Anggota Yang Dicari : ');
     readln(dicari);
     i:=1;
     while(dataa[i].id<>dicari)and(i<banyakang) do
     i:=i+1;
     if(dataa[i].id=dicari)
     then
     begin
          gotoxy(25,5);writeln('Data Anggota');
          data_tabel_anggota(i);
          gotoxy(25,12);write('Pembayaran Pokok : Rp. 25000');
          gotoxy(25,13);write('Lanjutkan? [Y/T] : ');readln(jawab);
          if(jawab = 'Y')
          then
          begin
               dataa[i].saldo := dataa[i].saldo + 20000;
          end
          else
          begin
               bayarpokok;
          end;
     end;
     readln;
end;

procedure penarikan;
var
     i,dicari,tarik : integer;
     jawab : char;
begin
     clrscr;
     gotoxy(25,1);write('=-=-=-=-=-=-=-=-=-=-=-=-=-=-=');
     gotoxy(25,2);write('P E N A R I K A N  S A L D O ');
     gotoxy(25,3);write('=-=-=-=-=-=-=-=-=-=-=-=-=-=-=');
     gotoxy(25,4);write('ID Anggota Yang Dicari : ');
     readln(dicari);
     i:=1;
     while(dataa[i].id<>dicari)and(i<banyakang) do
     i:=i+1;
     if(dataa[i].id=dicari)
     then
     begin
          gotoxy(25,5);writeln('Data Anggota');
          data_tabel_anggota(i);
          gotoxy(25,12);write('Penarikan Saldo  : Rp. ');readln(tarik);
          gotoxy(25,13);write('Lanjutkan? [Y/T] : ');readln(jawab);
          if(jawab = 'Y')
          then
          begin
               dataa[i].saldo := dataa[i].saldo - tarik;
          end
          else
          begin
               penarikan;
          end;
     end;
     readln;
end;

//procedure submenu

procedure anggota;
{I.S. : }
{F.S. : }
var
     pilihan : integer;
begin
     repeat
           clrscr;
           gotoxy(30,1);write('    MENU ANGGOTA');
           gotoxy(30,2);write('=-=-=-=-=-=-=-=-=-=-=');
           gotoxy(30,3);write(' 1. Lihat Data');
           gotoxy(30,4);write(' 2. Anggota Baru');
           gotoxy(30,5);write(' 3. Pencarian Data');
           gotoxy(30,6);write(' 4. Penghapusan Data');
           gotoxy(30,7);write(' 5. Pengeditan Data');
           gotoxy(30,8);write(' 6. Pengurutan Data');
           gotoxy(30,9);write(' 0. Kembali');
           gotoxy(30,11);write(' Pilih Menu : ');readln(pilihan);
           case(pilihan)of
                1 : lihat_data_anggota;
                2 : tambah_data_anggota;
                3 : pencarian_data_anggota;
                4 : hapus_data;
                5 : edit_mod_data;
                6 : urutkan_data_anggota;
           end;
           simpan_data_anggota;
     until(pilihan = 0);
end;

procedure mpinjaman;
{I.S. : }
{F.S. : }
var
     pilihan : integer;
begin
     repeat
           clrscr;
           gotoxy(30,1);write('    MENU PINJAMAN');
           gotoxy(30,2);write('=-=-=-=-=-=-=-=-=-=-=');
           gotoxy(30,3);write(' 1. Lihat Data');
           gotoxy(30,4);write(' 2. Pinjaman Baru');
           gotoxy(30,5);write(' 3. Pencarian Data');
           gotoxy(30,6);write(' 4. Pengurutan Data');
           gotoxy(30,7);write(' 0. Kembali');
           gotoxy(30,9);write(' Pilih Menu : ');readln(pilihan);
           case(pilihan)of
                1 : lihat_data_pinjaman;
                2 : tambah_data_pinjaman;
                3 : pencarian_data_pinjaman;
                4 : urutkan_data_pinjaman;
           end;
           simpan_data_pinjaman;
     until(pilihan = 0);
end;

procedure msimpanan;
{I.S. : }
{F.S. : }
var
     pilihan : integer;
begin
     repeat
           clrscr;
           gotoxy(30,1);write('    MENU SIMPANAN');
           gotoxy(30,2);write('=-=-=-=-=-=-=-=-=-=-=');
           gotoxy(30,3);write(' 1. Lihat Data');
           gotoxy(30,4);write(' 2. Menabung');
           gotoxy(30,5);write(' 3. Pencarian Data');
           gotoxy(30,6);write(' 4. Pengurutan Data');
           gotoxy(30,7);write(' 0. Kembali');
           gotoxy(30,9);write(' Pilih Menu : ');readln(pilihan);
           case(pilihan)of
                1 : lihat_data_simpanan;
                2 : menabung;
                3 : pencarian_data_simpanan;
                4 : urutkan_data_simpanan;
           end;         
           simpan_data_simpanan;
     until(pilihan = 0);
end;

procedure mangsuran;
{I.S. : }
{F.S. : }
var
     pilihan : integer;
begin
     repeat
           clrscr;
           gotoxy(30,1);write('    MENU ANGSURAN');
           gotoxy(30,2);write('=-=-=-=-=-=-=-=-=-=-=');
           gotoxy(30,3);write(' 1. Lihat Data');
           gotoxy(30,4);write(' 2. Mengangsur');
           gotoxy(30,5);write(' 3. Pencarian Data');
           gotoxy(30,6);write(' 4. Pengurutan Data');
           gotoxy(30,6);write(' 0. Kembali');
           gotoxy(30,8);write(' Pilih Menu : ');readln(pilihan);
           case(pilihan)of
                1 : lihat_data_angsuran;
                2 : mengangsur;
                3 : pencarian_data_angsuran;
                4 : urutkan_data_angsuran;
           end;         
           simpan_data_angsuran;
     until(pilihan = 0);
end;

//procedure menu utama

procedure menu;
{I.S. : }
{F.S. : }
var
     pilihan : integer;
begin
     repeat
           clrscr;
           gotoxy(30,1);write('     MENU UTAMA');
           gotoxy(30,2);write('=-=-=-=-=-=-=-=-=-=-=');
           gotoxy(30,3);write(' 1. Data Anggota');
           gotoxy(30,4);write(' 2. Pinjaman');
           gotoxy(30,5);write(' 3. Simpanan');
           gotoxy(30,6);write(' 4. Angsuran');
           gotoxy(30,7);write(' 5. Pembayaran Pokok');
           gotoxy(30,8);write(' 6. Penarikan');
           gotoxy(30,9);write(' 0. Keluar');
           gotoxy(30,10);write(' Pilih Menu : ');readln(pilihan);
           case (pilihan) of
                1 : anggota;
                2 : mpinjaman;
                3 : msimpanan;
                4 : mangsuran;
                5 : bayarpokok;
                6 : penarikan;
           end;
     until(pilihan = 0);
     exit;
end;

//program utama

begin
     login(bs);
     if(bs)
     then
     begin
          clrscr;
          gotoxy(18,1);write('=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=');
          gotoxy(18,2);write('      KOPERASI SEKEPICUNG SEJA RAHARJA');
          gotoxy(18,3);write('=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=');
          gotoxy(18,4);write('Jl. Golf Raya - Kp. Sekepicung - Ds. Ciburial');
          gotoxy(18,5);write('       Kec. Cimenyan - Kab. Bandung');
          gotoxy(18,6);write('      Tlp. 0956247712864 / 082129053846');
          gotoxy(18,7);write('=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=');
          window(1,8,110,110);
          baca_data_anggota;
          baca_data_pinjaman;
          baca_data_simpanan;
          baca_data_angsuran;
          menu;
     end
     else
         exit;
end.
