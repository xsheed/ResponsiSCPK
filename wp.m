data = xlsread('Real Estate.xlsx', 'C2:E51');
%import data pada Real Estate.xlsx kolom C baris 2 hingga kolom E baris 51
data1 = xlsread('Real Estate.xlsx', 'H2:H51');
%import data pada kolom H baris 2 hingga baris 51
x = [data data1];
k = [1,0,1,0]; %atribut kriteria, dimana 1 adalah benefit/keuntungan dan 0 adalah cost/biaya
w = [3, 5, 4, 1];
%Nilai bobot tiap kriteria 

%tahapan pertama, perbaikan bobot
[m n]=size (x); %inisialisasi ukuran x 
w = w./sum(w);
%membagi bobot per kriteria dengan jumlah total seluruh bobot

%tahapan kedua, melakukan perhitungan vektor(S) per baris (alternatif) 
for j=1:n, 
    if k(j)==0, 
        w(j)=-1*w(j); 
    end; 
end; 
for i=1:m, 
    S(i)=prod(x(i,:).^w); 
end;

%tahapan ketiga, proses perangkingan 
V= S/sum(S)

opts = detectImportOptions('Real Estate.xlsx');
opts.SelectedVariableNames = (1);
rekomendasi = readmatrix('Real Estate.xlsx', opts); %membaca file Real Estate.xlsx

for i=1:5 
   %mengambil data peringkat 1 sampai 5
    for j=1:m
        if(B(i) == V(j))
            alt(i) = "nomor " + rekomendasi(j);
            break;
        end
    end
end

alt