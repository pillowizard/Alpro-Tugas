program Nilai_Mahasiswa;
{I.S.:}
{F.f.:}

uses crt;
const
   MaksMhs = 50;
   MaksMK = 10;
type
   Larik1 = array[1..MaksMhs,1..MaksMK] of string;
   Larik2 = array[1..MaksMhs,1..MaksMK] of integer;
   Larik3 = array[1..MaksMhs,1..MaksMK] of char;
var
   NIM, MK : Larik1;
   Nilai   : Larik2;
   Indeks  : Larik3;
Baris,Kolom,i,j : integer;

procedure isi(var MK : Larik1; var Baris,Kolom : integer);
begin
   write('Masukan jumlah mahasiswa   : '); readln(Baris);
   write('Masukan jumlah mata kuliah : '); readln(Kolom);
   clrscr;
   //input mata kuliah
   for i := 1 to 1 do
      for j := 1 to Kolom do
      begin
         gotoxy(13+j*10-8,i);
         readln(MK[i,j]);
      end; //endfor

   //input nim
   for i := 1 to Baris do
      for j := 1 to Kolom do
      begin
         gotoxy(i+2);
         readln(NIM[i,j]);
      end; //endfor

   //input nilai
   for i := 1 to Baris do
      for j := 1 to Kolom do
      begin
         gotoxy(13,i+2);
         readln(Nilai[i,j]);
      end; //endfor

end;

begin
   isi(MK,Baris,Kolom);
   readln;
end.
