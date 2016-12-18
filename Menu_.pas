program Menu_Luas_Keliling_Volume;
{I.S. : Memasukkan Menu yang dipilih lalu muncul sub menu}
{F.S. : Menampilkan Menu dan submenu lalu menghitung masukkan dari user sesuai rumus}

var

menu : integer;
hasil, jari_jari, panjang, lebar, tinggi, sisi, alas : real;
menu_1, menu_2, menu_3: char;

begin
   writeln('--------MENU UTAMA--------');
   writeln('1. Hitung Luas');
   writeln('2. Hitung Volume');
   writeln('3. Hitung Keliling');
   writeln('4. Keluar');
   write('Pilih menu (1-4) : '); readln(menu);
   writeln();

   if(menu = 1)
     then
         begin
         writeln('A. Luas Persegi Panjang');
         writeln('B. Luas Segitiga');
         writeln('C. Luas Lingkaran');
         writeln('D. Keluar');
         write('pilih menu (A/B/C/D) : '); readln(menu_1);
         writeln();
     if(menu_1 = 'A') or (menu_1='a')
       then
           begin
           write('Masukkan panjang (cm)       : '); readln(panjang);
           write('Masukkan lebar (cm)         : '); readln(lebar);
           hasil:= panjang*lebar;
           writeln('Luas Persegi Panjang Adalah : ',hasil:0:2);
           end
       else
           if(menu_1='B') or (menu_1='b')
             then
                 begin
                 write('Masukkan alas (cm)     : '); readln(alas);
                 write('Masukkan tinggi (cm)   : '); readln(tinggi);
                 hasil:= 1/2*alas*tinggi;
                 writeln('Luas Segitiga adalah : ',hasil:0:2);
                 end
             else
                 if(menu_1='C') or (menu_1='c')
                   then
                       begin
                       write('Masukkan jari-jari (cm)  : '); readln(jari_jari);
                       hasil:= 3.14*jari_jari*jari_jari;
                       writeln('Luas Lingkaran adalah    : ',hasil:0:2);
                       end
                   else
                       if(menu_1='D') or (menu_1='d')
                         then
                             begin
                             writeln('keluar');
                             end
                         else
                             writeln('MAAF, PILIHAN YANG ANDA MASUKKAN SALAH!');
                             end
                         else
                             if(menu = 2)
                               then
                                   begin
                                   writeln('A. Volume Kubus');
                                   writeln('B. Volume Balok');
                                   writeln('C. Keluar');
                                   write('pilih menu (A/B/C) : '); readln(menu_2);
                                   writeln();

                               if(menu_2 = 'A') or (menu_2='a')
                                 then
                                     begin
                                     write('Masukkan panjang sisi kubus (cm) : '); readln(sisi);
                                     hasil:= sisi*sisi*sisi;
                                     writeln('Volume Kubus Adalah : ',hasil:0:2);
                                     end
                                 else
                                     if(menu_2='B') or (menu_2='b')
                                       then
                                           begin
                                           write('Masukkan Panjang (cm)     : '); readln(panjang);
                                           write('Masukkan Lebar (cm)       : '); readln(lebar);
                                           write('Masukkan Tinggi (cm)      : '); readln(tinggi);
                                           hasil:= panjang*lebar*tinggi;
                                           writeln('Volume Balok adalah : ',hasil:0:2);
                                           end
                                       else
                                            if(menu_2='C') or (menu_2='c')
                                              then
                                              begin
                                              writeln('keluar')
                                              end
                                            else
                                                 writeln('MAAF, PILIHAN YANG ANDA MASUKKAN SALAH!');
                                                 end
                                            else
                                                if(menu = 3)
                                                  then
                                                      begin
                                                      writeln('A. Keliling Persegi Panjang');
                                                      writeln('B. Keliling Lingkaran');
                                                      writeln('C. Keluar');
                                                      write('pilih menu (A/B/C) : '); readln(menu_3);
                                                      writeln();
                                                  if(menu_3 = 'A') or (menu_3='a')
                                                    then
                                                        begin
                                                        write('Masukkan panjang (cm) : '); readln(panjang);
                                                        write('Masukkan lebar (cm)   : '); readln(lebar);
                                                        hasil:= 2*(panjang+lebar);
                                                        writeln('Keliling Persegi Panjang Adalah : ',hasil:0:2);
                                                        end
                                                    else
                                                        if(menu_3='B') or (menu_3='b')
                                                          then
                                                              begin
                                                              write('Masukkan jari-jari (cm)     : '); readln(jari_jari);
                                                              hasil:= 2*3.14*jari_jari;
                                                              writeln('Keliling Lingkaran adalah : ',hasil:0:2);
                                                              end
                                                          else
                                                              if(menu_3='C') or (menu_3='c')
                                                                then
                                                                    begin
                                                                    writeln('keluar')
                                                                    end
                                                                else
                                                                    writeln('MAAF, PILIHAN YANG ANDA MASUKKAN SALAH!');
                                                                    end

                                                                else
                                                                    if(menu = 4)
                                                                      then
                                                                          begin
                                                                          writeln('Keluar');
                                                                          end
                                                                      else
                                                                          begin
                                                                          writeln('MAAF, PILIHAN MENU YANG ANDA MASUKKAN SALAH!');
                                                                          end;

readln;
end.

