program Konversi_cm_ke_Km_m_cm;
{I.S.: Pengguna memasukan Total Jarak}
{F.S.: Menampilkan hasil konversi berupa km, m, cm}

type Jarak = record
               km: longint;
               m: longint;
               cm: longint;
             end;

var
   J : Jarak;
   TotalJarak, Sisa: longint;

begin
   write('Total jarak (cm) = '); readln(TotalJarak);

   J.km := TotalJarak div 100000;
   Sisa := TotalJarak mod 100000;
   J.m := Sisa div 100;
   J.cm := Sisa mod 100;

   writeln('');
   writeln('Total jarak yang ditempuh sejauh ', J.km, ' km + ', J.m, ' m + ', J.cm, ' cm');
   readln;
end.
