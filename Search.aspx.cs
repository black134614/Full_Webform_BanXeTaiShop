using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Search : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        LoadData();
    }
    public void LoadData()
    {
        message.Visible = false;
        countResult.Visible = false;
        newsSession.Visible = false;

        string keyword = null;
        keyword = Request.QueryString["KeyWord"];
        if (keyword != null)
        {
            message.Visible = true;
            countResult.Visible = true;
            inputKeyWord.Value = keyword;

            keyword = keyword.Replace("+", " ");
            keyword = keyword.Replace("-", " ");

            lableKeyWord.Text = keyword;

            DBEntities db = new DBEntities();
            var queryProduct = from s in db.Products
                               where s.Status == true && s.IsDelete == false
                                     && (s.Title.Contains(keyword) || s.Description.Contains(keyword))
                               orderby s.CreateTime descending
                               select new
                               {
                                   cID = s.CategoryID,
                                   ID = s.ProductID,
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
                               };

            Repeater_Product.DataSource = queryProduct.ToList();
            Repeater_Product.DataBind();

            //Đổ dữ liệu news
            var queryNews = from s in db.News
                            where s.Status == true && s.IsDelete == false
                                    && (s.Title.Contains(keyword) || s.Description.Contains(keyword) || s.Detail.Contains(keyword))
                            orderby s.CreateTime
                            select new
                            {
                                ncID = s.NewsCategoryID,
                                nID = s.NewsID,
                                s.Title,
                                s.Description,
                                s.Avatar
                            };
            Repeater_News.DataSource = queryNews.ToList();
            Repeater_News.DataBind();

            //check count row with product and news
            var productCount = queryProduct.Count();
            var newsCount = queryNews.Count();
            //show news session
            if (newsCount > 0)
            {
                newsSession.Visible = true;
            }
            //show count ptoduct
            if (productCount == 0)
            {
                productResult.Visible = false;
            }
            else
            {
                productResult.InnerHtml = productCount.ToString() + " sản phẩm";
            }
            //show count news
            if (newsCount == 0)
            {
                newsResult.Visible = false;
            }
            else
            {
                newsResult.InnerHtml = " " + newsCount.ToString() + " bài viết";
            }

            if (productCount == 0 && newsCount == 0)
            {
                countResult.InnerHtml = "Có 0 kết quả tìm kiếm. Bạn có thể liên hệ với chúng tôi qua zalo hoặc facebook của chúng tôi để được tư vấn thêm.";
            }
        }
        else
        {
            message.InnerHtml = "Mời bạn nhập từ khóa tìm kiếm";
            message.Visible = true;
        }
    }

}