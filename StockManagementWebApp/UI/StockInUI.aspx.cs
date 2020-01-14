using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using StockManagementWebApp.BLL;
using StockManagementWebApp.DAL.Model;
using StockManagementWebApp.DAL.Model.View_Model;

namespace StockManagementWebApp.UI
{
    public partial class StockInUI : System.Web.UI.Page
    {
        StockInManager stockInManager = new StockInManager();
        StockInViewModel stockInViewModel = new StockInViewModel();
        StockInModel stockInModel=new StockInModel();
        private double totalResult;
      
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Email"] == null)
            {
                Response.Redirect("/UI/IndexUI.aspx");
            }
            if (!IsPostBack)
            {
                CompanyList(stockInViewModel);
                ItemListByCompany(stockInViewModel);
               
               
            }

        }
        private void CompanyList(StockInViewModel stockInViewModel)
        {
            companyDropDownList.DataSource = stockInManager.GetAllItemCompany();


            companyDropDownList.DataTextField = "CompanyName";
            companyDropDownList.DataValueField = "CompanyId";
            companyDropDownList.DataBind();
            companyDropDownList.Items.Insert(0, new ListItem("Select a Company"));


        }

        private void ItemListByCompany(StockInViewModel stockInViewModel)
        {

            itemDropDownList.DataSource = stockInManager.GetAllItemByCompany(stockInViewModel);
            itemDropDownList.DataTextField = "ItemName";
            itemDropDownList.DataValueField = "ItemSl";
            itemDropDownList.DataBind();
            itemDropDownList.Items.Insert(0, new ListItem("Select a Item"));

        }

        protected void companyDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (companyDropDownList.Text != "Select a Company")
            {

                stockInViewModel.CompanyId = Convert.ToInt32(companyDropDownList.SelectedValue);
                ItemListByCompany(stockInViewModel);
            }
            else
            {
                stockInViewModel.CompanyId = 0;
               
            }
            errorLabel.Text = "";
        }


        private void GetReorderLevel(StockInViewModel stockInViewModel)
        {
            if (itemDropDownList.Text != "Select a Item")
            {
                stockInViewModel = stockInManager.GetReorderByItem(stockInViewModel);
                reorderTextBox.Text = stockInViewModel.ReorderLevel.ToString();
            }
            else
            {
                reorderTextBox.Text = "0";
            }
        }
        private void GetQuantityByCompanyItem(StockInViewModel stockInViewModel)
        {

            stockInViewModel = stockInManager.GetQuantityByCompanyAndItem(stockInViewModel);
            //availableQuantityTextBox.Text = stockInModel.AvailableQuantity.ToString();
            if (stockInViewModel == null)
                availableQuantityTextBox.Text = "0";
            else
                availableQuantityTextBox.Text = stockInViewModel.Quantity.ToString();
        }

       
        //private double AddStockQuantity(double preStockInQuantity, double inStockInQuantity)
        //{

        //    preStockInQuantity = Convert.ToDouble(stockLabel.Text);
        //    inStockInQuantity = Convert.ToDouble(stockInQuantityTextBox.Text);
        //    totalResult = preStockInQuantity + inStockInQuantity;
        //    return totalResult;
        //}
        protected void itemDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (companyDropDownList.Text == "Select a Company")
            {
                companyDropDownList.SelectedValue ="0";
                stockInViewModel.CompanyId = Convert.ToInt32(companyDropDownList.SelectedValue);
            }
            if (itemDropDownList.Text != "Select a Item")
            {
                stockInViewModel.ItemSl = Convert.ToInt32(itemDropDownList.SelectedValue);
                stockInModel.ItemSl = Convert.ToInt32(itemDropDownList.SelectedValue);
                stockInViewModel.CompanyId = Convert.ToInt32(companyDropDownList.SelectedValue);
           
            }
            else
            {
                stockInViewModel.ItemSl = 0;
                stockInModel.ItemSl = 0;
                stockInViewModel.CompanyId = 0;
            }
           
            if (stockInViewModel != null)
            {
                GetReorderLevel(stockInViewModel);
                GetQuantityByCompanyItem(stockInViewModel);
            }

        }

        //private double AddQuantity(double availableQuantity, double stockInQuantity)
        //{
        //    if (availableQuantityTextBox.Text == "   Available Quantity")
        //    {
        //        availableQuantityTextBox.Text = 0.ToString();
        //    }
        //    if (stockInQuantityTextBox != null && !string.IsNullOrWhiteSpace(stockInQuantityTextBox.Text))
        //    {
        //        availableQuantity = Convert.ToDouble(availableQuantityTextBox.Text);
        //        stockInQuantity = Convert.ToDouble(stockInQuantityTextBox.Text);
        //        totalResult = availableQuantity + stockInQuantity;

        //    }

        //    return totalResult;
        //}
        protected void saveButton_Click(object sender, EventArgs e)
        {
            if (stockInQuantityTextBox != null && !string.IsNullOrWhiteSpace(stockInQuantityTextBox.Text) && companyDropDownList.Text != "Select a Company" && itemDropDownList.Text != "Select a Item" && reorderTextBox.Text != "   Reorder Level")
            {
                DateTime dateTime = DateTime.Now;
                stockInModel.ItemSl = Convert.ToInt32(itemDropDownList.Text);
                if (availableQuantityTextBox.Text == "   Available Quantity")
                {
                    stockInModel.Quantity = 0;
                }
                else
                {
                    stockInModel.Quantity = Convert.ToInt32(stockInQuantityTextBox.Text);



                }
                stockInModel.InTime = dateTime.ToString("MM-dd-yyyy");

                companyDropDownList.Text = "Select a Company";
                itemDropDownList.Text = "Select a Item";
                reorderTextBox.Text = "   Reorder Level";
                availableQuantityTextBox.Text = "   Available Quantity";
                stockInQuantityTextBox.Text = null;

                string message = stockInManager.Save(stockInModel);
                errorLabel.Text = message;
                errorLabel.ForeColor = Color.Green;
               itemDropDownList.Items.Clear();
               itemDropDownList.Items.Insert(0, new ListItem("Select a Item"));
               
            }
            else
            {
                errorLabel.Text = "Please check all the field";
                errorLabel.ForeColor = Color.Red;

            }
        }
    }
}