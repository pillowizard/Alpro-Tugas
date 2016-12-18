program Menghitung_Coklat_Gratis;
{I.S.: pengguna memasukan jumlah coklat}
{F.S.: menampilkan jumlah coklat yang didapat}

var
   bungkus_coklat, total : integer;

procedure Validasi_Coklat(var bungkus_coklat : integer);
{I.S.: harga bungkus coklat sudah terdefinisi untuk divalidasi}
{F.S.: menghasilkan harga bungkus coklat yang sudah divalidasi}
begin
   while (bungkus_coklat < 3) or (bungkus_coklat > 100) do
      begin
         writeln('Jumlah bungkus coklat minimal 3 dan maksimal 100');
         write('Masukan jumlah bungkus coklat = '); readln(bungkus_coklat);
      end;
end;

function Total_Coklat(total : integer) : integer;
{I.S.: menghitung harga bungkus_coklat}
{F.S.: menghasilkan total coklat gratis yang didapat}
var
   gratis, sisa : integer;
begin
   total := 0;
   repeat
      begin
         gratis := bungkus_coklat div 3;
         sisa := bungkus_coklat mod 3;
         bungkus_coklat := gratis + sisa;
         total := total + gratis;
         Total_Coklat := total;
      end;
   until(bungkus_coklat < 3);
end;

procedure Tampil_Total(total : integer);
{I.S.: harga total sudah terdefinisi}
{F.S.: menampilkan total coklat}
begin
   writeln(Total_Coklat(total));
end;

begin
   write('Masukan jumlah bungkus coklat = '); readln(bungkus_coklat);
   Validasi_Coklat(bungkus_coklat);
   Tampil_Total(total);
   readln;
end.
