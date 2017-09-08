using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace assign3._3
{
    class order
    {
        protected int customerid;
        protected string customername;
        protected int itemqty;
        protected int itemprice;
        public int pcustomerid
        {
            get {
                return customerid;
            
            }
        }
        public string pcustomername
        {
            get
            {
                return customername;

            }
        }
        
        public order(int customerid, string customername, int itemqty, int itemprice)
        {
            this.customerid = customerid;
            this.customername = customername;
            this.itemprice = itemprice;
            this.itemqty = itemqty;


        }
        public virtual double getordervalue()
        {

            return itemqty*itemprice;
        }
        

    }
}
