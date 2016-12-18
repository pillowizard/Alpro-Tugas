program Menjumlahkan_dua_buah_angka;
{I.S. : diberikan harga ke dalam var. Angka1 = 4 dan var. Angka2 = 2 bertipe bilangan bulat}
{F.S. : menampilkan hasil penjumlahan}

var
   Angka1, Angka2, Hasil: integer;

begin
     Angka1 := 4;
     Angka2 := 2;
     Hasil := Angka1 + Angka2;
     writeln('Hasil Penjumlahan: ', Hasil);
     readln;
end.
