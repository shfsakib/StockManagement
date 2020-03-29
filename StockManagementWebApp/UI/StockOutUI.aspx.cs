using System;
using System.Collections.Generic;
using System.Data;
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
    public partial class StockOutUI : System.Web.UI.Page
    {

        StockOutManager stockOutManager = new StockOutManager();
        StockOutViewModel stockOutViewModel = new StockOutViewModel();
        StockOutModel stockOutModel = new StockOutModel();
        DataTable dataTable;
        DataRow dataRow;
        private int id;
        private double availableQuantity;
        private double stockInQuantity;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Email"] == null)
            {

                Response.Redirect("/UI/IndexUI.aspx");
            }
            if (ViewState["dataGrid"] == null)
            {
                dataTable = new DataTable();
                dataTable.Columns.Add("Company", typeof(string));
                dataTable.Columns.Add("CompanySl", typeof(int));
                dataTable.Columns.Add("ItemName", typeof(string));
                dataTable.Columns.Add("ItemSl", typeof(int));
                dataTable.Columns.Add("Quantity", typeof(int));
                dataTable.Columns.Add("InTime", typeof(string));
                ViewState["dataGrid"] = dataTable;
            }


            if (!IsPostBack)
            {
                CompanyList(stockOutViewModel);
                ItemListByCompany(stockOutViewModel);

                //GridPostBack();
                if (itemDropDownList.Text == "Select a Item")
                {
                    stockOutViewModel.ItemName = itemDropDownList.Text;
                }
                FillGrid();
                Search();
            }



        }

        private void FillGrid()
        {
          
            dataTable = new DataTable();
            dataTable = (DataTable)ViewState["dataGrid"];
            stockOutQuantityGridView.DataSource = dataTable;
            stockOutQuantityGridView.DataBind();

        }

        private void CheckRow(Int64 itemSL)
        {
            DataTable dataTable = (DataTable)ViewState["dataGrid"];
            
            int rowCount = stockOutQuantityGridView.Rows.Count;
            for (int j = 0; j < rowCount; j++)
            {
                string itemSerial = dataTable.Rows[j][3].ToString();
                if (Convert.ToInt16(itemSerial) == itemSL)
                {
                    dataTable.Rows[j].Delete();
                    break;
                }
            }
        }
        private void CreateRow()
        {
            if (itemDropDownList.Text!="Select a Item")
            CheckRow(Convert.ToInt64(itemDropDownList.Text));   
            dataTable = new DataTable();
            dataTable = (DataTable)ViewState["dataGrid"];

            dataRow = dataTable.NewRow();
            DateTime dateTime = DateTime.Now;
           
                dataRow["Company"] = companyDropDownList.SelectedItem;
                dataRow["CompanySl"] = companyDropDownList.SelectedValue;
                dataRow["ItemName"] = itemDropDownList.SelectedItem;
                dataRow["ItemSl"] = itemDropDownList.SelectedValue;
                dataRow["Quantity"] = stockOutQuantityTextBox.Text.Trim();

                dataRow["InTime"] = dateTime.ToString("MM-dd-yyyy");
           
            
            dataTable.Rows.Add(dataRow);

            ViewState["dataGrid"] = dataTable;
            FillGrid();

        }


        private void CompanyList(StockOutViewModel stockOutViewModel)
        {
            companyDropDownList.DataSource = stockOutManager.GetAllCompanyFromStock(stockOutViewModel);


            companyDropDownList.DataTextField = "CompanyName";
            companyDropDownList.DataValueField = "CompanySl";
            companyDropDownList.DataBind();
            companyDropDownList.Items.Insert(0, new ListItem("Select a Company"));


        }
        private void ItemListByCompany(StockOutViewModel stockOutViewModel)
        {

            itemDropDownList.DataSource = stockOutManager.GetAllItemByCompany(stockOutViewModel);
            itemDropDownList.DataTextField = "ItemName";
            itemDropDownList.DataValueField = "ItemSl";
            itemDropDownList.DataBind();
            itemDropDownList.Items.Insert(0, new ListItem("Select a Item"));

        }

        protected void CompanyDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (companyDropDownList.SelectedIndex>0)
            {
                stockOutViewModel.CompanyName = companyDropDownList.Text;
                stockOutViewModel.CompanySl = Convert.ToInt32(companyDropDownList.SelectedValue);
                ItemListByCompany(stockOutViewModel);
                reorderLevelTextBox.Text = "0";
                availabelQuantityTextBox.Text = "0";
                stockOutQuantityTextBox.Text = "";
                errorLabel.Text = "";

            }
            else
            {

                stockOutViewModel.CompanyName = "";

                stockOutViewModel.CompanySl = 0;
                itemDropDownList.Items.Clear();
                itemDropDownList.Items.Insert(0, new ListItem("Select a Item"));
                reorderLevelTextBox.Text = "0";
                availabelQuantityTextBox.Text = "0";
                stockOutQuantityTextBox.Text = "";



            }

        }
        private void GetReorderByItem(StockOutViewModel stockOutViewModel)
        {

            stockOutViewModel = stockOutManager.GetReorderByItem(stockOutViewModel);
            //availableQuantityTextBox.Text = stockInModel.AvailableQuantity.ToString();
            if (stockOutViewModel == null)
            {
                reorderLevelTextBox.Text = "0";

            }

            else
            {
                reorderLevelTextBox.Text = stockOutViewModel.ReorderLevel.ToString();
            }


        }
        private void GetQuantityByItem(StockOutViewModel stockOutViewModel)
        {

            stockOutViewModel = stockOutManager.GetQuantityByItem(stockOutViewModel);

            if (stockOutViewModel == null)
                availabelQuantityTextBox.Text = "0";
            else
                availabelQuantityTextBox.Text = stockOutViewModel.Quantity.ToString();


        }

        protected void ItemDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (itemDropDownList.SelectedIndex>0 && companyDropDownList.SelectedIndex>0)
            {
                stockOutViewModel.ItemName = itemDropDownList.Text;

                stockOutModel.ItemSl = Convert.ToInt32(itemDropDownList.SelectedValue);
                stockOutViewModel.CompanySl = Convert.ToInt32(companyDropDownList.SelectedValue);
            }
            else
            {
                stockOutViewModel.ItemName = "";

                stockOutModel.ItemSl = 0;
                stockOutViewModel.CompanySl = 0;
                stockOutQuantityTextBox.Text = "";
            }
            if (stockOutViewModel != null)
            {

                GetReorderByItem(stockOutViewModel);
                GetQuantityByItem(stockOutViewModel);
            }
        }

        private void IdGenerate()
        {
            int Sl = 1;

            for (int i = 0; i < stockOutQuantityGridView.Rows.Count; i++)
            {
                Sl++;
            }

            slLabel.Text = Sl.ToString();
        }

       
     

        protected void addButton_Click(object sender, EventArgs e)
        {
            if (availabelQuantityTextBox.Text == "" && stockOutQuantityTextBox.Text.Trim() == string.Empty && companyDropDownList.Text == "Select a Company" && itemDropDownList.Text == "Select a Item" && availabelQuantityTextBox.Text == "")
            {
                errorLabel.Text = "Input proper amount of stock";
                errorLabel.ForeColor = Color.Red;
            }
            else
            {

                if (availabelQuantityTextBox.Text != "" && stockOutQuantityTextBox.Text.Trim() != string.Empty && companyDropDownList.SelectedIndex>0 && itemDropDownList.SelectedIndex>0)
                {
                    double availableQuantity = Convert.ToDouble(availabelQuantityTextBox.Text);
                    double stockInQuantity = Convert.ToDouble(stockOutQuantityTextBox.Text);
                    if (availableQuantity > stockInQuantity)
                    {

                        AddButtonCommand();


                    }
                    else
                    {
                        errorLabel.Text = "Input proper amount of stock";
                        errorLabel.ForeColor = Color.Red;

                    }
                }
                else
                {
                    errorLabel.Text = "Input proper amount of stock";
                    errorLabel.ForeColor = Color.Red;
                }

            }


        }
       
        private void AddButtonCommand()
        {
            //CreatNewRow();

            CreateRow();
            errorLabel.Text = "";
            CompanyList(stockOutViewModel);
            itemDropDownList.Items.Clear();
            itemDropDownList.Items.Insert(0, new ListItem("Select a Item"));
            reorderLevelTextBox.Text = "";
            availabelQuantityTextBox.Text = "";
            stockOutQuantityTextBox.Text = "";

        }
        protected void editLinkButton_OnClick(object sender, EventArgs e)
        {

        }


        private void InsertMultipleRowSale()
        {
            
                foreach (GridViewRow gridViewRow in stockOutQuantityGridView.Rows)
                {
                    stockOutModel.ItemSl = Convert.ToInt32(((Label)gridViewRow.FindControl("itemSlLabel")).Text);

                    stockOutModel.Quantity = Convert.ToInt32(((Label)gridViewRow.FindControl("quantityLabel")).Text);
                    stockOutModel.Type = "Sale";
                    stockOutModel.InTime = ((Label)gridViewRow.FindControl("inTimeLabel")).Text;
                    string message = stockOutManager.SaveAllSaleRowFromGrid(stockOutModel);
                    errorLabel.Text = message;
                    errorLabel.ForeColor = Color.Green;
            Response.Write("<script>alert('Sale successful')</script>");

                    stockOutQuantityGridView.DataSource = null;
                    stockOutQuantityGridView.DataBind();
                }

        }
        protected void sellButton_Click(object sender, EventArgs e)
        {

            InsertMultipleRowSale();
            ViewState["dataGrid"] = null;


          // Response.Redirect("/UI/StockOutUI.aspx");

        }

        private void insertMultipleRowDamage()
        {
            foreach (GridViewRow gridViewRow in stockOutQuantityGridView.Rows)
            {
                stockOutModel.ItemSl = Convert.ToInt32(((Label)gridViewRow.FindControl("itemSlLabel")).Text);

                stockOutModel.Quantity = Convert.ToInt32(((Label)gridViewRow.FindControl("quantityLabel")).Text);
                stockOutModel.Type = "Damage";
                stockOutModel.InTime = ((Label)gridViewRow.FindControl("inTimeLabel")).Text;

                string message = stockOutManager.SaveAllDamageRowFromGrid(stockOutModel);
                errorLabel.Text = message;
                errorLabel.ForeColor = Color.Green;
                Response.Write("<script>alert('Damage successful')</script>");

                stockOutQuantityGridView.DataSource = null;
                stockOutQuantityGridView.DataBind();


            }

        }

        protected void damageButton_Click(object sender, EventArgs e)
        {
            insertMultipleRowDamage();
            //stockOutQuantityGridView.DataSource = null;
            //stockOutQuantityGridView.DataBind();
            ViewState["dataGrid"] = null;

          
            //Response.Redirect("/UI/StockOutUI.aspx");



        }
        private void insertMultipleRowLoss()
        {
            foreach (GridViewRow gridViewRow in stockOutQuantityGridView.Rows)
            {
                stockOutModel.ItemSl = Convert.ToInt32(((Label)gridViewRow.FindControl("itemSlLabel")).Text);
                stockOutModel.Quantity = Convert.ToInt32(((Label)gridViewRow.FindControl("quantityLabel")).Text);
                stockOutModel.Type = "Loss";
                stockOutModel.InTime = ((Label)gridViewRow.FindControl("inTimeLabel")).Text;

                string message = stockOutManager.SaveAllLossRowFromGrid(stockOutModel);

                errorLabel.Text = message;
                errorLabel.ForeColor = Color.Green;
                Response.Write("<script>alert('Lost successful')</script>");

                stockOutQuantityGridView.DataSource = null;
                stockOutQuantityGridView.DataBind();


            }

        }


        protected void lostButton_OnClick(object sender, EventArgs e)
        {
            insertMultipleRowLoss();
            //stockOutQuantityGridView.DataSource = null;
            //stockOutQuantityGridView.DataBind();
            ViewState["dataGrid"] = null;

           //Response.Redirect("/UI/StockOutUI.aspx");
        }

        protected void deleteLinkButton_OnClick(object sender, EventArgs e)
        {
            LinkButton linkButton = (LinkButton)sender;
            DataControlFieldCell cell = (DataControlFieldCell)linkButton.Parent;
            GridViewRow row = (GridViewRow)cell.Parent;
            HiddenField idHiddenField = (HiddenField)row.FindControl("idHiddenField");
            int id = Convert.ToInt32(idHiddenField.Value);

            DataTable dataTable = (DataTable)ViewState["dataGrid"];
            int rowIndex = id;

            if (dataTable.Rows.Count >= 0)
            {
                dataTable.Rows[rowIndex].Delete();
                stockOutQuantityGridView.DataSource = dataTable;
                stockOutQuantityGridView.DataBind();
            }
        }

        protected void stockOutQuantityGridView_RowEditing(object sender, GridViewEditEventArgs e)
        {
            stockOutQuantityGridView.EditIndex = e.NewEditIndex;
            FillGrid();
        }



        protected void stockOutQuantityGridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            dataTable = new DataTable();
            dataTable = (DataTable)ViewState["dataGrid"];
            dataTable.Rows[e.RowIndex]["Quantity"] =
                ((TextBox)stockOutQuantityGridView.Rows[e.RowIndex].FindControl("quantityGridTextBox")).Text;
            ViewState["dataGrid"] = dataTable;
            stockOutQuantityGridView.EditIndex = -1;
            FillGrid();

        }

        protected void stockOutQuantityGridView_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            stockOutQuantityGridView.EditIndex = -1;
            FillGrid();
        }

        private void Search()
        {
            dataTable = new DataTable();
            dataTable = (DataTable)ViewState["dataGrid"];
            DataView dataView = new DataView(dataTable);
            dataView.RowFilter = "ItemName like '%" + searchTextBox.Text + "%' ";
            stockOutQuantityGridView.DataSource = dataView;
            stockOutQuantityGridView.DataBind();
        }



        protected void searchTextBox_TextChanged(object sender, EventArgs e)
        {
            Search();
        }


        protected void signOutButton_OnClick(object sender, EventArgs e)
        {
            Session["Email"] = null;
            Response.Redirect("/UI/IndexUI.aspx");
        }
    }
}