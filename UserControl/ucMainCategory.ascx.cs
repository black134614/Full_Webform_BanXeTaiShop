using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserControl_ucMainCategory : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadData();
        }
    }
    public void LoadData()
    {
        DBEntities db = new DBEntities();
        var query = from d in db.MainCategories
                    where d.Status == true && d.IsDelete == false && d.IsPrimary == true
                    select new
                    {
                        d.Title,
                        Category = (from s in db.Categories
                                    where s.MainCategoryID == d.MainCategoryID
                                    select new { 
                                       cID = s.CategoryID,
                                       s.Title,
                                       s.Avatar,
                                       s.Description
                                    })
                    };
        Repeater_Main.DataSource = query.ToList();
        Repeater_Main.DataBind();
    }
}