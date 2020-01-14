namespace StockManagementWebApp.DAL.Model.View_Model
{
    public class StockOutViewModel
    {
        public int Sl { get; set; }
        public int CompanySl { get; set; }
        public string CompanyName { get; set; }
        public int ItemSl { get; set; }

        public string ItemName { get; set; }
        public int ReorderLevel { get; set; }
        public int Quantity { get; set; }
        public int StockOutQuantity { get; set; }
        public string Type { get; set; }
        public string InTime { get; set; }
    }
}