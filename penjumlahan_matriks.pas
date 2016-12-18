Program Penjumlahan_matriks;
{I.S.:}
{I.F.:}

uses crt;
var
	matrik1, matrik2 , hasil : array[1..100,1..100] of integer;
    m, n, i, j : integer;

begin
write('Masukkan jumlah baris matriks = '); readln(m);
write('Masukkan jumlah kolom matriks = '); readln(n);
writeln;

//input matriks pertama
writeln('Elemen Matriks Satu');
for i := 1 to m do
     begin
     for j := 1 to n do
          begin
          write('Masukan Elemen Baris ke ',i,' Kolom ke ',j,' : ');
          readln(matrik1[i,j]);
     end;
end;
writeln;

//input matriks kedua
writeln('Elemen Matriks Dua');
for i:= 1 to m do
     begin
     for j:= 1 to n do
          begin
          write('Masukan Elemen Baris ke ',i,' Kolom ke ',j,': ');
          readln(matrik2[i,j]);
    end;
end;

//proses penjumlahan
for i := 1 to m do
     begin
     for j:= 1 to n do
          begin
          hasil[i,j]:= Matrik1[i,j]+Matrik2[i,j];
     end;
end;

//tampil
writeln;
writeln('Matriks A = ');
for i:= 1 to m do
    begin
    for j:= 1 to n do
         begin
         write(matrik1[i,j]:4);
         end;
         writeln;
    end;

writeln('Matriks B = ');
for i:= 1 to m do
    begin
    for j:= 1 to n do
         begin
         write(matrik2[i,j]:4);
         end;
         writeln;
    end;

writeln('Hasil = Matriks A + Matriks B = ');
for i:= 1 to m do
    begin
    for j:= 1 to n do
         begin
         write(hasil[i,j]:4);
         end;
         writeln;
    end;
readln;
end.
