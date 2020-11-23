using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadData();
            LoadBreabrumb();
        }
    }
    public void LoadData()
    {
        int cID = 0;
        int ID = 0;
        int.TryParse(Request.QueryString["cID"], out cID);
        int.TryParse(Request.QueryString["ID"], out ID);
        //2 truong hop sai ID, Dung ID
        if (ID == 0)
        {
            Response.Redirect("404.html");
        }
        else
        {
            // 2 truong hop : tim dc id , khong tim dc id
            DBEntities db = new DBEntities();
            var query = from d in db.Products
                        where d.Status == true && d.IsDelete == false && d.ProductID == ID
                        select new
                        {
                            d.Title,
                            d.Description,
                            d.Avatar,
                            d.OriginalPrice,
                            d.SalePrice,
                            d.Prepay,
                            ProductCost = (from s in db.ProductCosts
                                           where s.ProductID == d.ProductID
                                           select new { 
                                                s.VAT,
                                                s.PhiTruocBa,
                                                s.PhiDangKi,
                                                s.PhiKiemDinh,
                                                s.PhiSuDungDuongBo,
                                                s.BaoHiemTNDS,
                                                s.Locator,
                                                s.TotalForRun
                                           }),
                            ProductDetai = (from s in db.ProductDetails
                                            where s.ProductID == d.ProductID
                                            select s),
                            ProductTech = (from s in db.ProductTechInfoes
                                               where s.ProductID == d.ProductID
                                               select s),
                            ProductRelative = (from s in db.ProductRelatives
                                               where s.ProductID == d.ProductID
                                               select s),
                            Relative = (from s in db.Relatives
                                        where s.ProductID == d.ProductID && s.Status == true
                                        select new
                                        {
                                            News = (from ss in db.News
                                                    where ss.NewsID == s.NewsID && ss.Status == true && ss.IsDelete == false
                                                    select new { 
                                                        ss.Title,
                                                        ncID = ss.NewsCategoryID,
                                                        nID = ss.NewsID,
                                                        ss.Description
                                                    })
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
    public void LoadBreabrumb()
    {
        int cID = 0;
        int ID = 0;
        int.TryParse(Request.QueryString["cID"], out cID);
        int.TryParse(Request.QueryString["ID"], out ID);
        // da co loaddata kiem id va cid
        // ở đây sẽ kiểm cid va id có hợp lệ
        // k cần điều kiện where :D
        DBEntities db = new DBEntities();
        var query = from d in db.Categories
                    where d.CategoryID == cID
                    select new
                    {
                        d.Title,
                        cID = d.CategoryID,
                        Product = (from s in db.Products
                                   where s.ProductID == ID
                                   select new { 
                                    s.Title
                                   })
                    };
        if (query.Count() == 0)
        {
            Response.Redirect("404.html");
        }
        Repeater_breadcrumb.DataSource = query.ToList();
        Repeater_breadcrumb.DataBind();
    }

}