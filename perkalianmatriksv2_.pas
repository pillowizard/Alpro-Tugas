program perkalian_matriks;
uses crt;
type
    matriks = array[1..100,1..100] of integer;
var
    A,B,C : matriks;
    mA,nA,mB,nB : integer;

procedure isimatriks (var A,B : matriks);
var
   i,j : integer;
begin
     write('Masukkan jumlah baris Matriks A = '); readln(mA);
     write('Masukkan jumlah kolom Matriks A = '); readln(nA);
     write('Masukkan jumlah baris Matriks B = '); readln(mB);
     write('Masukkan jumlah kolom Matriks B = '); readln(nB);
     writeln;

     //validasi jumlah kolom
     while (nA <> mB) do
     begin
          clrscr;
          writeln('Jumlah baris dan kolom A dan B tidak sesuai!');
          writeln('Jumlah Kolom A harus sama dengan Baris B!');
          writeln;
          writeln('Masukkan jumlah baris Matriks A = ',mA);
          write('Masukkan jumlah kolom Matriks A = '); readln(nA);
          write('Masukkan jumlah baris Matriks B = '); readln(mB);
          write('Masukkan jumlah kolom Matriks B = '); readln(nB);
          writeln;
     end; //endwhile
     //isi matriks a
     writeln('Matriks pertama (Matriks A)');
     for i := 1 to mA do
     begin
          for j := 1 to nA do
          begin
               write('A[',i,',',j,'] : '); readln(A[i,j]);
          end;
          writeln;
     end; //endfor
     writeln;
     //isi matriks b
     writeln('Matriks kedua (Matriks B)');
     for i := 1 to mB do
     begin
          for j := 1 to nB do
          begin
               write('B[',i,',',j,'] : '); readln(B[i,j]);
          end; //endfor
          writeln;
     end; //endfor
     writeln;
end; //endprocedure
function kalimatriks(var A,B:integer):integer;
begin
     kalimatriks := A*B
end; //endfunction
procedure tampilmatriks(var C : matriks);
var
   i,j,k : integer;
begin
     for i := 1 to mA do
     begin
          for j := 1 to nB do
          begin
               C[i,j] := 0;
               for k := 1 to nA do
               begin
               C[i,j] := C[i,j]+kalimatriks(A[i,k],B[k,j]);
               end; //endfor
               write('C[',i,',',j,'] : '); writeln(C[i,j]);
               writeln;
          end; //endfor
     end; //endfor
end; //endprocedure
begin
     isimatriks(A,B);
     tampilmatriks(C);
     readln;
end.
