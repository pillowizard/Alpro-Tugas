program Berat_Badan_Ideal;
{I.S.: Pengguna memasukan tinggi dan berat badan}
{F.S.: Menampilkan status "IDEAL" atau "TIDAK IDEAL" untuk tinggi dan berat badan tersebut}

var
   TinggiBadan, Tinggi1, Tinggi2, BeratBadan, BeratIdeal, Selisih: real;

begin
   write('Tinggi badan (cm) = '); readln(TinggiBadan);
   write('Berat badan (kg)  = '); readln(BeratBadan);
   writeln('');

   Tinggi1 := TinggiBadan - 100;
   Tinggi2 := Tinggi1 * 0.1;
   BeratIdeal := Tinggi1 - Tinggi2;
   Selisih := BeratIdeal - beratBadan;

   if Selisih < 0 then
      Selisih := -Selisih;

   if Selisih <= 2 then
      writeln('Berat badan anda IDEAL')
   else
      writeln('Berat badan anda TIDAK IDEAL');

   writeln('Selisih berat badan dengan berat badan ideal anda adalah ', Selisih:0:2, ' kg');
   writeln('Berat badan ideal anda adalah ', BeratIdeal:0:2, ' kg');
   readln;
end.
