program Menghitung_Pangkat;
{I.S.: }
{F.S.: }

var
   a, b, c, i, hasil : integer;

begin
   write('Masukan angka   = '); readln(a);
   write('Masukan pangkat = '); readln(b);

   while (b <= 0) do
      begin
         writeln();
         writeln('Harga pangkat harus lebih dari nol, ulangi!');
         write('Masukan pangkat = '); readln(b);
      end;

   c := 1;
   for i := 1 to b do
      c := c * a;
   hasil := c;

   writeln();
   write('Hasil dari ', a, ' pangkat ', b, ' adalah ', hasil);
readln;
end.
