program Pemilihan_Menu;
{I.S.: Pengguna memasukan menu kemudian submenu yang dipilih}
{F.S.: Menghitung dan menampilkan hasil operasi mencari luas, volume, atau keliling sesuai dengan menu yang dipilih}

var
   Menu : integer;
   Menu1, Menu2, Menu3, Menu4 : char;
   Hasil, Panjang, Lebar, Tinggi, Sisi, Alas, JariJari : real;

begin
   writeln('MENU UTAMA');
   writeln('1. HITUNG LUAS');
   writeln('2. HITUNG VOLUME');
   writeln('3. HITUNG KELILING');
   writeln('4. KELUAR');
   writeln();
   write('Masukan Menu (1/2/3/4) = '); readln(Menu);
   writeln();
   writeln();

   if(Menu = 1)
      then
         begin
         writeln('HITUNG LUAS');
         writeln('A. LUAS PERSEGI PANJANG');
         writeln('B. LUAS SEGITIGA');
         writeln('C. LUAS LINGKARAN');
         writeln('D. KELUAR');
         writeln();
         write('Masukan Menu (A/B/C/D) = '); readln(Menu1);
         writeln();
         writeln();
         if(Menu1 = 'A') or (Menu1 = 'a')
            then
               begin
               write('Masukan Panjang = '); readln(Panjang);
               write('Masukan Lebar   = '); readln(Lebar);
               Hasil := Panjang * Lebar;
               writeln();
               writeln('Luas Persegi Panjang = ', Hasil:0:2);
               readln();
               end
            else
               if(Menu1 = 'B') or (Menu1 = 'b')
                  then
                     begin
                     write('Masukan Alas   = '); readln(Alas);
                     write('Masukan Tinggi = '); readln(Tinggi);
                     Hasil := 0.5 * Alas * Tinggi;
                     writeln();
                     writeln('Luas Segitiga = ', Hasil:0:2);
                     readln();
                     end
                  else
                     if(Menu1 = 'C') or (Menu1 = 'c')
                        then
                           begin
                           write('Masukan Jari-Jari   = '); readln(JariJari);
                           Hasil := 3.14 * JariJari * JariJari;
                           writeln();
                           writeln('Luas Lingkaran = ', Hasil:0:2);
                           readln();
                           end
                        else
                           if(Menu1 = 'D') or (Menu1 = 'd')
                              then
                                 begin
                                 writeln('KELUAR');
                                 readln();
                                 end
                              else
                                 begin
                                 writeln('MAAF, PILIHAN YANG ANDA MASUKAN SALAH');
                                 readln();
                                 end
         end
      else
         if(Menu = 2)
            then
            begin
            writeln('HITUNG VOLUME');
            writeln('A. VOLUME KUBUS');
            writeln('B. VOLUME BALOK');
            writeln('C. KELUAR');
            writeln();
            write('Masukan Menu (A/B/C) = '); readln(Menu2);
            writeln();
            writeln();
            if(Menu2 = 'A') or (Menu2 = 'a')
               then
               begin
               write('Masukan Sisi   = '); readln(Sisi);
               Hasil := Sisi * Sisi * Sisi;
               writeln();
               writeln('Volume Kubus = ', Hasil:0:2);
               readln();
               end
            else
                if(Menu2 = 'B') or (Menu2 = 'b')
                  then
                     begin
                     write('Masukan Panjang = '); readln(Panjang);
                     write('Masukan Lebar   = '); readln(Lebar);
                     write('Masukan Tinggi  = '); readln(Tinggi);
                     Hasil := Panjang * Lebar * Tinggi;
                     writeln();
                     writeln('Volume Balok = ', Hasil:0:2);
                     readln();
                     end
                  else
                     if(Menu2 = 'C') or (Menu2 = 'c')
                        then
                           begin
                           writeln('KELUAR');
                           readln();
                           end
                        else
                           begin
                           writeln('MAAF, PILIHAN YANG ANDA MASUKAN SALAH');
                           readln();
                           end
            end
         else
            if(Menu = 3)
            then
                begin
                writeln('HITUNG KELILING');
                writeln('A. KELILING PERSEGI PANJANG');
                writeln('B. KELILING LINGKARAN');
                writeln('C. KELUAR');
                writeln();
                write('Masukan Menu (A/B/C) = '); readln(Menu3);
                writeln();
                writeln();
                if(Menu3 = 'A') or (Menu3 = 'a')
                   then
                   begin
                   write('Masukan Panjang   = '); readln(Panjang);
                   write('Masukan Lebar     = '); readln(Lebar);
                   Hasil := 2 *(Panjang + Lebar);
                   writeln();
                   writeln('Keliling Persegi Panjang = ', Hasil:0:2);
                   readln();
                   end
                else
                   if(Menu3 = 'B') or (Menu3 = 'b')
                   then
                      begin
                      write('Masukan Jari-Jari   = '); readln(JariJari);
                      Hasil := 2 * 3.14 * JariJari;
                      writeln();
                      writeln('Keliling Lingkaran = ', Hasil:0:2);
                      readln();
                      end
                   else
                      if(Menu3 = 'C') or (Menu3 = 'c')
                         then
                            begin
                            writeln('KELUAR');
                            readln();
                            end
                         else
                            begin
                            writeln('MAAF, PILIHAN YANG ANDA MASUKAN SALAH');
                            readln();
                            end
                end
         else
            if(Menu = 4)
               then
                  begin
                  writeln('KELUAR');
                  readln();
                  end
               else
                  begin
                  writeln('MAAF, MENU YANG ANDA MASUKAN SALAH');
                  readln();
                  end
end.
