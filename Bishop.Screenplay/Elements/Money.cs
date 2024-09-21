using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bishop.Screenplay.Elements
{
    public class Money : IMoney
    {
        public Money(string type, string name, float quantity)
        {
            Type = type;
            Name = name;
            Quantity = quantity;
        }

        public string Type;
        public string Name { get; set; }
        public float Quantity { get; set; }
    }
}
