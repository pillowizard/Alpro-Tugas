program Menghitung_Pangkat;
{I.S.: pengguna memasukan harga a dan b}
{F.S.: menampilkan hasil dari a pangkat b}

var
   a, b : integer;

procedure Isi (var a, b : integer);
{I.S.: pengguna memasukan harga a dan b}
{F.S.: menghasilkan harga a dan b}
begin
   write('Masukan angka   = '); readln(a);
   write('Masukan pangkat = '); readln(b);
end;

function Hitung (a, b : integer) : integer;
{I.S.: harga a dan b sudah terdefinisi}
{F.S.: menghasilkan fungsi a pangkat b}
begin
   if b <= 0
      then
         Hitung := 1
      else
         Hitung := a * Hitung(a, b - 1);
end;

procedure Tampil (a, b : integer);
{I.S.: hasil dari a pangat b sudah terdefinisi}
{F.S.: menampilkan hasil dari a pangkat b}

begin
   writeln('Hasil dari ', a,' pangkat ', b, ' adalah ', Hitung(a, b));
   readln;
end;

begin
   Isi(a, b);
   Tampil(a, b);
   readln;
end.
