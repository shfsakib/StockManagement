using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using StockManagementWebApp.DAL.Gateway;
using StockManagementWebApp.DAL.Model;

namespace StockManagementWebApp.BLL
{
    public class CategoryManager
    {
        CategoryGateway categoryGateway = new CategoryGateway();

        public string Save(CategoryModel categoryModel)
        {
            if (categoryGateway.IsRegNoExist(categoryModel.CategoryName))
            {
                return "Category Name Already Exist";
            }
            else
            {
                int rowAffect = categoryGateway.Save(categoryModel);

                if (rowAffect > 0)
                {
                    return "Save Successful";
                }
                else
                {
                    return "Save Failed";
                }
            }


        }

        public List<CategoryModel> getAllCategory()
        {
           return categoryGateway.GetAllCategory();
        }
        public int GenerateId(CategoryModel categoryModel)
        {
            int SL = categoryGateway.GenerateId(categoryModel);
           
            return SL;
        }

        public CategoryModel GetAllcategoryById(int id)
        {
            return categoryGateway.GetAllCategoryById(id);
        }
        public string updateByID(CategoryModel categoryModel)
        {
            int rowAffect = categoryGateway.updateAllCategory(categoryModel);

            if (rowAffect > 0)
            {
                return "Update Successful";
            }
            else
            {
                return "Update Failed";
            }
        }
        //public string DeleteById(int id)
        //{
        //    int rowAffect = categoryGateway.DeleteById(id);
        //    if (rowAffect > 0)
        //    {
        //        return "Delete Successful";
        //    }
        //    else
        //    {
        //        return "Delete Failed";
        //    }
        //}
    }
}