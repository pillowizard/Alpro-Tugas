program Menu_Pilihan;
{I.S.: pengguna memasukan menu}
{F.S.: menampilkan hasil sesuai menu yang dipilih}

uses crt;
var
   menu, n, i, a, b, f, faktor, fibo, akhir : integer;
   x, y, s : real;

begin
   Repeat
      begin
         textbackground(15);
         clrscr;
         textcolor(0);
         writeln('MENU PILIHAN');
         writeln('-------------');
         writeln('1. MENGHITUNG S = -1/3 + 2/5 - 6/8 + 24/12 - ...');
         writeln('2. MENGHITUNG FAKTORIAL');
         writeln('3. MENGHITUNG FIBONACI');
         writeln('0. KELUAR');
         writeln();
         write('Masukan Menu (1/2/3/0) = '); readln(menu);

      if(menu > 3)
         then
            begin
               clrscr;
               writeln('Menu yang anda masukan tidak tersedia.');
            end;

      case menu of
            1 : begin
                   clrscr;
                   writeln('MEGHITUNG S');
                   writeln('-----------');
                   write('Masukan banyaknya suku = '); readln(n);
                   writeln();
                   s := 0;
                   x := 1; {pembilang}
                   y := 3; {penyebut}
                   for i := 1 to n do
                      begin
                         if(i mod 2 = 1)
                            then
                               begin
                                  s := s - x/y;
                                  write(' - ', x:0:0, '/', y:0:0);
                               end
                            else
                               begin
                                  s := s + x/y;
                                  write(' + ', x:0:0, '/', y:0:0);
                               end;
                         x := x * (i + 1);
                         y := y + (i + 1);
                      end;
                      writeln();
                      writeln();
                      writeln('Maka S = ', s:0:2);
                end;
            2 : begin
                   clrscr;
                   writeln('MEGHITUNG FAKTORIAL');
                   writeln('--------------------');
                   write('Masukan banyaknya suku = '); readln(n);
                   writeln();
                   akhir := n - 1;
                   for f := 1 to akhir do
                      begin
                         write(f, ' x ');
                      end;
                      writeln(n);
                   if(n = 0) or (n = 1)
                      then
                         faktor := 1
                      else
                         begin
                            faktor := 1;
                            for i := 2 to n do
                               i := i + 1;
                               faktor := faktor * i;
                         end;
                   writeln();
                   writeln('Maka faktornya = ', faktor);
                end;
            3 : begin
                   clrscr;
                   writeln('MEGHITUNG FOBONACI');
                   writeln('------------------');
                   write('Masukan angka = '); readln(n);
                   writeln();
                   a := 0;
                   b := 1;
                   for i := 1 to n do
                      begin
                         write(a, ' ');
                         fibo := a + b;
                         b := a;
                         a := fibo;
                      end;
                end;
            0 : begin
                   clrscr;
                   writeln('Tekan enter untuk keluar!');
                end;
      end;
      readln;
      end;
   Until(menu = 0)
end.
