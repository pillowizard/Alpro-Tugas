program pengecekan_matriks;
{I.S.:}
{F.S.:}

var
	matriks : array[1..3,1..3] of integer;
    i , j : integer;

begin
for i := 1 to 3 do
     begin
     for j := 1 to 3 do
          begin
          write('Masukan Elemen Baris ke ',i,' Kolom ke ',j,' : ');
          readln(matriks[i,j]);
     end;
end;
writeln;

if((matriks[1][2]=matriks[2][1]) and (matriks[1][3]=matriks[3][1]) and (matriks[2][3]=matriks[3][2]))
then
begin
     write('Matriks tersebut adalah matriks simetris');
     readln;
end
else
begin
     write('Matriks tersebut bukan matriks simetris');
     readln;
end;
end.
