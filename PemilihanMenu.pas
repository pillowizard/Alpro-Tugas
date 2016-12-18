program Pemilihan_Menu;
{I.S.: Pengguna memasukan menu yang diinginkan}
{F.F.: Menampilkan menu dan hasil menghitung masukkan dari pengguna sesuai rumus}

uses crt;
var
   Menu : integer;
   Hasil, JariJari, Panjang, Lebar, Tinggi, Sisi, Alas : real;
   Menu1, Menu2, Menu3 : char;

begin
   textbackground(15);
   clrscr;
   textcolor(0);         writeln('MENU UTAMA');
                         writeln('----------');
   textcolor(9);         writeln('1. HITUNG LUAS');
   textcolor(3);         writeln('2. HITUNG VOLUME');
   textcolor(6);         writeln('3. HITUNG KELILING');
   textcolor(4);         writeln('4. KELUAR');
                         writeln();
   textcolor(0);         write('Masukan Menu (1/2/3/4) = '); readln(Menu);

   if(Menu = 1)
      then
      begin
         textbackground(9);
         clrscr;
         textcolor(15);
         writeln('MENU HITUNG LUAS');
         writeln('----------------');
         writeln('A. LUAS PERSEGI PANJANG');
         writeln('B. LUAS SEGITIGA');
         writeln('C. LUAS LINGKARAN');
         writeln('D. KELUAR');
         writeln();
         write('Masukan Menu (A/B/C/D) = '); readln(Menu1);
         if(Menu1 = 'A') or (Menu1 = 'a')
            then
            begin
               clrscr;
               writeln('MENGHITUNG LUAS PERSEGI PANJANG');
               writeln('-------------------------------');
               write('Masukan Panjang        = '); readln(Panjang);
               write('Masukan Lebar          = '); readln(Lebar);
               Hasil := Panjang * Lebar;
               writeln();
               writeln('Luas Persegi Panjang   = ', Hasil:0:2)
            end
            else
               if(Menu1 = 'B') or (Menu1 = 'b')
                  then
                  begin
                     clrscr;
                     writeln('MENGHITUNG LUAS SEGITIGA');
                     writeln('------------------------');
                     write('Masukan Alas    = '); readln(Alas);
                     write('Masukan Tinggi  = '); readln(Tinggi);
                     Hasil := 0.5 * Alas * Tinggi;
                     writeln();
                     writeln('Luas Segitiga   = ', Hasil:0:2)
                  end
                  else
                     if(Menu1 = 'C') or (Menu1 = 'c')
                        then
                        begin
                           clrscr;
                           writeln('MENGHITUNG LUAS LINGKARAN');
                           writeln('-------------------------');
                           write('Masukan Jari-Jari   = '); readln(JariJari);
                           Hasil := 3.14 * JariJari * JariJari;
                           writeln();
                           writeln('Luas Lingkaran     = ', Hasil:0:2)
                        end
                        else
                           if(Menu1 = 'D') or (Menu1 = 'd')
                              then
                              begin
                                 clrscr;
                                 write('Tekan Enter Untuk Keluar!')
                              end
                              else
                                 begin
                                    clrscr;
                                    writeln('Maaf Pilihan Menu Yang Anda Masukan Tidak Tersedia.')
                                 end
      end
      else
         if(Menu = 2)
            then
            begin
               textbackground(3);
               clrscr;
               textcolor(15);
               writeln('MENU HITUNG VOLUME');
               writeln('------------------');
               writeln('A. VOLUME KUBUS');
               writeln('B. VOLUME BALOK');
               writeln('C. KELUAR');
               writeln();
               write('Masukan Menu (A/B/C) = '); readln(Menu2);
               if(Menu2 = 'A') or (Menu2 = 'a')
               then
               begin
                  clrscr;
                  writeln('MENGHITUNG VOLUME KUBUS');
                  writeln('-----------------------');
                  write('Masukan Sisi   = '); readln(Sisi);
                  Hasil := Sisi * Sisi * Sisi;
                  writeln();
                  writeln('Volume Kubus   = ', Hasil:0:2)
               end
               else
                  if(Menu2 = 'B') or (Menu2 = 'b')
                     then
                     begin
                        clrscr;
                        writeln('MENGHITUNG VOLUME BALOK');
                        writeln('-----------------------');
                        write('Masukan Panjang   = '); readln(Panjang);
                        write('Masukan Lebar     = '); readln(Lebar);
                        write('Masukan Tinggi    = '); readln(Tinggi);
                        Hasil := Panjang * Lebar * Tinggi;
                        writeln();
                        writeln('Volume Balok      = ', Hasil:0:2)
                     end
                     else
                        if(Menu2 = 'C') or (Menu2 = 'c')
                           then
                           begin
                              clrscr;
                              writeln('Tekan Enter Untuk Keluar!')
                           end
                           else
                              begin
                                 clrscr;
                                 writeln('Maaf Pilihan Menu Yang Anda Masukan Tidak Tersedia.')
                              end
            end
            else
               if(Menu = 3)
                  then
                  begin
                     textbackground(6);
                     clrscr;
                     textcolor(15);
                     writeln('MENU HITUNG KELILING');
                     writeln('--------------------');
                     writeln('A. KELILING PERSEGI PANJANG');
                     writeln('B. KELILING LINGKARAN');
                     writeln('C. KELUAR');
                     writeln();
                     write('Masukan menu (A/B/C) = '); readln(Menu3);
                     if(Menu3 = 'A') or (Menu3 = 'a')
                        then
                        begin
                           clrscr;
                           writeln('MENGHITUNG KELILING PERSEGI PANJANG');
                           writeln('-----------------------------------');
                           write('Masukan Panjang            = '); readln(Panjang);
                           write('Masukan Lebar              = '); readln(Lebar);
                           Hasil := 2 * (Panjang + Lebar);
                           writeln();
                           writeln('Keliling Persegi Panjang   = ', Hasil:0:2)
                        end
                        else
                           if(Menu3 = 'B') or (Menu3 = 'b')
                              then
                              begin
                                 clrscr;
                                 writeln('MENGHITUNG KELILING LINGKARAN');
                                 writeln('------------------------------');
                                 write('Masukan Jari-Jari    = '); readln(JariJari);
                                 Hasil := 2 * 3.14 * JariJari;
                                 writeln();
                                 writeln('Keliling Lingkaran   = ', Hasil:0:2)
                              end
                              else
                                 if(Menu3 = 'C') or (Menu3 = 'c')
                                    then
                                    begin
                                       clrscr;
                                       write('Tekan Enter Untuk Keluar!')
                                    end
                                    else
                                       begin
                                          clrscr;
                                          writeln('Maaf Pilihan Menu Yang Anda Masukan Tidak Tersedia.')
                                       end
                  end
                  else
                     if(Menu = 4)
                        then
                        begin
                           textbackground(4);
                           clrscr;
                           textcolor(15);
                           writeln('Tekan Enter Untuk Keluar!')
                        end
                        else
                           begin
                              clrscr;
                              writeln('Maaf Pilihan Menu Yang Anda Masukan Tidak Tersedia.')
                           end;
   readln;
end.
