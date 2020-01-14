using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace StockManagementWebApp.DAL.Model
{
    public class ItemModel
    {
        public int Sl { get; set; }
        public int CategoryId { get; set; }
        public int CompanyId { get; set; }
        public string ItemName { get; set; }
        public int ReorderLevel { get; set; }
        public string InTime { get; set; }
    }
}