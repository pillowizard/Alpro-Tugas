program Menjumlahkan_dua_buah_angka;
{I.S. : user memasukan dua buah angkia}
{F.S. : menampilkan hasil penjumlahan}

var
   Angka1, Angka2, Hasil: Integer ;

begin
     write('Angka ke-1: '); readln(Angka1);
     write('Angka ke-2: '); readln(Angka2);
     Hasil := Angka1 + Angka2;
     writeln('Hasil Penjumlahan: ', Angka1, ' + ', Angka2);
     writeln('                 : ', Hasil);
     readln;
end.
