program Pertukaran;
{I.S.: Pengguna memasukan nilai pada variable X, Y, Z}
{F.S.: Menampilkan hasil pertukaran nilai X, Y, Z menjadi Y, Z, X}

var
   X, Y, Z, A : integer;

begin
   write('Nilai X = '); readln(X);
   write('Nilai Y = '); readln(Y);
   write('Nilai Z = '); readln(Z);

   A := X;
   X := Y;
   Y := Z;
   Z := A;

   writeln('');
   writeln('Hasil Pertukaran: ');
   writeln('Nilai X = ', X);
   writeln('Nilai Y = ', Y);
   writeln('Nilai Z = ', Z);
   readln;
end.
