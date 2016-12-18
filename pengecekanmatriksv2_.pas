program pengecekan_matrix;
type
    matriks = array[1..3,1..3] of integer;
var
    A : matriks;
    i,j : integer;
procedure isimatriks (var A : matriks);
begin
     writeln('Isi data matriks');
     writeln;
     for i := 1 to 3 do
     begin
          for j := 1 to 3 do
          begin
              write('A[',i,',',j,'] : '); readln(A[i,j]);
          end;
          writeln;
     end; //endfor
     writeln;
     if((A[1,2] = A[2,1]) and (A[1,3] = A[3,1]) and (A[2,1] = A[1,2]))
     then
         begin
              write('Matriks tersebut adalah matriks simetris!');
         end
     else
         begin
              write('Matriks tersebut bukan matriks simetris!');
         end;
end; //endprocedure
begin
     isimatriks(A);
     readln;
end.
