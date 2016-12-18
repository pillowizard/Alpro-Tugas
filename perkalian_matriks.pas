Program PerkalianMatriks;
Uses crt;
Var
    MatriksA, MatriksB, MatriksHasil : array [1..100, 1..100] of longint;
    mA, nA, mB, nB : integer; //baris dan kolom
    i, j, k : integer; //indeks pengulangan
     
Begin
    write('Masukkan jumlah baris untuk matriks A = '); readln(mA);
    write('Masukkan jumlah kolom untuk matriks A = '); readln(nA);
    write('Masukkan jumlah baris untuk matriks B = '); readln(mB);
    write('Masukkan jumlah kolom untuk matriks B = '); readln(nB);
    writeln;
     
    if (nA = mB) then
    begin
        //Input matriks A
        writeln('Input data matriks A');
        for i := 1 to mA do
            for j := 1 to nA do
            begin
                write('Masukan Elemen Baris ke ',i, ' Kolom ke ',j, ' = '); readln(MatriksA[i,j]);
            end;
        writeln;
         
        //Input matriks B
        writeln('Input data matriks B');
        for i := 1 to mB do
            for j := 1 to nB do
            begin
                write('Masukan Elemen Baris ke ', i, ' Kolom ke',j, ' = '); readln(MatriksB[i,j]);
            end;        
        writeln;
         
        //Tampil matriks A
        writeln('Matriks A = ');
        for i := 1 to mA do
        begin
            for j := 1 to nA do
            begin
                write(MatriksA[i,j]:4);
            end;
            writeln;
        end;
         
        //Tampil matriks B
        writeln;
        writeln('Matriks B = ');
        for i := 1 to mB do
        begin
            for j := 1 to nB do
            begin
                write(MatriksB[i,j]:4);
            end;
            writeln;
        end;
         
        //Perkalian Matriks
        for i := 1 to mA do
        begin
            for j := 1 to nB do
            begin
                MatriksHasil[i, j] := 0;
                for k := 1 to nA do
                begin
                    MatriksHasil[i, j] := MatriksHasil[i, j] + (MatriksA[i, k] * MatriksB[k, j]);
                end;
            end;
        end;
         
        //Tampil Matriks Hasil
        writeln;
        writeln('Hasil = Matriks A x Matriks B = ');
        for i := 1 to mA do
        begin
            for j := 1 to nB do
            begin
                write(MatriksHasil[i,j]:4);
            end;
            writeln;
        end;
        readln;
    end
    else
    begin
        writeln('Kolom Matriks A harus sama dengan Baris Matriks B');
        readln;
    end;
end.
