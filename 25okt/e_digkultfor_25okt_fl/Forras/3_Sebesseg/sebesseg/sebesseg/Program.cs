
using sebesseg;
using System.Globalization;

List<Adat> adatok = new List<Adat>();

StreamReader reader = new StreamReader("ut.txt");
int teljesHossz = int.Parse(reader.ReadLine());
while (!reader.EndOfStream)
{
    string[] vag = reader.ReadLine().Split(" ");
    adatok.Add(new Adat(int.Parse(vag[0]), vag[1]));
}
reader.Close();

Console.WriteLine("2. feladat");
Console.WriteLine("A települések neve:");
foreach  (Adat adat in adatok)
{
    if (adat.ertek.Length >= 4)
    {
        Console.WriteLine(adat.ertek);
    }
}
Console.WriteLine();


Console.WriteLine("3. feladat");
Console.Write("Adja meg a vizsgált szakasz hosszát km-ben! ");
double beTav = double.Parse(Console.ReadLine());
int minSeb = 90;
foreach (Adat adat in adatok)
{
    if(adat.tav <= beTav * 1000)
    {
        if (adat.ertek.Length == 2)
        {
            if (int.Parse(adat.ertek) < minSeb)
            {
                minSeb = int.Parse(adat.ertek);
            }
        }
        else if (adat.ertek.Length >= 4)
        {
            if (minSeb > 50)
            {
                minSeb = 50;
            }
        }
    }
}
Console.WriteLine("Az első {0} km-en {1} km/h volt a legalacsonyabb megengedett sebesség.", beTav, minSeb);
Console.WriteLine();


Console.WriteLine("4. feladat");
int varosban = 0;
int seged = 0;
foreach (Adat adat in adatok)
{
    if (adat.ertek.Length >= 4)
    {
        seged = adat.tav;
    }
    else if (adat.ertek == "]")
    {
        varosban += adat.tav - seged;
    }
}
double szazalek = ((double)varosban / teljesHossz) * 100;
Console.WriteLine("Az út {0} százaléka vezet településen belül.", Math.Round(szazalek, 2));
Console.WriteLine();

Console.WriteLine("5. feladat");
Console.Write("Adja meg egy település nevét! ");
string beVaros = Console.ReadLine();
int beVarosTav = 0;
bool beVarosban = false;
int beVarosTablaDb = 0;
int beVarosVegeTav = 0;
foreach (Adat adat in adatok)
{
    if (adat.ertek == beVaros)
    {
        beVarosTav = adat.tav;
        beVarosban = true;
    }
    if (beVarosban == true && adat.ertek == "]")
    {
        beVarosVegeTav = adat.tav;
        beVarosban = false;
    }
    if (beVarosban == true && adat.ertek.Length == 2)
    {
        beVarosTablaDb++;
    }
}
Console.WriteLine("A sebességkorlátozó táblák száma: {0}", beVarosTablaDb);
Console.WriteLine("Az út hossza a településen belül {0} méter.", beVarosVegeTav - beVarosTav);
Console.WriteLine();


Console.WriteLine("6. feladat");
string elotteVarosNev = "";
int elotteVarosTav = 0;
string utanaVarosNev = "";
int utanaVarosTav = 0;
foreach (Adat adat in adatok)
{
    if (adat.tav < beVarosTav && adat.ertek.Length >= 4)
    {
        elotteVarosNev = adat.ertek;
    }
    if (adat.tav < beVarosTav && adat.ertek == "]")
    {
        elotteVarosTav = adat.tav;
    }
    if (adat.tav > beVarosTav && adat.ertek.Length >= 4)
    {
        utanaVarosNev = adat.ertek;
    }
    if (adat.tav > beVarosTav && adat.ertek == "]")
    {
        utanaVarosTav = adat.tav;
    }
}
Console.Write("A legközelebbi település: ");
if (beVarosTav - elotteVarosTav == utanaVarosTav - beVarosVegeTav)
{
    Console.WriteLine(elotteVarosNev);
}
else if (beVarosTav - elotteVarosTav > utanaVarosTav - beVarosVegeTav)
{
    Console.WriteLine(utanaVarosNev);
}
else if (beVarosTav - elotteVarosTav < utanaVarosTav - beVarosVegeTav)
{
    Console.WriteLine(elotteVarosNev);
}

