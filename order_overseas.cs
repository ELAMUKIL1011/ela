using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace assign3._3
{
    class order_overseas : order
    {

        public order_overseas(int customerid,string customername, int itemqty,int itemprice):base(customerid,customername,itemqty,itemprice)
        {
            Console.WriteLine("overseas constructor called");
        }
        public override double getordervalue()
        {
            return (itemqty*itemprice)+((itemqty*itemprice)*0.1);
        }
    }
}
