using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace StockManagementWebApp.DAL.Model
{
    public class LogInModel
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public string SecurityQuestion { get; set; }
        public string Answer { get; set; }
    }
}