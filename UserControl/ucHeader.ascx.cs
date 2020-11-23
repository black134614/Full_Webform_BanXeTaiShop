using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserControl_ucMainMenu : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadProductData();
            LoadNewsData();
        }
    }
    public void LoadProductData()
    {
        DBEntities db = new DBEntities();
        var query = from d in db.MainCategories
                    where d.Status == true && d.IsDelete == false
                    orderby d.Position
                    select new
                    {
                        ID = d.MainCategoryID,
                        d.Title,
                        sub = (from s in db.Categories
                               where s.MainCategoryID == d.MainCategoryID && s.Status == true && s.IsDelete == false
                               select new
                               {
                                   s.Title,
                                   s.Description,
                                   ID = s.CategoryID
                               })
                    };
        Repeater_ProductCategory.DataSource = query.ToList();
        Repeater_ProductCategory.DataBind();
    }
    public void LoadNewsData()
    {
        DBEntities db = new DBEntities();
        var query = from d in db.NewsMainCategories
                    where d.Status == true && d.IsDelete == false
                    select new
                    {
                        ID = d.NewsMainCategoryID,
                        d.Title,
                        sub = (from s in db.NewsCategories
                               where s.NewsMainCategoryID == d.NewsMainCategoryID && s.Status == true && s.IsDelete == false
                               select new
                               {
                                   s.Title,
                                   s.Description,
                                   ID = s.NewsCategoryID
                               })
                    };
        Repeater_NewsCategory.DataSource = query.ToList();
        Repeater_NewsCategory.DataBind();
    }
}