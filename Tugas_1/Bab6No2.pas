program Menghitung_Diskon;
{I.S.: Pengguna memasukan nilai total belanja}
{F.S.: Menampilkan diskon harga dan nilai belanja setelah dikurangi diskon (diskon = 10%)}

var
   TotalBelanja: longint;
   Diskon, TotalBayar: real;

begin
   write('Nilai total belanja pembeli = Rp. '); readln(TotalBelanja);

   Diskon := 0;

   if TotalBelanja > 100000 then
      Diskon := 0.1 * TotalBelanja;

   TotalBayar := TotalBelanja - Diskon;

   writeln('');
   writeln('Diskon belanja           = Rp. ', Diskon:0:2);
   writeln('Total yang harus dibayar = Rp. ', TotalBayar:0:2);
   readln;
end.
