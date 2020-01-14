using System;
using System.Collections.Generic;
using System.Data.SqlTypes;
using System.Linq;
using System.Web;

namespace StockManagementWebApp.DAL.Model
{
    public class CategoryModel
    {
        //public int ID { get; set; }
        public int Sl { get; set; }
        public string CategoryName { get; set; }
        public string InTime { get; set; }
    }
}