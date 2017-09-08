using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace assign3._3
{
    class Program
    {
        static void Main(string[] args)
        {
            
            Console.WriteLine("enter order details");
            Console.WriteLine("enter customer id");
            int customerid = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("enter customer name");
            string customername = Console.ReadLine();
            Console.WriteLine("enter item price");
            int itemprice = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine("enter item qty");
            int itemqty = Convert.ToInt32(Console.ReadLine());
            Console.WriteLine(" enter order or overseas");
            string option = Console.ReadLine();
            order obj=null;
            if(option=="order")
            {
       obj= new order(customerid, customername, itemqty, itemprice);
            }
                else if (option=="overseas")
                {
                    obj=new order_overseas(customerid, customername, itemqty, itemprice);
                }
                
           
            double result = obj.getordervalue();

            Console.WriteLine(obj.pcustomerid + " " + obj.pcustomername + " " + result);
           
            Console.ReadLine();
         
        }
           
    }
}
