program Berat_Badan_Ideal;
{I.S.: Pengguna memasukan tinggi badan}
{F.S.: Menampilkan berat badan yang ideal untuk tinggi badan tersebut}

var
   TinggiBadan, Tinggi1, Tinggi2, BeratIdeal: real;

begin
   write('Tinggi badan (cm) = '); readln(TinggiBadan);

   Tinggi1 := TinggiBadan - 100;
   Tinggi2 := Tinggi1 * 0.1;
   BeratIdeal := Tinggi1 - Tinggi2;

   writeln('');
   write('Berat badan ideal anda adalah ', BeratIdeal:0:2, ' kg');
   readln;
end.
