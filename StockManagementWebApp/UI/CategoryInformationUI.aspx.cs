using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using StockManagementWebApp.BLL;
using StockManagementWebApp.DAL.Model;

namespace StockManagementWebApp.UI
{
    public partial class CatagoryEntry : System.Web.UI.Page
    {
        CategoryManager catagoryManager = new CategoryManager();
        CategoryModel catagoryModel = new CategoryModel();

        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["Email"] == null)
            {

                Response.Redirect("/UI/IndexUI.aspx");
            }
            
            IdGenerate(catagoryModel);
            categoryGridView.DataSource = catagoryManager.getAllCategory();
            categoryGridView.DataBind();


        }

        private void IdGenerate(CategoryModel catagoryModel)
        {
            idLabel.Text = catagoryManager.GenerateId(catagoryModel).ToString();
        }
        protected void saveButton_Click(object sender, EventArgs e)
        {
            if (categoryNameTextBox.Text != "")
            {
                IdGenerate(catagoryModel);
                DateTime dateTime = DateTime.Now;
                catagoryModel.Sl = Convert.ToInt32(idLabel.Text);
                catagoryModel.CategoryName = categoryNameTextBox.Text;
                catagoryModel.InTime = dateTime.ToString("MM-dd-yyyy");
                string message = catagoryManager.Save(catagoryModel);
                categoryErrorLabel.Text = message;
                categoryErrorLabel.ForeColor = Color.Green;

                //Response.Redirect("CatagoryInformationUI.aspx");
                categoryNameTextBox.Text = "";
                categoryGridView.DataSource = catagoryManager.getAllCategory();
                categoryGridView.DataBind();

            }
            else
            {
                categoryErrorLabel.Text = "Null can't be insert";
                categoryErrorLabel.ForeColor = Color.Red;

            }



        }

        //protected void updateButton_OnClick(object sender, EventArgs e)
        //{
        //    Button button = (Button)sender;
        //    DataControlFieldCell cell = (DataControlFieldCell)button.Parent;
        //    GridViewRow row = (GridViewRow)cell.Parent;
        //    HiddenField idHiddenField = (HiddenField)row.FindControl("idHiddenField");
        //    int id = Convert.ToInt32(idHiddenField.Value);

        //    Response.Redirect("UpdataCatagoryUI.aspx?Id=" + id);
        //}


        //protected void deleteButton_OnClick(object sender, EventArgs e)
        //{
        //    LinkButton linkButton = (LinkButton)sender;
        //    DataControlFieldCell cell = (DataControlFieldCell)linkButton.Parent;
        //    GridViewRow row = (GridViewRow)cell.Parent;
        //    HiddenField idHiddenField = (HiddenField)row.FindControl("idHiddenField");
        //    int id = Convert.ToInt32(idHiddenField.Value);
        //    catagoryManager.DeleteById(id);

        //    catagoryGridView.DataSource = catagoryManager.getAllCatagory();
        //    catagoryGridView.DataBind();
        //    Response.Redirect("CatagoryInformationUI.aspx");

        //}
        protected void updateButton_OnClick(object sender, EventArgs e)
        {
            LinkButton linkButton = (LinkButton)sender;
            DataControlFieldCell cell = (DataControlFieldCell)linkButton.Parent;
            GridViewRow row = (GridViewRow)cell.Parent;
            HiddenField idHiddenField = (HiddenField)row.FindControl("idHiddenField");
            int id = Convert.ToInt32(idHiddenField.Value);

            Response.Redirect("/UI/UpdateCategoryUI.aspx?Id=" + id);
        }

        protected void categoryNameTextBox_TextChanged(object sender, EventArgs e)
        {
            categoryErrorLabel.Text = "";
        }
    }
}