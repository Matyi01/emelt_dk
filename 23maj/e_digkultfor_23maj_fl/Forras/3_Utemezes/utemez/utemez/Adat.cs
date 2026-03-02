using System;
using System.Collections.Generic;
using System.Text;

namespace utemez
{
    internal class Adat
    {
        public int kezdHonap;
        public int kezdNap;
        public int vegHonap;
        public int vegNap;
        public string kik;
        public string tema;

        public Adat(int kezdHonap, int kezdNap, int vegHonap, int vegNap, string kik, string tema)
        {
            this.kezdHonap = kezdHonap;
            this.kezdNap = kezdNap;
            this.vegHonap = vegHonap;
            this.vegNap = vegNap;
            this.kik = kik;
            this.tema = tema;
        }
    }
}
