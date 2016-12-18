program Konversi_Meter_ke_Inchi_Kaki_atau_Yard;
{I.S.: Pengguna memasukan panjang sebuah benda dalam satuan meter}
{F.S.: Menampilkan hasil konversi dalam satuan inchi, kaki, atau yard}

type Panjang = record
                 meter: real;
                 inchi: real;
                 kaki: real;
                 yard: real;
               end;

var
   P: Panjang;

begin
   write('Panjang Sebuah Benda (m) = '); readln(P.meter);

   P.inchi := P.meter / 0.0254;
   P.kaki := P.meter / 0.3048;
   P.yard := P.meter / 0.9144;

   writeln('');
   writeln('Panjang ', P.meter:0:0, ' meter = ', P.inchi:0:4, ' inchi');
   writeln('Panjang ', P.meter:0:0, ' meter = ', P.kaki:0:4, ' kaki');
   writeln('Panjang ', P.meter:0:0, ' meter = ', P.yard:0:4, ' yard');
   readln;
end.
