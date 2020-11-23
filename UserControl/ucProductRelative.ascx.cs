using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserControl_ucProductRelative : System.Web.UI.UserControl
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
        int cID = 0;
        int ID = 0;
        int.TryParse(Request.QueryString["cID"], out cID);
        int.TryParse(Request.QueryString["ID"], out ID);
        //2 truong hop sai ID, Dung ID
        if (cID == 0)
        {
            Response.Redirect("404.html");
        }
        else
        {
            DBEntities db = new DBEntities();
            var query = from d in db.Categories
                        where d.Status == true && d.IsDelete == false && d.CategoryID == cID
                        select new
                        {
                            d.Title,
                            cID = d.CategoryID,
                            Product = (from s in db.Products
                                       where s.Status == true && s.IsDelete == false && s.CategoryID == cID && s.ProductID != ID
                                       select new
                                       {
                                           ID = s.ProductID,
                                           cID = s.CategoryID,
                                           s.Title,
                                           s.Description,
                                           s.Avatar,
                                           s.OriginalPrice,
                                           s.SalePrice,
                                           s.Prepay,
                                           firstImage = (from ss in db.ProductPreviews
                                                         where ss.ProductID == s.ProductID
                                                         orderby ss.ProductPreviewID
                                                         select new
                                                         {
                                                             ID = ss.ProductID,
                                                             ss.Title,
                                                             ss.Link,
                                                             ss.Description,
                                                         }).Take(1),
                                           listImages = (from ss in db.ProductPreviews
                                                         where ss.ProductID == s.ProductID
                                                         orderby ss.ProductPreviewID
                                                         select new
                                                         {
                                                             ID = ss.ProductID,
                                                             ss.Title,
                                                             ss.Link,
                                                             ss.Description,
                                                         }).Skip(1)

                                       })
                        };
            if (query.Count() == 0)
            {
                Response.Redirect("404.html");
            }
            Repeater_Main.DataSource = query.ToList();
            Repeater_Main.DataBind();
        }
    }
}