using System;
using System.Drawing;
using StockManagementWebApp.BLL;
using StockManagementWebApp.DAL.Model;

namespace StockManagementWebApp.UI
{
    public partial class ForgotPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void changeButton_Click(object sender, EventArgs e)
        {
            LogInManager logInManager=new LogInManager();
            LogInModel aLogInModel=new LogInModel();
            aLogInModel.Email = emailTextBox.Text;
            aLogInModel.Password = newPasswordTextBox.Text;
            aLogInModel.SecurityQuestion = securityQuestionList.Text;
            aLogInModel.Answer = answerTextBox.Text;
            if (emailTextBox.Text != "" && newPasswordTextBox.Text != "" && confirmPasswordTextBox.Text != "" && securityQuestionList.Text != "Select a Question" && answerTextBox.Text != "")
            {
                string message = logInManager.ForgotPassword(aLogInModel);
            if (newPasswordTextBox.Text==confirmPasswordTextBox.Text)
            {
                Response.Write("<script>alert('" + message + "')</script>");
                Clear();
            }
            else
            {
                mismatchLabel.Text = "Password are Mismatched!";
                mismatchLabel.ForeColor = Color.Red;

            }
            
            }
            else
            {
                Response.Write("<script>alert('Please fill all fields!')</script>");
                
            }
           
        }

        private void Clear()
        {
            emailTextBox.Text = newPasswordTextBox.Text = confirmPasswordTextBox.Text=mismatchLabel.Text = answerTextBox.Text = "";
            securityQuestionList.Text = "Select a Question";
        }
    }
}