using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserControl_ucTopProduct : System.Web.UI.UserControl
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
                                    where s.MainCategoryID == d.MainCategoryID && s.Status == true && s.IsDelete == false
                                    select new
                                    {
                                        product = (from ss in db.Products
                                                       //show == true la hien thi tren top nhe! show == true => show on topProduct
                                                   where ss.CategoryID == s.CategoryID && ss.Status == true && ss.IsDelete == false && ss.Show == true
                                                   select new
                                                   {
                                                       ss.Title,
                                                       cID = ss.CategoryID,
                                                       ID = ss.ProductID,
                                                       ss.Description,
                                                       ss.Avatar,
                                                       ss.OriginalPrice,
                                                       ss.SalePrice,
                                                       ss.Prepay,
                                                       firstImage = (from sss in db.ProductPreviews
                                                                     where sss.ProductID == ss.ProductID
                                                                     orderby sss.ProductPreviewID
                                                                     select new
                                                                     {
                                                                         ID = sss.ProductID,
                                                                         sss.Title,
                                                                         sss.Link,
                                                                         sss.Description,
                                                                     }).Take(1),
                                                        listImages = (from sss in db.ProductPreviews
                                                                      where sss.ProductID == ss.ProductID
                                                                      orderby sss.ProductPreviewID
                                                                      select new
                                                                      {
                                                                          ID = sss.ProductID,
                                                                          sss.Title,
                                                                          sss.Link,
                                                                          sss.Description,
                                                                      }).Skip(1)
                                                   }).Take(12)
                                    })
                    };
        Repeater_Main.DataSource = query.ToList();
        Repeater_Main.DataBind();
    }
}