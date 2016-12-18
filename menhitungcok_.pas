program Menghitung_Coklat_Gratis;
{I.S.: user memasukan jumlah bungkus coklat}
{F.S.: menampilkan jumlah coklat gratis yang didapat}
uses crt;
var {kamus global}
   Bungkus_Coklat, Menu : integer;

procedure DataMasukan(var Bungkus_Coklat : integer);
{I.S.: user memasukan jumlah bungkus coklat}
{F.S.: menghasilkan jumlah bungkus coklat}
begin
   write('Jumlah Bungkus Coklat     : ');
   readln(Bungkus_Coklat);
   {validasi bungkus coklat}
   while(Bungkus_Coklat < 3) or (Bungkus_Coklat > 100) do
   begin
      gotoxy(1,2); textcolor(red);
      write('Harus antara 3 - 100, ulangi...tekan enter!');
      readln;
      gotoxy(1,2); clreol;
      gotoxy(30,1); clreol; textcolor(15);
      readln(Bungkus_Coklat);
   end;
end;

function Hitung_Coklat(Bungkus_Coklat : integer) : integer;
{I.S.: jumlah bungkus coklat sudah terdefinisi}
{F.S.: menghasilkan jumlah coklat yang diterima}
var
   B_Gratis, Sisa, Total : integer;
begin
   total := 0;
   repeat
      B_Gratis := Bungkus_Coklat div 3;
      Sisa := Bungkus_Coklat mod 3;
      Bungkus_Coklat := B_Gratis + Sisa;
      Total := Total + B_Gratis;
   until(Bungkus_Coklat < 3);
   Hitung_Coklat := Total; //mengembalikan total ke fungsi hitung coklat;
end; //endfunction

procedure Tampil_Total(Bungkus_Coklat : integer);
{I.S.: jumlah bungkus coklat sudah terdefinisi}
{F.S.: menampilkan total coklat yang diterima}
var
   Total : integer;
begin
  Total := Hitung_Coklat(Bungkus_Coklat);
  writeln('Total coklat yang diterima : ', Total);
end; //endprocedure

{program utama}
begin
   repeat
      textbackground(blue); clrscr;
      textcolor(15);
      gotoxy(34,9); write('Menu Pilihan');
      gotoxy(34,10); write('============');
      gotoxy(22,11); write('1. Memasukan Jumlah Bungkus Coklat');
      gotoxy(22,12); write('2. Tampil Total Coklat Diterima');
      gotoxy(22,13); write('0. Keluar');
      gotoxy(22,15); write('Pilihan Anda = ');
      readln(Menu);
      {validasi menu pilihan}
      if(Menu > 3)
      then
      begin
         clrscr;
         writeln('Menu tidak tersedia, ulangi..tekan enter!');
         readln;
      end;

      case (Menu) of
         1 : begin
                clrscr;
                DataMasukan(Bungkus_Coklat);
                write('Tekan enter untuk kembali ke Menu Pilihan');
                readln;
             end;
         2 : begin
                clrscr;
                if (Bungkus_Coklat = 0)
                then
                   writeln('Pilih menu nomor 1 terlebih dahulu')
                else
                   Tampil_Total(Bungkus_Coklat);

                write('Tekan enter untuk kembali ke Menu Pilihan');
                readln;
             end;
      end; //endcase

   until(Menu = 0);
end.
