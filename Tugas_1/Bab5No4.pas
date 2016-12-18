program Konversi_Hari_ke_Tahun_Bulan_Tanggal;
{I.S.: Pengguna memasukan total hari}
{F.S.: Menampilkan hasil konversi berupa tahun, bulan, hari}

type Tahun = record
               yy: longint;
               mm: longint;
               dd: longint;
             end;

var
   T : Tahun;
   TotalHari, Sisa : longint;

begin
   write('Total hari = '); readln(TotalHari);
   T.yy := TotalHari div 365;
   Sisa := TotalHari mod 365;
   T.mm := Sisa div 30;
   T.dd := Sisa mod 30;
   writeln('');
   writeln('Hasil konversi = ', T.yy, ' Tahun ', T.mm, ' Bulan ', T.dd, ' Hari');
   readln;
end.
