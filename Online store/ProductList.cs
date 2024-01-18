using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace project_website
{
    public class ProductList
    {
        public int id { get; set; }
        public string name { get; set; }
        public int quantity { get; set; }
        public int price { get; set; }
        public string color { get; set; }
        public string description { get; set; }
        public int category_id { get; set; }
        public string imglink { get; set; }

    }



}