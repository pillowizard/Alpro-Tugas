program Nilai_Tukaran_Pecahan;
{I.S.: Pengguna memasukan nilai uang rupiah (dalam kelipatan 25)}
{F.F.: Menampilkan nilai uang tersebut dalam nilai tukaran pecahan
yang diantaranya Rp.1000, Rp.500, Rp.100, Rp.50, RP.20 }

type Pecahan = record
                 rp1000: longint;
                 rp500: longint;
                 rp100: longint;
                 rp50: longint;
                 rp25: longint;
               end;

var
   P : Pecahan;
   NilaiUang, Sisa1, Sisa2, Sisa3 : longint;

begin
   write('Nilai uang dalam kelipatan 25 = Rp. '); readln(NilaiUang);

   P.rp1000 := NilaiUang div 1000;
   Sisa1 := NilaiUang mod 1000;
   P.rp500 := Sisa1 div 500;
   Sisa2 := Sisa1 mod 500;
   P.rp100 := Sisa2 div 100;
   Sisa3 := Sisa2 mod 100;
   P.rp50 := Sisa3 div 50;
   P.rp25 := Sisa3 mod 50;

   writeln('');
   writeln('Nilai uang senilai Rp. ', NilaiUang, ' setara dengan ', P.rp1000, ' buah pecahan Rp. 1000 ');
   writeln('ditambah ', P.rp500, ' buah pecahan Rp. 500 ditambah ', P.rp100, ' buah pecahan Rp. 100 ');
   write('ditambah ', P.rp50, ' buah pecahan Rp. 50 ditambah ', P.rp25, ' buah pecahan Rp. 25');
   readln;
end.
