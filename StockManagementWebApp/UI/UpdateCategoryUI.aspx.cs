using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using StockManagementWebApp.BLL;
using StockManagementWebApp.DAL.Model;

namespace StockManagementWebApp.UI
{
    public partial class UpdateCatagoryUI : System.Web.UI.Page
    {
        CategoryManager categoryManager=new CategoryManager();
        private CategoryModel categoryModel;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Email"] == null)
            {

                Response.Redirect("/UI/IndexUI.aspx");
            }
            if (IsPostBack == false)
            {
                int id = Convert.ToInt32(Request.QueryString["Id"]);
                categoryModel = categoryManager.GetAllcategoryById(id);
                if (categoryModel != null)
                {
                    LoadFormWithCatagory(categoryModel);
                }
            }

        }
        private void LoadFormWithCatagory(CategoryModel catagoryModel)
        {
            idHiddentField.Value = catagoryModel.Sl.ToString();
            catagoryNameTextBox.Text = catagoryModel.CategoryName;
           
        }

        protected void updateButton_OnClick(object sender, EventArgs e)
        {
            categoryModel = new CategoryModel();
            categoryModel.Sl = Convert.ToInt32(idHiddentField.Value);

            categoryModel.CategoryName = catagoryNameTextBox.Text;

            if (catagoryNameTextBox.Text!="")
            {
                string message = categoryManager.updateByID(categoryModel);

                Response.Write("<script>alert('" + message + "')</script>");
                catagoryNameTextBox.Text = "";
            }
            else
            {
                Response.Write("<script>alert('null cannot be insert!')</script>");
                
            }
           

        }

        protected void backButton_OnClick(object sender, EventArgs e)
        {
            Response.Redirect("/UI/CategoryInformationUI.aspx");
        }

       
    }
}