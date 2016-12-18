program Menghitung_Coklat_Gratis;
{I.S.: }
{F.S.: }

var
n, a, b, total : integer;

begin
   while(n < 3) or (n > 100) do
      begin
         writeln('Jumlah bungkus coklat yang dapat ditukarkan min 3 dan maks 100');
         writeln();
         write('Masukan jumlah bungkus coklat = '); readln(n);
         writeln();
      end;
   total := 0;
      repeat
         a := n div 3;
         b := n mod 3;
         n := a + b;
         total := total + a;
      until(n < 3);
   writeln('Jumlah coklat gratis yang anda dapatkan = ', total);
   readln;
end.
