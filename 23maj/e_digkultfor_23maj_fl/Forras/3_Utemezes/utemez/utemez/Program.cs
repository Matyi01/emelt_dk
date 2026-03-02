using utemez;

static int sorszam(int honap, int nap)
{
    if (honap == 6)
    {
        return nap - 15;
    } else if (honap == 7)
    {
        return 30 - 15 + nap;
    } else if (honap == 8)
    {
        return 30 - 15 + 31 + nap;
    } else
    {
        return 0;
    }
}


List<Adat> adatok = new List<Adat>();

StreamReader olvas = new StreamReader("taborok.txt");

while (!olvas.EndOfStream)
{
    string sor = olvas.ReadLine();
    string[] vag = sor.Split("\t");
    adatok.Add(new Adat(int.Parse(vag[0]), int.Parse(vag[1]), int.Parse(vag[2]), int.Parse(vag[3]), vag[4], vag[5]));
}

olvas.Close();


Console.WriteLine("2. feladat");
Console.WriteLine("Az adatsorok száma: {0}", adatok.Count);
Console.WriteLine("Az először rögzített tábor témája: {0}", adatok.First().tema);
Console.WriteLine("Az utoljára rögzített tábor témája: {0}", adatok.Last().tema);


Console.WriteLine("3. feladat");
bool voltZeneiTabor = false;
foreach  (Adat e in adatok)
{
    if (e.tema == "zenei")
    {
        Console.WriteLine("Zenei tábor kezdődik {0}. hó {1}. napján.", e.kezdHonap, e.kezdNap);
        voltZeneiTabor = true;
    }
}
if (!voltZeneiTabor)
{
    Console.WriteLine("Nem volt zenei tábor.");
}


Console.WriteLine("4. feladat");
int maxDiak = 0;
foreach (Adat e in adatok)
{
    if (e.kik.Length > maxDiak)
    {
        maxDiak = e.kik.Length;
    }
}
Console.WriteLine("Legnépszerűbbek:");
foreach (Adat e in adatok)
{
    if (e.kik.Length == maxDiak)
    {
        Console.WriteLine("{0} {1} {2}", e.kezdHonap, e.kezdNap, e.tema);
    }
}


Console.WriteLine("6. feladat");
Console.Write("hó: ");
int beHonap = int.Parse(Console.ReadLine());
Console.Write("nap: ");
int beNap = int.Parse(Console.ReadLine());
int beSorszam = sorszam(beHonap, beNap);
int db = 0;
foreach (Adat e in adatok)
{
    int kezdSorszam = sorszam(e.kezdHonap, e.kezdNap);
    int vegSorszam = sorszam(e.vegHonap, e.vegNap);
    if (kezdSorszam <= beSorszam && beSorszam <= vegSorszam)
    {
        db++;
    }
}
Console.WriteLine("Ekkor éppen {0} tábor tart.", db);


Console.WriteLine("7. feladat");
Console.Write("Adja meg egy tanuló betűjelét: ");
string beDiak = Console.ReadLine();
List<Adat> egytanulo = new List<Adat>();
foreach (Adat e in adatok)
{
    if (e.kik.Contains(beDiak))
    {
        egytanulo.Add(e);
    }
}
StreamWriter ir = new StreamWriter("egytanulo.txt");
foreach (Adat e in egytanulo)
{
    ir.WriteLine("{0}.{1}-{2}.{3}. {4}", e.kezdHonap, e.kezdNap, e.vegHonap, e.vegNap, e.tema);
}
ir.Close();


