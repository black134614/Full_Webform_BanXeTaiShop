using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class NewsDetail : System.Web.UI.Page
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
        int ncID = 0;
        int nID = 0;
        int.TryParse(Request.QueryString["ncID"], out ncID);
        int.TryParse(Request.QueryString["nID"], out nID);
        //2 truong hop sai ID, Dung ID
        if (nID == 0)
        {
            Response.Redirect("404.html");
        }
        else
        {
            // 2 truong hop : tim dc id , khong tim dc id
            DBEntities db = new DBEntities();
            var query = from d in db.News
                        where d.Status == true && d.IsDelete == false && d.NewsID == nID
                        select new
                        {
                            d.Title,
                            d.Description,
                            d.Avatar,
                            d.Detail,
                            d.Keywords,
                            Relative = (from s in db.Relatives
                                        where s.NewsID == d.NewsID && s.Status == true
                                        select new
                                        {
                                            Product = (from ss in db.Products
                                                    where ss.ProductID == s.ProductID && ss.Status == true && ss.IsDelete == false
                                                    select new
                                                    {
                                                        ss.Title,
                                                        cID = ss.CategoryID,
                                                        ID = ss.ProductID,
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
        int ncID = 0;
        int nID = 0;
        int.TryParse(Request.QueryString["ncID"], out ncID);
        int.TryParse(Request.QueryString["nID"], out nID);
        // da co loaddata kiem id va cid
        // ở đây sẽ kiểm cid va id có hợp lệ
        // k cần điều kiện where :D
        DBEntities db = new DBEntities();
        var query = from d in db.NewsCategories
                    where d.NewsCategoryID == ncID
                    select new
                    {
                        d.Title,
                        cID = d.NewsCategoryID,
                        Product = (from s in db.News
                                   where s.NewsID == nID
                                   select new
                                   {
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