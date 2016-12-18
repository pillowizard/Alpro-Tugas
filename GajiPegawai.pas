program Gaji_Pegawai;
{I.S.: user memasukan NIP, Nama Pegawai, Golongan, Status dan Jumlah Anak}
{F.S.: menampilkan daftar gaji pegawai}

uses crt;
//kamus global
const
   MaksPeg = 10;
type
   Larik1 = array[1..MaksPeg] of string;
   Larik2 = array[1..MaksPeg] of integer;
   Larik3 = array[1..MaksPeg] of char;
   Larik4 = array[1..MaksPeg] of real;
var
   NIP, Nama       : Larik1;
   Gol, JumAnak    : Larik2;
   Status          : Larik3;
   PPN, GajiBersih : Larik4;

function GajiPokok(Gol : integer) : integer;
{I.S.: golongan sudah terdefinisi}
{F.S.: menghasilkan fungsi gaji pokok}
begin
   case (Gol) of
      1 : GajiPokok := 1250000;
      2 : GajiPokok := 1350000;
      3 : GajiPokok := 1500000;
      4 : GajiPokok := 1750000;
   end; //endcase
end; //endfunction

function Tunjangan(Gol, Gapok : integer) : real;
{I.S.: golongan dan gaji pokok (Gapok) sudah terdefinisi}
{F.S.: menghasilkan fungsi tunjangan}
begin
   case (Gol) of
      1 : Tunjangan := 0.1 * Gapok;
      2 : Tunjangan := 0.125 * Gapok;
      3 : Tunjangan := 0.15 * Gapok;
      4 : Tunjangan := 0.2 * Gapok;
   end; //endcase
end; //endfunction

function TunjanganAnak(JumAnak : integer) : integer;
{I.S.: jumlah anak (JumAnak) sudah terdefinisi}
{F.S.: menghasilkan fungsi tunjangan anak}
begin
   if (JumAnak < 3)
      then
         begin
            TunjanganAnak := JumAnak * 150000;
         end
      else
      If (JumAnak >=3)
         then
            begin
               TunjanganAnak := 450000;
            end
         else
            begin
               TunjanganAnak := 0;
            end; //endif
end; //endfucntion

function GaTotal(Gapok, Tunjang, TunjangAnak : real):real;
{I.S. : gaji pokok (Gapok), tunjangan (Tunjang) dan tunjangan anak (TunjangAnak) sudah terdefinisi}
{F.S. : menghasilkan fungsi gaji total (GaTotal)}
begin
   GaTotal := Gapok + Tunjang + TunjangAnak;
end; //endfunction

function PPNil(Gatot:real):real;
{I.S. : gaji total (GaTot) sudah terdefinisi}
{F.S. : menghasilkan fungsi PPN (PPNil)}
begin
     PPNil := 0.1 * Gatot;
end; //endfunction

function GaBersih(Gatot, PPNilai : real):real;
{I.S. : gaji total (Gatot) dan PPN (PPNilai) sudah terdefinisi}
{F.S. : menghasilkan fungsi gaji bersih (GaBersih)}
begin
     GaBersih := Gatot - PPNilai;
end;

procedure IsiDataPeg(var NIP, Nama : Larik1);
{I.S.: user mengisi NIP, Nama Pegawai, Golongan, Status dan Jumlah Anak}
{F.S.: menampilkan daftar gaji pegawai}
var //kamus lokal
   i : integer;
   GajiTotal : real;
begin
   textbackground(green); textcolor(white);
   gotoxy(1,1);
   write('--------------------------------------------------------------------------------');
   gotoxy(1,2);
   write('|                            CARA PENGISIAN TABEL                              |');
   gotoxy(1,3);
   write('--------------------------------------------------------------------------------');
   gotoxy(1,4);
   write('|                           NIP diisi dengan 7 angka.                          |');
   gotoxy(1,5);
   write('|                     Golongan diisi dengan angka 1 - 4.                       |');
   gotoxy(1,6);
   write('|        Status diisi dengan huruf M untuk menikah dan S untuk single.         |');
   gotoxy(1,7);
   write('|           Untuk berhenti mengisi data, isi "STOP" pada kolom NIP.            |');
   gotoxy(1,8);
   write('|            Maksimal pegawai yang dapat diisikan adalah 10 orang.             |');
   gotoxy(1,9);
   write('--------------------------------------------------------------------------------');
   textbackground(white); textcolor(black);
   gotoxy(1,10);
   write('--------------------------------------------------------------------------------');
   gotoxy(1,11);
   write('|                            DAFTAR GAJI PEGAWAI                               |');
   gotoxy(1,12);
   write('--------------------------------------------------------------------------------');
   gotoxy(1,13);
   write('|   NIP   | Nama Pegawai | Gol | Status | Anak |      PPN     |  Gaji Bersih   |');
   gotoxy(1,14);
   write('--------------------------------------------------------------------------------');

   //memasukan NIP pertama
   i := 1;
   textbackground(white); textcolor(black);
   gotoxy(1,i+14);
   write('|         |              |     |        |      | Rp.          | Rp.            |');
   gotoxy(3,i+14); readln(NIP[i]);

   while((NIP[i] <> 'STOP') and (NIP[i] <> 'stop') and (NIP[i] <> 'Stop')) and (i <= MaksPeg) do
   begin

      gotoxy(13,i+14); readln(Nama[i]);
      gotoxy(29,i+14); readln(Gol[i]);

      //validasi Golongan
      while(Gol[i] < 1) or (Gol[i] > 4) do
           begin
               gotoxy(1,i+14); DELLINE;
               gotoxy(1,i+14);
               write('|         |              |     |        |      | Rp.          | Rp.            |');
               gotoxy(3,i+14); write(NIP[i]);
               gotoxy(13,i+14); write(Nama[i]);
               gotoxy(17,i+16); write('Isi kembali kolom Golongan dengan angka 1 - 4!');
               gotoxy(29,i+14); readln(Gol[i]);
               gotoxy(17,i+16); DELLINE;
           end; //endwhile

      gotoxy(36,i+14); readln(Status[i]);

      //validasi Status
      while(Status[i] <> 'M') and (Status[i] <> 'S') do
           begin
               gotoxy(1,i+14); DELLINE;
               gotoxy(1,i+14);
               write('|         |              |     |        |      | Rp.          | Rp.            |');
               gotoxy(3,i+14); write(NIP[i]);
               gotoxy(13,i+14); write(Nama[i]);
               gotoxy(29,i+14); write(Gol[i]);
               gotoxy(17,i+16); write('Isi kembali kolom Status dengan huruf M / S!');
               gotoxy(36,i+14); readln(Status[i]);
               gotoxy(17,i+16); DELLINE;
           end; //endwhile
      if(Status[i] = 'S')
         then
            begin
               gotoxy(44,i+14); write('0');
            end
         else
            begin
               gotoxy(44,i+14); readln(JumAnak[i]);
            end; //endif

      //menghitung gaji total
      GajiTotal := GaTotal(GajiPokok(Gol[i]),TunjanganAnak(JumAnak[i]),Tunjangan(Gol[i],GajiPokok(Gol[i])));

      //menghitung PPN
      PPN[i] := PPNil(GajiTotal);

      //menampilkan PPN
      gotoxy(54,i+14); write(PPN[i]:0:1);

      //menghitung gaji bersih
      GajiBersih[i] := GaBersih(GajiTotal,PPN[i]);

      //menampilkan gaji bersih
      gotoxy(69,i+14); write(GajiBersih[i]:0:1);

      //memasukan NIP berikutnya
      i := i+1;
      gotoxy(1,i+14);
      write('|         |              |     |        |      | Rp.          | Rp.            |');
      gotoxy(3,i+14); readln(NIP[i]);

   end; //endwhile

   //garis penutup tabel
   gotoxy(1,i+14);
   textbackground(white); textcolor(black);
   write('--------------------------------------------------------------------------------');

end; //endprocedure

//program utama
begin
   IsiDataPeg(NIP, Nama);
   readln;
end.
