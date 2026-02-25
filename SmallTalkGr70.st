"Mateusz Rzęsa 198417, Patrtk Lewandowski 197897, Kacper Mikołajuk 198254"

Object subclass: #Wielokat
	instanceVariableNames: 'wierzcholki nazwa '
	classVariableNames: ''
	poolDictionaries: ''
	category: 'JezykiProgramowania'!

!Wielokat methodsFor: 'initialize-release'!

initialize: liczbaWierzcholkow name: nowaNazwa
	"konstruktor obiektu - wielokata"

	nazwa:=nowaNazwa.
	wierzcholki:=Array new: liczbaWierzcholkow.
	wierzcholki at: 1 put: 0@0.! !

!Wielokat methodsFor: 'accessing'!

nazwa
	"podaje nazwe wielokata"

	^nazwa!

nazwa: nowa_nazwa
	"ustawia nowa nazwe wielokata"

	nazwa:=nowa_nazwa! !

!Wielokat methodsFor: 'printing'!

drukuj
    "Drukuje wierzchołki i pole figury oraz wyniki operacji przekształceń"
    Transcript show: 'Wielokąt: ', nazwa; cr.
    Transcript show: 'Wierzchołki: ', wierzcholki printString; cr.
    Transcript show: 'Pole: ', self pole printString; cr.
    Transcript show: '---'; cr.
! !

!Wielokat methodsFor: 'transformations'!

skaluj: liczba
    self drukuj.
    "Skaluje wielokąt, przeskalowując współrzędne wierzchołków przez podaną liczbę"
    wierzcholki := wierzcholki collect: [:punkt | punkt * liczba].
    self drukuj.
! !

Wielokat subclass: #Kwadrat
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'JezykiProgramowania'!


!Kwadrat methodsFor: 'accessing'!

bok
    ^(wierzcholki at: 2) x.
! !

!Kwadrat methodsFor: 'arithmetic'!

+ figura
	"dodaj 2 figury w sensie pola"

	| p |

	p:=self pole + figura pole.
	^(Kwadrat new) initialize: p sqrt! !

!Kwadrat methodsFor: 'actions'!

pole
	"licz pole kwadratu"

	^(wierzcholki at: 2) x squared! !

!Kwadrat methodsFor: 'actions'!
= figura
    
    ^ self bok = figura bok.
! !


!Kwadrat methodsFor: 'initialize-release'!

initialize: bok
	"tworz kwadrat o podanym boku"

	super initialize: 4 name: 'Kwadrat'.
	wierzcholki at: 2 put: bok@0.
	wierzcholki at: 3 put: bok@bok.
	wierzcholki at: 4 put: 0@bok.! !
	
	
Wielokat subclass: #Romb
    instanceVariableNames: 'kat'
    classVariableNames: ''
    poolDictionaries: ''
    category: 'JezykiProgramowania'!

!Romb methodsFor: 'initialize-release'!

initialize: bok kat: k
    "Inicjalizacja rombu o boku a i kącie k"
    super initialize: 4 name: 'Romb'.
    kat := k.
    "Ustawienie wierzchołków na podstawie długości boku i kąta"
    wierzcholki at: 1 put: 0@0.
    wierzcholki at: 2 put: bok@0.
    wierzcholki at: 3 put: (bok * (kat cos))@(bok * (kat sin)).
    wierzcholki at: 4 put: (bok * (kat cos)) + (bok)@(bok * (kat sin)).
! !

!Romb methodsFor: 'accessing'!

kat
    ^kat.
! !

!Romb methodsFor: 'accessing'!

bok
    | wierzcholek2 bok |

    wierzcholek2 := wierzcholki at: 2.
    
    bok := wierzcholek2 x.
    
    ^bok.
! !

!Romb methodsFor: 'arithmetic'!

+ figura
    | p wynikowyBok |
    
    p := self pole + figura pole.
    
    wynikowyBok := (p / (kat sin)) sqrt.
    
    ^(Romb new) initialize: wynikowyBok kat: kat.
! !

!Romb methodsFor: 'arithmetic'!
= figura
    
    ^ self bok = figura bok and: [kat = figura kat].
! !

!Romb methodsFor: 'actions'!

pole
    | wierzcholek2 bok |


    bok := self bok.

    ^ (bok squared) * (kat sin).
! !



"Tworzenie instancji Kwadrat i Romb"
kwadrat := Kwadrat new.
kwadrat initialize: 5.
Transcript show: 'Pole kwadratu: ', (kwadrat pole) printString; cr.

romb := Romb new initialize: 5 kat: (90 degreesToRadians).

romb skaluj: 2.


romb1 := Romb new initialize: 5 kat: (90 degreesToRadians).
romb2 := Romb new initialize: 7 kat: (45 degreesToRadians).
romb1 drukuj.
romb2 skaluj: 0.5.

kwadrat10 := Kwadrat new initialize: 10.
kwadrat10 skaluj: 0.75.

romb3 := Romb new initialize: 7 kat: (45 degreesToRadians).

romb4 := Romb new initialize: 7 kat: (45 degreesToRadians).

nowyRomb := romb1 + romb2.
nowyRomb drukuj.

Transcript show: (romb1 = romb2) printString; cr.
Transcript show: (romb3 = romb4) printString; cr.

kwadrat1 := Kwadrat new initialize: 5.
kwadrat2 := Kwadrat new initialize: 7.
kwadrat3 := Kwadrat new initialize: 5.

Transcript show: (kwadrat1 = kwadrat2) printString; cr.
Transcript show: (kwadrat1 = kwadrat3) printString; cr.
