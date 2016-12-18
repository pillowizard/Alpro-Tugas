program Selisih_Hari;
{I.S.: Pengguna memasukan Tahun, Bulan, Tanggal pertama dan kedua}
{F.S.: Menampilkan selisih hari berupa Tahun, Bulan, Tanggal}

type Tahun = record
               yy : longint;
               mm : longint;
               dd : longint;
             end;

var
   T1, T2, T3 : Tahun;
   TotalHari1, TotalHari2, TotalHari3, SelisihHari, Sisa : longint;

begin
   write('Tahun pertama   = '); readln(T1.yy);
   write('Bulan pertama   = '); readln(T1.mm);
   write('Tanggal pertama = '); readln(T1.dd);
   writeln('');
   write('Tahun kedua     = '); readln(T2.yy);
   write('Bulan kedua     = '); readln(T2.mm);
   write('Tanggal kedua   = '); readln(T2.dd);

   TotalHari1 := (T1.yy*365) + (T1.mm*30) + T1.dd;
   TotalHari2 := (T2.yy*365) + (T2.mm*30) + T2.dd;

   SelisihHari := TotalHari1 - TotalHari2;

   T3.yy := SelisihHari div 365;
   Sisa := SelisihHari mod 365;
   T3.mm := Sisa div 30;
   T3.dd := Sisa mod 30;

   writeln('');
   writeln('Selisih hari  = ', T3.yy, ' Tahun ', T3.mm, ' Bulan ', T3.dd, ' Hari');
   readln;
end.
