clear all;
clc; 
x=1;
%czestotliwosci strun gitarowych
E2 = 82.4069;
A2 = 110;
D3 = 146.832;
G3 = 195.998;
B3 = 246.942;
E4 = 329.628;
%minmalna i maksymalna przyjmowana czestotliwosc
minf=60;
maxf=350;

%granice pasm miedzy strunami
E2A2 = mean([E2 A2]);
A2D3 = mean([A2 D3]);
D3G3 = mean([D3 G3]);
G3B3 = mean([G3 B3]);
B3E4 = mean([B3 E4]);


while (x)
    clc;
fprintf('Program rozpoczyna dzialanie. Nastapi teraz nagranie dzwieku.\n');

    n=0;
    while (n==0)
    y=nagrywanie();
    n=isempty (input ('Nacisnij enter, by przejsc dalej, badz zero, jesli chcesz powtorzyc nagrywanie.\n'));
    end
fprintf('Program przeprowadzi teraz analize dzwieku.\n');

[y, f]=okienkowanie(y);

%tworzenie prototypow filtrow 64000 elementowych dla kazdej struny
filtr_E2 = (1.*(f<E2A2).*(f>minf))';
filtr_A2 = (1.*(f>E2A2).*(f<A2D3))';
filtr_D3 = (1.*(f>A2D3).*(f<D3G3))';
filtr_G3 = (1.*(f>D3G3).*(f<G3B3))';
filtr_B3 = (1.*(f>G3B3).*(f<B3E4))';
filtr_E4 = (1.*(f>B3E4).*(f<maxf))';
    
dane=fourier(y);
figure;
plot(f,dane); 
title('Transformata Fouriera (modul) dzwieku wejsciowego');
xlabel('Czestotliwosc (Hz)');
    
%teraz trzeba bedzie powiazac filtry strun z FFT, znalezc maksymalne prazki
%dla jakich sa czestotliwosci..
    
    
    
    
    
    
x=isempty (input ('Nacisnij enter, by powtorzyc dzialanie programu, badz zero, by wyjsc.\n')); 
end
