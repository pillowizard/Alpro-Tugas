program menu_pilihan_matematika;

uses crt;
var
   menu, n: integer;
   faktor, i, a, b, fibo, akhir,f : integer;
   x,y,s: real;

begin
   repeat
   begin
   clrscr;
   writeln('1. menghitung s');
   writeln('2. menghitung faktorial');
   writeln('3. membuat fibonaci');
   writeln('0. keluar');
   write('pilih menu : '); readln(menu);

   case menu of
        1: begin
            clrscr;
            writeln('ini menu 1');
            write('banyaknya suku : '); readln(n);
            s:= 0;
            x:= 1; {pembilang}
            y:= 3; {penyebut}
                for i:= 1 to n do
                  begin
                    if(i mod 2 = 1)
                       then
                           begin
                           s:= s - x/y;
                           write('-',x:0:0,'/',y:0:0);
                           end
                       else
                           begin
                           s:= s + x/y;
                           write('+',x:0:0,'/',y:0:0);
                           end;

                    x := x * (i + 1);
                    y := y + (i + 1);
                  end;
                  writeln;
                  writeln('jadi S = ',s:0:2);
           end;
        2: begin
            clrscr;
            writeln('ini menu 2');
            write('banyaknya suku : '); readln(n);
            akhir := n - 1;
               for f := 1 to akhir do
                       begin
                            write(f ,' x ');
                       end;
                       writeln(n);
               if((n = 0) or (n = 1))
                  then
                      faktor := 1
                   else
                       begin
                       faktor := 1;
                       for i := 2 to n do
                           i := i + 1;
                           faktor := faktor * i;
                       end;
                   writeln('jadi faktornya adalah : ',faktor);
            end;
        3: begin
            clrscr;
            writeln('ini menu 3');
            write('masukkan angka :'); readln(n);
            a:=0;
            b:=1;

            for i:=1 to n do
                begin
                     write(a,' ');
                     fibo:= a+b;
                     b:=a;
                     a:=fibo
                 end;
           end;
        else
        begin
             clrscr;
             writeln('Keluar? tekan enter!!!');
        end;
   end;
   readln;
   end;
   until menu = 0;
   readln;
end.
