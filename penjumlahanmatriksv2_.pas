program menjumlah_matriks;
{I.S. : }
{F.S. : }

type
    matriks = array[1..100,1..100] of integer;
var
    A,B,C : matriks;
    baris,kolom : integer;

procedure isimatriks (var A,B : matriks);
var
     i,j : integer;
begin
     write('Masukkan Jumlah Baris Matriks = '); readln(baris);
     write('Masukkan Jumlah Kolom Matriks = '); readln(kolom);
     writeln;
     //isi matriks pertama
     writeln('Matriks Pertama (Matriks A)');
     for i := 1 to baris do
     begin
          for j := 1 to kolom do
          begin
               write('A[',i,',',j,'] : '); readln(A[i,j]);
          end; //endfor
          writeln;
     end; //endfor
     writeln;
     //isi matriks kedua
     writeln('Matriks Kedua (Matriks B)');
     for i := 1 to baris do
     begin
          for j := 1 to kolom do
          begin
               write('B[',i,',',j,'] : '); readln(B[i,j]);
          end; //endfor
          writeln;
     end; //endfor
     writeln;
end; //endprocedure
function jumlahmatriks (var A,B : integer):integer;
begin
     jumlahmatriks := A + B;
end; //endfunction
procedure tampilmatriks (var C : matriks);
var
     i,j : integer;
begin
     writeln('Hasil Penjumlahan (Matriks C)');
     for i := 1 to baris do
     begin
          for j := 1 to kolom do
          begin
               C[i,j] := jumlahmatriks(A[i,j],B[i,j]);
               write('C[',i,',',j,'] : '); writeln(C[i,j]);
          end; //endfor
          writeln;
     end; //endfor
end;
begin
     isimatriks(A,B);
     tampilmatriks(C);
     readln;
end.
