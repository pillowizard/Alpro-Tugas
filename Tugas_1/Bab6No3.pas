program Mengurutkan_Nilai;
{I.S.:}
{F.F.:}

var
   A, B, C, maks: integer;

begin
   write('Bilangan Pertama = '); readln(A);
   write('Bilangan Kedua   = '); readln(B);
   write('Bilangan Ketiga  = '); readln(C);

   if (A > B) and (A > C) then
      maks := A
   else
       if (B > A) and (B > C) then
          maks := B
       else
          maks := C;

   write(maks);
   readln;

end.
