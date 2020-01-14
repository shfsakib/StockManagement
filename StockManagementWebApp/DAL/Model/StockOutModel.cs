using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace StockManagementWebApp.DAL.Model
{
    public class StockOutModel
    {

        public int ItemSl { get; set; }
        public int Quantity { get; set; }
        public string Type { get; set; }
        public string InTime { get; set; }
    }
}