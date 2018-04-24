<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="News.aspx.cs" Inherits="pages_news_News" %>

<%@ Register TagPrefix="my" TagName="MainMenu" Src="~/moduls/MainMenu.ascx" %>
<%@ Register TagPrefix="my" TagName="Footer" Src="~/moduls/Footer.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Menu" Runat="Server">
    <my:MainMenu ID="MainMenu" runat="server" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">
    <!-- Page Content -->
    <div class="container">

        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">News
                    <small><%=DateTime.Now.ToString("dd-MM-yyyy HH:mm:ss") %></small>
                </h1>
                <ol class="breadcrumb">
                    <li><a href="index.html">Home</a>
                    </li>
                    <li class="active">Blog Home Two</li>
                </ol>
            </div>
        </div>
        <!-- /.row -->
            
        
        <asp:ListView ID="ListView1" runat="server" DataSourceID="SDS_News">
        <ItemTemplate>
        <!-- Blog Post Row -->
        
        <div class="row">
            <div class="col-md-1 text-center">
                <p><i class="fa fa-camera fa-4x"></i>
                </p>
                <p>June 17, 2014</p>
            </div>
            <div class="col-md-5">
                <a href="NewsArticle.aspx">
                    <img class="img-responsive img-hover" src="~/template_images/News/News1.jpg" alt="" runat="server"/>
                </a>
            </div>
            <div class="col-md-6">
                <h3>
                    <a href="NewsArticle.aspx"><%# Eval ("Title") %></a>
                </h3>
                <p>by <a href="#">Start Bootstrap</a>
                </p>
                <p><%# Eval ("Content") %></p>
                <a class="btn btn-primary" href="NewsArticle.aspx">Read More <i class="fa fa-angle-right"></i></a>
            </div>
        </div>
            <hr/>
        <!-- /.row -->

        </ItemTemplate>
        </asp:ListView>
       
        <hr/>
        <asp:SqlDataSource runat="server" ID="SDS_News" ConnectionString='<%$ ConnectionStrings:CS %>' DeleteCommand="DELETE FROM [News] WHERE [Id] = @Id" InsertCommand="INSERT INTO [News] ([Title], [Author], [Content], [CreateDate], [Image]) VALUES (@Title, @Author, @Content, @CreateDate, @Image)" SelectCommand="SELECT * FROM [News] ORDER BY [CreateDate]" UpdateCommand="UPDATE [News] SET [Title] = @Title, [Author] = @Author, [Content] = @Content, [CreateDate] = @CreateDate, [Image] = @Image WHERE [Id] = @Id">
            <DeleteParameters>
                <asp:Parameter Name="Id" Type="Int32"></asp:Parameter>
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Title" Type="String"></asp:Parameter>
                <asp:Parameter Name="Author" Type="String"></asp:Parameter>
                <asp:Parameter Name="Content" Type="String"></asp:Parameter>
                <asp:Parameter Name="CreateDate" Type="DateTime"></asp:Parameter>
                <asp:Parameter Name="Image" Type="String"></asp:Parameter>
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Title" Type="String"></asp:Parameter>
                <asp:Parameter Name="Author" Type="String"></asp:Parameter>
                <asp:Parameter Name="Content" Type="String"></asp:Parameter>
                <asp:Parameter Name="CreateDate" Type="DateTime"></asp:Parameter>
                <asp:Parameter Name="Image" Type="String"></asp:Parameter>
                <asp:Parameter Name="Id" Type="Int32"></asp:Parameter>
            </UpdateParameters>
        </asp:SqlDataSource>
        <hr/>
        <!-- Pager -->
        <div class="row">
            <ul class="pager">
                <li class="previous"><a href="#">&larr; Older</a>
                </li>
                <li class="next"><a href="#">Newer &rarr;</a>
                </li>
            </ul>
        </div>
        <!-- /.row -->
        <hr/>
    </div>
    <!-- /.container -->
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Footer" Runat="Server">
      <my:Footer ID="Footer" runat="server" />
</asp:Content>

