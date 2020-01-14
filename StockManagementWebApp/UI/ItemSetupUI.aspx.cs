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
    public partial class ItemSetupUI : System.Web.UI.Page
    {
        ItemManager itemManager = new ItemManager();
        ItemViewModel itemViewModel = new ItemViewModel();
        ItemModel itemModel = new ItemModel();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Email"] == null)
            {

                Response.Redirect("/UI/IndexUI.aspx");
            }
            if (!IsPostBack)
            {
                CompanyList(itemViewModel);
                CatagoryList(itemViewModel);


            }
        }

        private void CompanyList(ItemViewModel itemViewModel)
        {
            companyDropDownList.DataSource = itemManager.GetAllComapany();
            companyDropDownList.DataValueField = "CompanySl";

            companyDropDownList.DataTextField = "COMPANYNAME";

            companyDropDownList.DataBind();
            companyDropDownList.Items.Insert(0, new ListItem("Select a Company"));


        }
        private void CatagoryList(ItemViewModel itemViewModel)
        {


            categoryDropDownList.DataSource = itemManager.GetAllCategory();

            categoryDropDownList.DataValueField = "CategorySl";
            categoryDropDownList.DataTextField = "CATEGORYNAME";
            categoryDropDownList.DataBind();
            categoryDropDownList.Items.Insert(0, new ListItem("Select a Category"));


        }

        protected void saveButton_OnClick(object sender, EventArgs e)
        {


            //if (categoryDropDownList.SelectedIndex > 0)
            //{
            //   
            //}
            //else
            //{
            //    errorLabel.Text = "Please fill all the field correctly!";
            //    errorLabel.ForeColor = Color.Red;
            //}
            if (itemNameTextBox.Text != "" && categoryDropDownList.SelectedIndex >0 && companyDropDownList.SelectedIndex >0)
            {
                
                

                itemModel.CompanyId = Convert.ToInt32(companyDropDownList.SelectedValue);
                itemModel.CategoryId = Convert.ToInt32(categoryDropDownList.SelectedValue);
                itemViewModel.ItemName = itemModel.ItemName = itemNameTextBox.Text;

                DateTime dateTime = DateTime.Now;
                itemViewModel.InTime = itemModel.InTime = dateTime.ToString("MM-dd-yyyy");
                if (reorderTextBox.Text == "")
                {
                    itemViewModel.ReorderLevel = itemModel.ReorderLevel = 0;

                }
                else
                {

                    itemViewModel.ReorderLevel = itemModel.ReorderLevel = Convert.ToInt32(reorderTextBox.Text);

                }
                string message = itemManager.Save(itemModel);

                //Response.Write("<script>alert('" + message + "')</script>");

                errorLabel.Text = message;
                errorLabel.ForeColor = Color.Green;




                //Response.Redirect("CompanyInformationUI.aspx");
            }
            //else if (!char.IsDigit(Convert.ToChar(reorderTextBox.Text.Length)))
            //{

                //    reorderErrorLabel.Text = "Reorder Level is invalid(Only Numbers)";
            //}


            else
            {
                errorLabel.Text = "Please fill all the field correctly!";
                errorLabel.ForeColor = Color.Red;

            }
            companyDropDownList.SelectedIndex = 0;
            categoryDropDownList.SelectedIndex = 0;
            itemNameTextBox.Text = "";
            reorderTextBox.Text = "";
        }

        protected void categoryDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            errorLabel.Text = "";
        }




    }
}