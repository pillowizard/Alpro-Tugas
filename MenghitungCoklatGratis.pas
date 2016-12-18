program Menghitung_Coklat_Gratis;
{I.S.: pengguna memasukan jumlah coklat}
{F.S.: menampilkan coklat gratis yang didapat}

uses crt;
var
  bungkus_coklat, total : integer;

procedure BungkusCoklat(var bungkus_coklat : integer);
{I.S.: hrga coklat sudah terdefinisi untuk divalidasi}
{F.S.: menghasilkan harga bungkus coklat yang sudah divalidasi}
  begin
    while (bungkus_coklat < 3) or (bungkus_coklat > 100) do
   begin
    clrscr;
    writeln('Minimal coklat 3 bungkus dan maksimal 100 bungkus, Ulangi!');
    writeln('Masukkan Coklat yang kamu punya : '); readln(bungkus_coklat);
   end;
  end;

function Hitung_Coklat(total : integer) : integer;
{I.S.: menghitung harga bungkus coklat}
{F.S.: menghasilkan total coklat gratis yang didapat}
  var
   b_gratis, sisa : integer;

  begin
   total := 0;
     repeat
       begin
         b_gratis := bungkus_coklat div 3;
         sisa     := bungkus_coklat mod 3;
         bungkus_coklat := b_gratis + sisa;
         total := total + b_gratis;
         Hitung_Coklat := total;
       end;
     until (bungkus_coklat < 3);
  end;

procedure Tampil_Coklat(total : integer);
{I.S.: harga total sudah terdefinisi}
{F.S.: menampilkan total coklat}
 begin
   writeln(Hitung_coklat(total));
 end;

begin
 write('Masukkan coklat yang kamu punya : '); readln(bungkus_coklat);
 BungkusCoklat(bungkus_coklat);
 writeln;
 Tampil_Coklat(total);
 readln;
end.

